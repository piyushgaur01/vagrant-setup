@echo off

set /A STARTTIME=(1%time:~0,2%-100)*360000 + (1%time:~3,2%-100)*6000 + (1%time:~6,2%-100)*100 + (1%time:~9,2%-100)
echo "%time%: Started"
vagrant up
echo "%time%: vagrant up complete"
vagrant halt
echo "%time%: vagrant halt complete"
"C:\Program Files\Oracle\VirtualBox\vboxmanage.exe" export telehealth -o C:\Dev\vagrant\telehealth_%STARTTIME%.ova
echo "%time%: OVA export complete"
echo "%time%: Ended"
