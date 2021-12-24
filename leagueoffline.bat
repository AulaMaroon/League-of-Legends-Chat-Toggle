echo off & cls
setlocal enableDelayedExpansion
set /a size=120=1 & rem screen size minus one

net session >nul 2>&1
if %errorlevel% NEQ 0 (
  call:question
  echo.
  echo.
  echo Program Require Admin Rights Please Run as Administrator.
  for /l %%x in (1,1,23) do echo.
  timeout /t 3
  exit
)



:onoroffq
call:question
echo.
echo Appear Offline or Online :
echo.
echo 1. Offline
echo 2. Online
set /p oforon=
if %oforon%==1 goto platformq
if %oforon%==2 goto Online

:platformq
call:question
echo.
echo Choose Your Platform :
echo.
echo 1. Riot
echo 2. Garena
echo 3. Back
echo.

set /p platform=
if %platform%==1 goto Riot
if %platform%==2 goto Garena
if %platform%==3 goto onoroffq

:Riot
call:question
echo.
echo Choose Your Region :
echo.
echo 1. North America
echo 2. Europe Nordic ^& East
echo 3. Europe West
echo 4. Latin America North
echo 5. Latin America South 
echo 6. Oceania
echo 7. Brazil
echo 8. Russia
echo 9. Turkey
echo 10. Japan
echo 11. Korea
echo 12. Back
echo.
set /p riots=
if %riots%==1 goto NA
if %riots%==2 goto EUNE
if %riots%==3 goto EUW
if %riots%==4 goto LAN
if %riots%==5 goto LAS
if %riots%==6 goto OCE
if %riots%==7 goto BR
if %riots%==8 goto RU
if %riots%==9 goto TR
if %riots%==10 goto JP
if %riots%==11 goto KR
if %riots%==12 goto platformq

:Garena
call:question
echo.
echo Choose Your Region :
echo.
echo 1. Singapore
echo 2. Vietnam
echo 3. Thailand
echo 4. Taiwan
echo 5. Back
set /p garenas=
if %garenas%==1 goto SG
if %garenas%==2 goto VN
if %garenas%==3 goto TH
if %garenas%==4 goto TW
if %garenas%==5 goto platformq

:NA
set ip=na2.chat.si.riotgames.com
goto ip1
:EUNE
set ip=eun1.chat.si.riotgames.com
goto ip1
:EUW
set ip=euw1.chat.si.riotgames.com
goto ip1
:LAN
set ip=la1.chat.si.riotgames.com
goto ip1
:LAS
set ip=la2.chat.si.riotgames.com
goto ip1
:OCE
set ip=oc1.chat.si.riotgames.com
goto ip1
:BR
set ip=br.chat.si.riotgames.com
goto ip1
:RU
set ip=ru1.chat.si.riotgames.com
goto ip1
:TR
set ip=tr1.chat.si.riotgames.com
goto ip1
:JP
set ip=jp1.chat.si.riotgames.com
goto ip1
:KR
set ip=kr1.chat.si.riotgames.com
goto ip1
:SG
set ip=sg1.chat.si.riotgames.com
goto ip1
:VN
set ip=vn1.chat.si.riotgames.com
goto ip1
:TH
set ip=th1.chat.si.riotgames.com
goto ip1
:TW
set ip=tw1.chat.si.riotgames.com
goto ip1

:ip1
for /f "tokens=3 delims=: " %%a in ('ping %ip% ^| find /i "reply"') do (
  set address=%%a
  goto Offline
) 
:Online
netsh advfirewall firewall delete rule name="lolchat"
call:question
echo.
echo You Will Appear Online
echo.
timeout /t 5
exit

:Offline
netsh advfirewall firewall add rule name="lolchat" dir=out remoteip=%address% protocol=TCP action=block
call:question
echo.
echo You will appear offline.
echo.
timeout /t 5
exit

:question
cls
echo.
echo.
set s=League of Legends Chat Toggle By AulaMaroon
for /L %%# in (1,2,!size!) do if "!s:~%size%,1!" == "" set "s= !s! "
set s=!s:~1,%size%!& echo(!s!