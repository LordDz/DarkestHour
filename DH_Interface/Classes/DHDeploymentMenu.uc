//==============================================================================
// Darkest Hour: Europe '44-'45
// Darklight Games (c) 2008-2014
//==============================================================================

class DHDeploymentMenu extends ROGUIRoleSelection;

var DHGUIList   li_VehiclePools;
var DHGUIList   li_SpawnPoints;

var automated GUIImage  i_MapImage;

var float       VehiclePoolsUpdateTime;
var int         VehiclePoolIndex;
var array<int>  VehiclePoolIndices;

var float       SpawnPointsUpdateTime;
var int         SpawnPointIndex;

/*
function InitComponent(GUIController MyController, GUIComponent MyOwner)
{
    local DHGameReplicationInfo GRI;

    GRI = DHGameReplicationInfo(PlayerOwner.GameReplicationInfo);

    if (GRI == none)
    {
        return;
    }

    i_MapImage.Image = GRI.MapImage;

    super.InitComponent(MyController, MyOwner);
}
*/

function bool InternalOnClick(GUIComponent Sender)
{
    local ROPlayer player;

    player = ROPlayer(PlayerOwner());

    switch (sender)
    {
        case b_JoinAxis:
            ChangeDesiredTeam(AXIS_TEAM_INDEX);
            break;

        case b_JoinAllies:
            ChangeDesiredTeam(ALLIES_TEAM_INDEX);
            break;

        case b_Spectate:
            ChangeDesiredTeam(-1);
            break;

        case b_Continue:
            ChangeSpawn();
            break;

        case b_Disconnect:
            PlayerOwner().ConsoleCommand("disconnect");
            CloseMenu();
            break;

        case b_Score:
            if (player != none && ROHud(player.myHUD) != none)
                player.myHUD.bShowScoreBoard = !player.myHUD.bShowScoreBoard;
            CloseMenu();
            break;

        case b_Map:
            if (player != none && ROHud(player.myHUD) != none)
                ROHud(player.myHUD).ShowObjectives();
            CloseMenu();
            break;
    }

    if (bShowingConfigButtons)
    {
        switch (sender)
        {
            case b_StartNewGame:
                if (b_StartNewGame.bVisible)
                    Controller.OpenMenu(Controller.GetInstantActionPage());
                break;

            case b_ServerBrowser:
                Controller.OpenMenu("DH_Interface.DHServerBrowser");
                break;

            case b_AddFavorite:
                if (b_AddFavorite.bVisible && player != none)
                    player.ConsoleCommand("ADDCURRENTTOFAVORITES");
                break;

            case b_MapVoting:
                if (b_MapVoting.bVisible)
                    Controller.OpenMenu(Controller.MapVotingMenu);
                break;

            case b_KickVoting:
                if (b_MapVoting.bVisible)
                    Controller.OpenMenu(Controller.KickVotingMenu);
                break;

            case b_Communication:
                Controller.OpenMenu("ROInterface.ROCommunicationPage");
                break;

            case b_Configuration:
                Controller.OpenMenu("DH_Interface.DHSettingsPage_new");
                break;

            case b_ExitRO:
                Controller.OpenMenu(Controller.GetQuitPage());
                break;
        }
    }
    else
    {
        switch (sender)
        {
            case b_Equipment[0]:
                l_EquipmentDescription.setContent(equipmentDescriptions[0]);
                break;

            case b_Equipment[1]:
                l_EquipmentDescription.setContent(equipmentDescriptions[1]);
                break;

            case b_Equipment[2]:
                l_EquipmentDescription.setContent(equipmentDescriptions[2]);
                break;

            case b_Equipment[3]:
                l_EquipmentDescription.setContent(equipmentDescriptions[3]);
                break;
        }
    }

    return true;
}

event Timer()
{
    UpdateVehiclePools();
    UpdateSpawnPoints();
}

