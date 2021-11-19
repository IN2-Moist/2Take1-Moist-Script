@echo off
title Moist Script 2.0.3.4 Console Tool
setlocal EnableDelayedExpansion  
cd %UserProfile%\AppData\Roaming\PopstarDevs\2Take1Menu\lualogs

color 2
                                                       

echo ███╗   ███╗ ██████╗ ██╗███████╗████████╗    ███████╗ ██████╗██████╗ ██╗██████╗ ████████╗                  
echo ████╗ ████║██╔═══██╗██║██╔════╝╚══██╔══╝    ██╔════╝██╔════╝██╔══██╗██║██╔══██╗╚══██╔══╝                  
echo ██╔████╔██║██║   ██║██║███████╗   ██║       ███████╗██║     ██████╔╝██║██████╔╝   ██║                     
echo ██║╚██╔╝██║██║   ██║██║╚════██║   ██║       ╚════██║██║     ██╔══██╗██║██╔═══╝    ██║                     
echo ██║ ╚═╝ ██║╚██████╔╝██║███████║   ██║       ███████║╚██████╗██║  ██║██║██║        ██║                     
echo ╚═╝     ╚═╝ ╚═════╝ ╚═╝╚══════╝   ╚═╝       ╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝        ╚═╝                     
echo              ██████╗ ██████╗ ███╗   ██╗███████╗ ██████╗ ██╗     ███████╗
echo             ██╔════╝██╔═══██╗████╗  ██║██╔════╝██╔═══██╗██║     ██╔════╝
echo             ██║     ██║   ██║██╔██╗ ██║███████╗██║   ██║██║     █████╗  
echo             ██║     ██║   ██║██║╚██╗██║╚════██║██║   ██║██║     ██╔══╝  
echo             ╚██████╗╚██████╔╝██║ ╚████║███████║╚██████╔╝███████╗███████╗
echo              ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝ ╚═════╝ ╚══════╝╚══════╝

pause
cls
rem debug files
rem start /B powershell -Command "& { Get-Content Moists_debug.log -Tail 1 -Wait;}"
rem start /B powershell -Command "& { Get-Content MoistsBlacklist_debug.log -Tail 1 -Wait;}"

rem Joining Players info
rem start /B powershell -Command "& { Get-Content PlayerJoins.txt -Tail 1 -Wait;}"

rem TODO: Command to Fetch IP INFO 

rem start /B powershell -Command "& { $TransIP =  Get-Content Translated_IP_OUT_4console.txt -Tail 1; $FetchedIPINFO = Get-WebURL -Content -ResponseHeaders -Url http://ip-api.com/json/$TransIP ; Write-Output $T}"
rem start /B powershell -Command "& { $TransIP =  Get-Content Translated_IP_OUT_4console.txt -Tail 1; $FetchedIPINFO = Get-WebURL -Content -ResponseHeaders -Url http://ip-api.com/line/{$TransIP}?fields=131096 ; Write-Output $FetchedIPINFO}" 

rem start /B powershell -Command  "& { $TransIP =  Get-Content Translated_IP_OUT_4console.txt -Tail 1 -wait;}" "& { $FetchedIPINFO = Get-WebURL -Content -ResponseHeaders -Url http://ip-api.com/line/$TransIP ; Write-Output $FetchedIPINFO.content ; -wait}"

rem start /B powershell -Command "& {$a = Get-Content Translated_IP_OUT_4console.txt -Tail 1; Write-Ouput ( Get-WebURL -Content -ResponseHeaders -Url http://ip-api.com/line/$a ); return  ; }"

rem start /B powershell -Command "& {$a Get-Content Translated_IP_OUT_4console.txt -Tail 1 -wait;}
rem start /B powershell -Command "& { Get-WebURL -Content -ResponseHeaders -Url http://ip-api.com/line/$TransIP ; $TransIP = 0 ; }"


 rem start /B powershell -Command "& { $TransIP = Get-Content Translated_IP_OUT_4console.txt -Tail 1 ;}"
  rem  start /B powershell -Command "& { $FetchedIPINFO = Get-WebURL -Content -ResponseHeaders -Url $TransIP ; -wait ;}"
       start /B powershell -Command "& { $Response = Invoke-RestMethod -Uri https://support.rockstargames.com/services/status.json -Method get ;  Write-Output $Response;}" 
       pause