rem This file figures out what the current default is in GRUB and sets it to 0 (Ubuntu)

rem Assumptions: 
rem /boot is installed to d: (and d: is an editable/readable filesystem)
rem sed.exe exists in c:\Util\

rem @author: Ramil Nobleza


echo Backing up current grub settings
@echo OFF
copy d:\grub\grub.cfg d:\grub\grub.cfg.backup

echo Editing grub config file...
@echo OFF
c:\Util\sed.exe "s/set default=\"[0-9]\"/set default=\"0\"/" d:\grub\grub.cfg > d:\grub\grub.cfg.changed
del d:\grub\grub.cfg
move d:\grub\grub.cfg.changed d:\grub\grub.cfg

@echo ON
echo Edit Complete. Restarting.
@echo OFF
shutdown /r /t 1