function UpdateVehiclePools()
{
    local int i, j;
    local string S;
    local DHPlayer C;
    local DHGameReplicationInfo DHGRI;
    local bool bIsEnabled;

    C = DHPlayer(PlayerOwner());

    if (C == none || DHPlayerReplicationInfo(C.PlayerReplicationInfo) == none)
    {
        return;
    }

    DHGRI = DHGameReplicationInfo(C.GameReplicationInfo);

    if (DHGRI == none)
    {
        return;
    }

    if (VehiclePoolsUpdateTime < DHGRI.VehiclePoolsUpdateTime)
    {
        //the vehicle pools were modified in such a way that requires
        //us to repopulate the list
        li_Roles.Clear();

        VehiclePoolIndices.Length = 0;

        for (i = 0; i < arraycount(DHGRI.VehiclePoolIsActives); ++i)
        {
            if (DHGRI.VehiclePoolIsActives[i] == 0 ||
                DHGRI.VehiclePoolVehicleClasses[i].default.VehicleTeam != C.GetTeamNum())
            {
                //do not display inactive pools or those not belonging to player's team
                continue;
            }

            li_Roles.Add(DHGRI.VehiclePoolVehicleClasses[i].default.VehicleNameString);

            Log("li_Roles.SetExtraAtIndex(" $ li_Roles.ItemCount - 1 $ ") =" @ i);

            li_Roles.SetExtraAtIndex(li_Roles.ItemCount - 1, "" $ i);

            VehiclePoolIndices[VehiclePoolIndices.Length] = i;
        }

        VehiclePoolsUpdateTime = DHGRI.VehiclePoolsUpdateTime;
    }

    for (i = 0; i < VehiclePoolIndices.length; ++i)
    {
        j = VehiclePoolIndices[i];

        //build list entry string
        S = DHGRI.VehiclePoolVehicleClasses[j].default.VehicleNameString;

        if (!DHGRI.IsVehiclePoolInfinite(j))
        {
            //show vehicle spawns remaining if pool is not infinite
            S @= "[" $ DHGRI.VehiclePoolSpawnsRemainings[j] $ "]";
        }

        if (C.Level.TimeSeconds < DHGRI.VehiclePoolNextAvailableTimes[j])
        {
            //show countdown timer
            S @= "(" $ class'ROHud'.static.GetTimeString(DHGRI.VehiclePoolNextAvailableTimes[j] - C.Level.TimeSeconds) $ ")";

            bIsEnabled = false;
        }

        if (DHGRI.VehiclePoolSpawnsRemainings[j] == 0)
        {
            bIsEnabled = false;
        }

        li_Roles.SetItemAtIndex(i, S);
        li_Roles.SetExtraAtIndex(i, "" $ j);

        //TODO: this fucking shit fuction overrides out extra value, figure out a way around it
        //li_Roles.SetDisabledAtIndex(i, bIsEnabled);
    }
}

function UpdateSpawnPoints()
{
    local int i;
    local DHPlayer C;
    local DHGameReplicationInfo DHGRI;

    C = DHPlayer(PlayerOwner());

    if (C == none || DHPlayerReplicationInfo(C.PlayerReplicationInfo) == none)
    {
        return;
    }

    DHGRI = DHGameReplicationInfo(C.GameReplicationInfo);

    if (DHGRI == none)
    {
        return;
    }

    if (SpawnPointsUpdateTime < DHGRI.SpawnPointsUpdateTime)
    {
        //the vehicle spawn points were modified in such a way that requires us to repopulate the list
        li_AvailableWeapons[0].Clear();

        for (i = 0; i < 32; ++i)
        {
            if(!DHGRI.IsSpawnPointActive(i) || DHGRI.GetSpawnPointTeamIndex(i) != C.GetTeamNum())
            {
                continue;
            }

            li_AvailableWeapons[0].Add(DHGRI.SpawnPointNames[i]);
            li_AvailableWeapons[0].SetExtraAtIndex(li_AvailableWeapons[0].ItemCount - 1, "" $ i);
        }

        SpawnPointsUpdateTime = DHGRI.SpawnPointsUpdateTime;
    }

    li_AvailableWeapons[0].SortList();
}

