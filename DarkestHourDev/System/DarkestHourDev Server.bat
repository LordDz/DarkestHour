@echo OFF
cd "%~dp0"
python ..\..\tools\make\make.py -mod DarkestHourDev ..\..
ucc server DH-Armored_Balaton_Clash.rom?game=DH_Engine.DarkestHourGame?MaxPlayers=64?Mutator=DH_AdminMenuMutator.DHAdminMenuMutator -log=DHServerLog_%RANDOM%.log -mod=DarkestHourDev -ini=DarkestHourDev.ini