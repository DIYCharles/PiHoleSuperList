#!/bin/sh

echo ---cloning repos from repolists--

cd C:\DEV\blacklists\repos
@echo off
for /F "delims=" %%x in (C:\DEV\blacklists\PiHoleSuperList\repolists.txt) do (
     git clone %%x
)

echo ---updating repos and copying from txt files into FINAL--

for /d %%i in (%cd%\*) do (
    echo *************************************************************************
    echo "%%i"
    cd "%%i"
    echo status
    git status
	git pull
    echo ---mainfolder---

    TYPE *.TXT >> C:\DEV\blacklists\PiHoleSuperList\FINAL.TXT
    for /d %%b in (%cd%\*) do (
        echo ---subfolders--
        echo "%%b"
        cd "%%b"
	    TYPE *.TXT >> C:\DEV\blacklists\PiHoleSuperList\FINAL.TXT
    )
    echo ---done---
    echo *************************************************************************
)

@REM cd C:\DEV\blacklists\
@REM git clone https://github.com/blocklistproject/Lists.git
@REM cd C:\DEV\blacklists\Lists\
@REM git pull
@REM cd C:\DEV\blacklists\Lists\alt-version\
@REM TYPE ads-nl.txt >> C:\DEV\blacklists\PiHoleSuperList\FINAL.TXT
@REM TYPE smart-tv-nl.txt >> C:\DEV\blacklists\PiHoleSuperList\FINAL.TXT
@REM TYPE tracking-nl.txt >> C:\DEV\blacklists\PiHoleSuperList\FINAL.TXT

cd C:\DEV\blacklists\PiHoleSuperList\
echo ---sorting---
powershell .\sort.ps1



@REM for /f "delims=" %%I in (FINAL.TXT) do findstr /X /C:"%%I" FINALSU.TXT >NUL ||(echo;%%I)>>FINALSU.TXT
cd ..
