@echo off
::
::脚本作用：删除指定应用程序为开机启动。
::脚本工作目录：将当前项目根目录作为中间的工作目录。
::文件编码：ANSI
::作者：echohelper
::
::使用说明：
::1、AppName：设置为自己应用的名字（英文名字，用于内部指明应用程序）。
::2、AppRelativePath：设置为应用程序全名称相对路径（该变量的设置处，请使用\的路径）。
::

setlocal enabledelayedexpansion

::调用方目录
set CallerDir=%cd%

::本文件目录
set SelfDir=%~dp0

::中间层目录，依据结构设置
set MidDir=%SelfDir%


::启动程序相对中间层的文件路径，文件名的全称
set AppName=WinAutoStart
set AppRelativePath=WinAutoStart.exe
set ScriptName=start_on_startup_unreg.reg

::切换到中间层目录
cd /d %MidDir%

::生成注册表脚本文件
echo Windows Registry Editor Version 5.00 > %ScriptName%
echo. >> %ScriptName%
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run] >> %ScriptName%
echo "%AppName%"=-  >> %ScriptName%
echo.  >> %ScriptName%

::执行%ScriptName%文件
::regedit /s %ScriptName%
%ScriptName%

::清理文件
del /q %ScriptName%



:finish_run

cd /d %CallerDir%