function InternalOnChange(GUIComponent Sender)
{
    switch (Sender)
    {
        case lb_Roles:
            VehiclePoolIndex = int(li_Roles.GetExtra());
            break;
        case lb_AvailableWeapons[0]:
            SpawnPointIndex = int(li_AvailableWeapons[0].GetExtra());
            break;
    }
}

function ChangeSpawn()
{
    local DHPlayer C;

    C = DHPlayer(PlayerOwner());

    if (C == none)
    {
        return;
    }

    C.ServerChangeSpawn(SpawnPointIndex, VehiclePoolIndex);

    CloseMenu();
}

defaultproperties
{
    Begin Object Class=GUILabel Name=RolesTitle
        Caption="Role Selection"
        TextAlign=TXTA_Right
        StyleName="DHLargeText"
        WinTop=0.223333
        WinLeft=0.071250
        WinWidth=0.175000
        WinHeight=0.040000
    End Object
    l_RolesTitle=GUILabel'DH_Interface.DHDeploymentMenu.RolesTitle'
    Begin Object Class=GUILabel Name=RoleDescTitle
        Caption="Role Description"
        TextAlign=TXTA_Right
        StyleName="DHLargeText"
        WinTop=0.571666
        WinLeft=0.316250
        WinWidth=0.175000
        WinHeight=0.040000
    End Object
    l_RoleDescTitle=GUILabel'DH_Interface.DHDeploymentMenu.RoleDescTitle'
    Begin Object Class=GUILabel Name=PrimaryWeaponTitle
        Caption="Primary Weapon"
        TextAlign=TXTA_Right
        StyleName="DHLargeText"
        WinTop=0.035000
        WinLeft=0.803751
        WinWidth=0.175000
        WinHeight=0.040000
    End Object
    l_PrimaryWeaponTitle=GUILabel'DH_Interface.DHDeploymentMenu.PrimaryWeaponTitle'
    Begin Object Class=GUILabel Name=SecondaryWeaponTitle
        Caption="Sidearm"
        TextAlign=TXTA_Right
        StyleName="DHLargeText"
        WinTop=0.343334
        WinLeft=0.802501
        WinWidth=0.175000
        WinHeight=0.040000
    End Object
    l_SecondaryWeaponTitle=GUILabel'DH_Interface.DHDeploymentMenu.SecondaryWeaponTitle'
    Begin Object Class=GUILabel Name=EquipmentWeaponTitle
        Caption="Equipment"
        TextAlign=TXTA_Right
        StyleName="DHLargeText"
        WinTop=0.640000
        WinLeft=0.806250
        WinWidth=0.175000
        WinHeight=0.040000
    End Object
    l_EquipTitle=GUILabel'DH_Interface.DHDeploymentMenu.EquipmentWeaponTitle'
    Begin Object Class=BackgroundImage Name=PageBackground
        Image=Texture'DH_GUI_Tex.Menu.roleselect'
        ImageStyle=ISTY_Scaled
        ImageRenderStyle=MSTY_Alpha
        X1=0
        Y1=0
        X2=1023
        Y2=1023
    End Object
    bg_Background=BackgroundImage'DH_Interface.DHDeploymentMenu.PageBackground'
    Begin Object Class=BackgroundImage Name=PageBackground2
        Image=Texture'DH_GUI_Tex.Menu.midgamemenu'
        ImageStyle=ISTY_Scaled
        ImageRenderStyle=MSTY_Alpha
        X1=0
        Y1=0
        X2=1023
        Y2=1023
    End Object
    bg_Background2=BackgroundImage'DH_Interface.DHDeploymentMenu.PageBackground2'
    Begin Object Class=DHGUIButton Name=DisconnectButton
        Caption="Disconnect"
        bAutoShrink=false
        StyleName="DHSmallTextButtonStyle"
        WinTop=0.958750
        WinLeft=0.012000
        WinWidth=0.180000
        TabOrder=1
        OnClick=DHDeploymentMenu.InternalOnClick
        OnKeyEvent=DisconnectButton.InternalOnKeyEvent
    End Object
    b_Disconnect=DHGUIButton'DH_Interface.DHDeploymentMenu.DisconnectButton'
    Begin Object Class=DHGUIButton Name=MapButton
        Caption="Situation Map"
        bAutoShrink=false
        StyleName="DHSmallTextButtonStyle"
        WinTop=0.958750
        WinLeft=0.220000
        WinWidth=0.180000
        TabOrder=2
        OnClick=DHDeploymentMenu.InternalOnClick
        OnKeyEvent=MapButton.InternalOnKeyEvent
    End Object
    b_Map=DHGUIButton'DH_Interface.DHDeploymentMenu.MapButton'
    Begin Object Class=DHGUIButton Name=ScoreButton
        Caption="Score"
        bAutoShrink=false
        StyleName="DHSmallTextButtonStyle"
        WinTop=0.958750
        WinLeft=0.410000
        WinWidth=0.180000
        TabOrder=3
        OnClick=DHDeploymentMenu.InternalOnClick
        OnKeyEvent=ScoreButton.InternalOnKeyEvent
    End Object
    b_Score=DHGUIButton'DH_Interface.DHDeploymentMenu.ScoreButton'
    Begin Object Class=DHGUIButton Name=ConfigButton
        bAutoShrink=false
        StyleName="DHSmallTextButtonStyle"
        WinTop=0.958750
        WinLeft=0.600000
        WinWidth=0.180000
        TabOrder=4
        OnClick=DHDeploymentMenu.InternalOnClick
        OnKeyEvent=ConfigButton.InternalOnKeyEvent
    End Object
    b_Config=DHGUIButton'DH_Interface.DHDeploymentMenu.ConfigButton'
    Begin Object Class=DHGUIButton Name=ContinueButton
        Caption="Continue"
        bAutoShrink=false
        StyleName="DHSmallTextButtonStyle"
        WinTop=0.958750
        WinLeft=0.808000
        WinWidth=0.180000
        TabOrder=5
        OnClick=DHDeploymentMenu.InternalOnClick
        OnKeyEvent=ContinueButton.InternalOnKeyEvent
    End Object
    b_Continue=DHGUIButton'DH_Interface.DHDeploymentMenu.ContinueButton'
    Begin Object Class=DHGUIButton Name=JoinAxisButton
        Caption="Join Axis"
        StyleName="DHSmallTextButtonStyle"
        WinHeight=0.037500
        TabOrder=7
        OnClick=DHDeploymentMenu.InternalOnClick
        OnKeyEvent=JoinAxisButton.InternalOnKeyEvent
    End Object
    b_JoinAxis=DHGUIButton'DH_Interface.DHDeploymentMenu.JoinAxisButton'
    Begin Object Class=DHGUIButton Name=JoinAlliesButton
        Caption="Join Allies"
        StyleName="DHSmallTextButtonStyle"
        WinHeight=0.037500
        TabOrder=6
        OnClick=DHDeploymentMenu.InternalOnClick
        OnKeyEvent=JoinAlliesButton.InternalOnKeyEvent
    End Object
    b_JoinAllies=DHGUIButton'DH_Interface.DHDeploymentMenu.JoinAlliesButton'
    Begin Object Class=DHGUIButton Name=SpectateButton
        Caption="Spectate"
        StyleName="DHSmallTextButtonStyle"
        Hint="Observe the game as a non-playing spectator"
        WinHeight=0.037500
        TabOrder=8
        OnClick=DHDeploymentMenu.InternalOnClick
        OnKeyEvent=SpectateButton.InternalOnKeyEvent
    End Object
    b_Spectate=DHGUIButton'DH_Interface.DHDeploymentMenu.SpectateButton'
    Begin Object Class=GUILabel Name=NumAxisLabel
        Caption="?"
        TextAlign=TXTA_Center
        StyleName="DHSmallText"
    End Object
    l_numAxis=GUILabel'DH_Interface.DHDeploymentMenu.NumAxisLabel'
    l_numAllies=GUILabel'DH_Interface.DHDeploymentMenu.NumAxisLabel'
    Begin Object Class=GUILabel Name=NumFakeLabel
        Caption=" "
        TextAlign=TXTA_Center
        StyleName="DHSmallText"
    End Object
    l_numFake=GUILabel'DH_Interface.DHDeploymentMenu.NumFakeLabel'
    Begin Object Class=ROGUIListBoxPlus Name=Roles
        SelectedStyleName="DHListSelectionStyle"
        OutlineStyleName="ItemOutline"
        bVisibleWhenEmpty=true
        bSorted=true
        OnCreateComponent=Roles.InternalOnCreateComponent
        StyleName="DHSmallText"
        WinHeight=1.000000
        TabOrder=0
        OnChange=DHDeploymentMenu.InternalOnChange
    End Object
    lb_Roles=ROGUIListBoxPlus'DH_Interface.DHDeploymentMenu.Roles'
    Begin Object Class=GUIImage Name=PlayerImage
        Image=Texture'InterfaceArt_tex.Menu.empty'
        ImageStyle=ISTY_Justified
        ImageAlign=IMGA_Center
        WinTop=0.120000
        WinHeight=0.880000
        OnDraw=DHDeploymentMenu.InternalOnDraw
    End Object
    i_PlayerImage=GUIImage'DH_Interface.DHDeploymentMenu.PlayerImage'
    Begin Object Class=DHGUIScrollTextBox Name=RoleDescriptionTextBox
        bNoTeletype=true
        OnCreateComponent=RoleDescriptionTextBox.InternalOnCreateComponent
        StyleName="DHSmallText"
        WinHeight=1.000000
    End Object
    l_RoleDescription=DHGUIScrollTextBox'DH_Interface.DHDeploymentMenu.RoleDescriptionTextBox'
    Begin Object Class=GUILabel Name=PlayerNameLabel
        Caption="Name:"
        StyleName="DHLargeText"
        WinWidth=0.350000
        WinHeight=0.100000
    End Object
    l_PlayerName=GUILabel'DH_Interface.DHDeploymentMenu.PlayerNameLabel'
    Begin Object Class=DHGUIEditBox Name=PlayerNameEditbox
        TextStr="(Player name)"
        WinLeft=0.350000
        WinWidth=0.650000
        WinHeight=0.100000
        OnActivate=PlayerNameEditbox.InternalActivate
        OnDeActivate=PlayerNameEditbox.InternalDeactivate
        OnChange=DHDeploymentMenu.InternalOnChange
        OnKeyType=PlayerNameEditbox.InternalOnKeyType
        OnKeyEvent=PlayerNameEditbox.InternalOnKeyEvent
    End Object
    e_PlayerName=DHGUIEditBox'DH_Interface.DHDeploymentMenu.PlayerNameEditbox'
    Begin Object Class=GUIImage Name=WeaponImage
        ImageStyle=ISTY_Justified
        ImageAlign=IMGA_Center
        WinWidth=0.650000
        WinHeight=0.500000
    End Object
    i_WeaponImages(0)=GUIImage'DH_Interface.DHDeploymentMenu.WeaponImage'
    i_WeaponImages(1)=GUIImage'DH_Interface.DHDeploymentMenu.WeaponImage'
    Begin Object Class=DHGUIScrollTextBox Name=WeaponDescription
        bNoTeletype=true
        OnCreateComponent=WeaponDescription.InternalOnCreateComponent
        StyleName="DHSmallText"
        WinTop=0.550000
        WinHeight=0.450000
    End Object
    l_WeaponDescription(0)=DHGUIScrollTextBox'DH_Interface.DHDeploymentMenu.WeaponDescription'
    l_WeaponDescription(1)=DHGUIScrollTextBox'DH_Interface.DHDeploymentMenu.WeaponDescription'
    Begin Object Class=ROGUIListBoxPlus Name=WeaponListBox
        SelectedStyleName="DHListSelectionStyle"
        OutlineStyleName="ItemOutline"
        bVisibleWhenEmpty=true
        OnCreateComponent=WeaponListBox.InternalOnCreateComponent
        StyleName="DHSmallText"
        WinLeft=0.700000
        WinWidth=0.300000
        WinHeight=0.500000
        TabOrder=0
        OnChange=DHDeploymentMenu.InternalOnChange
    End Object
    lb_AvailableWeapons(0)=ROGUIListBoxPlus'DH_Interface.DHDeploymentMenu.WeaponListBox'
    lb_AvailableWeapons(1)=ROGUIListBoxPlus'DH_Interface.DHDeploymentMenu.WeaponListBox'
    Begin Object Class=GUIGFXButton Name=EquipButton0
        Graphic=Texture'InterfaceArt_tex.HUD.satchel_ammo'
        Position=ICP_Scaled
        bClientBound=true
        StyleName="DHGripButtonNB"
        WinWidth=0.200000
        WinHeight=0.495000
        TabOrder=21
        bTabStop=true
        OnClick=DHDeploymentMenu.InternalOnClick
        OnKeyEvent=EquipButton0.InternalOnKeyEvent
    End Object
    b_Equipment(0)=GUIGFXButton'DH_Interface.DHDeploymentMenu.EquipButton0'
    Begin Object Class=GUIGFXButton Name=EquipButton1
        Graphic=Texture'InterfaceArt_tex.HUD.satchel_ammo'
        Position=ICP_Scaled
        bClientBound=true
        StyleName="DHGripButtonNB"
        WinLeft=0.210000
        WinWidth=0.200000
        WinHeight=0.495000
        TabOrder=22
        bTabStop=true
        OnClick=DHDeploymentMenu.InternalOnClick
        OnKeyEvent=EquipButton1.InternalOnKeyEvent
    End Object
    b_Equipment(1)=GUIGFXButton'DH_Interface.DHDeploymentMenu.EquipButton1'
    Begin Object Class=GUIGFXButton Name=EquipButton2
        Graphic=Texture'InterfaceArt_tex.HUD.satchel_ammo'
        Position=ICP_Scaled
        bClientBound=true
        StyleName="DHGripButtonNB"
        WinLeft=0.420000
        WinWidth=0.200000
        WinHeight=0.495000
        TabOrder=23
        bTabStop=true
        OnClick=DHDeploymentMenu.InternalOnClick
        OnKeyEvent=EquipButton2.InternalOnKeyEvent
    End Object
    b_Equipment(2)=GUIGFXButton'DH_Interface.DHDeploymentMenu.EquipButton2'
    Begin Object Class=GUIGFXButton Name=EquipButton3
        Graphic=Texture'InterfaceArt_tex.HUD.satchel_ammo'
        Position=ICP_Scaled
        bClientBound=true
        StyleName="DHGripButtonNB"
        WinTop=0.505000
        WinWidth=0.410000
        WinHeight=0.495000
        TabOrder=24
        bTabStop=true
        OnClick=DHDeploymentMenu.InternalOnClick
        OnKeyEvent=EquipButton3.InternalOnKeyEvent
    End Object
    b_Equipment(3)=GUIGFXButton'DH_Interface.DHDeploymentMenu.EquipButton3'
    Begin Object Class=DHGUIScrollTextBox Name=EquipDescTextBox
        bNoTeletype=true
        OnCreateComponent=EquipDescTextBox.InternalOnCreateComponent
        StyleName="DHSmallText"
        WinLeft=0.440000
        WinWidth=0.560000
        WinHeight=1.000000
    End Object
    l_EquipmentDescription=DHGUIScrollTextBox'DH_Interface.DHDeploymentMenu.EquipDescTextBox'
    Begin Object Class=ROGUIContainerNoSkinAlt Name=ConfigButtonsContainer_inst
        WinTop=0.108333
        WinLeft=0.060000
        WinWidth=0.200000
        WinHeight=0.600000
        OnPreDraw=ConfigButtonsContainer_inst.InternalPreDraw
    End Object
    ConfigButtonsContainer=ROGUIContainerNoSkinAlt'DH_Interface.DHDeploymentMenu.ConfigButtonsContainer_inst'
    Begin Object Class=DHGUIButton Name=StartNewGameButton
        Caption="Start New Game"
        StyleName="DHSmallTextButtonStyle"
        TabOrder=11
        OnClick=DHDeploymentMenu.InternalOnClick
        OnKeyEvent=StartNewGameButton.InternalOnKeyEvent
    End Object
    b_StartNewGame=DHGUIButton'DH_Interface.DHDeploymentMenu.StartNewGameButton'
    Begin Object Class=DHGUIButton Name=ServerBrowserButton
        Caption="Server Browser"
        StyleName="DHSmallTextButtonStyle"
        TabOrder=12
        OnClick=DHDeploymentMenu.InternalOnClick
        OnKeyEvent=ServerBrowserButton.InternalOnKeyEvent
    End Object
    b_ServerBrowser=DHGUIButton'DH_Interface.DHDeploymentMenu.ServerBrowserButton'
    Begin Object Class=DHGUIButton Name=FavoritesButton
        Caption="Add Favorite"
        StyleName="DHSmallTextButtonStyle"
        TabOrder=13
        OnClick=DHDeploymentMenu.InternalOnClick
        OnKeyEvent=FavoritesButton.InternalOnKeyEvent
    End Object
    b_AddFavorite=DHGUIButton'DH_Interface.DHDeploymentMenu.FavoritesButton'
    Begin Object Class=DHGUIButton Name=MapVotingButton
        Caption="Map Voting"
        StyleName="DHSmallTextButtonStyle"
        TabOrder=2
        OnClick=DHDeploymentMenu.InternalOnClick
        OnKeyEvent=MapVotingButton.InternalOnKeyEvent
    End Object
    b_MapVoting=DHGUIButton'DH_Interface.DHDeploymentMenu.MapVotingButton'
    Begin Object Class=DHGUIButton Name=KickVotingButton
        Caption="Kick Voting"
        StyleName="DHSmallTextButtonStyle"
        TabOrder=14
        OnClick=DHDeploymentMenu.InternalOnClick
        OnKeyEvent=KickVotingButton.InternalOnKeyEvent
    End Object
    b_KickVoting=DHGUIButton'DH_Interface.DHDeploymentMenu.KickVotingButton'
    Begin Object Class=DHGUIButton Name=CommunicationButton
        Caption="Communication"
        StyleName="DHSmallTextButtonStyle"
        TabOrder=15
        OnClick=DHDeploymentMenu.InternalOnClick
        OnKeyEvent=CommunicationButton.InternalOnKeyEvent
    End Object
    b_Communication=DHGUIButton'DH_Interface.DHDeploymentMenu.CommunicationButton'
    Begin Object Class=DHGUIButton Name=ConfigurationButton
        Caption="Configuration"
        StyleName="DHSmallTextButtonStyle"
        TabOrder=16
        OnClick=DHDeploymentMenu.InternalOnClick
        OnKeyEvent=ConfigurationButton.InternalOnKeyEvent
    End Object
    b_Configuration=DHGUIButton'DH_Interface.DHDeploymentMenu.ConfigurationButton'
    Begin Object Class=DHGUIButton Name=ExitROButton
        Caption="Exit Darkest Hour"
        StyleName="DHSmallTextButtonStyle"
        TabOrder=17
        OnClick=DHDeploymentMenu.InternalOnClick
        OnKeyEvent=ExitROButton.InternalOnKeyEvent
    End Object
    b_ExitRO=DHGUIButton'DH_Interface.DHDeploymentMenu.ExitROButton'
    ConfigurationButtonText1="Options"
    ConfigurationButtonHint1="Show game and configuration options"
    Background=none
    VehiclePoolsUpdateTime=-1.0
    SpawnPointsUpdateTime=-1.0
    SpawnPointIndex=-1
    VehiclePoolIndex=-1
}

