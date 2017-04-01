@ECHO OFF
SETLOCAL
SET VERSION=%1
SET NUGET=Tools\nuget\nuget.exe

CALL Scripts\buildpack %VERSION%
ECHO buildpack done
%NUGET% push .\Release\Mapsui.Forms.%VERSION%.nupkg -source nuget.org
ECHO nuget push done
git commit -m %VERSION% -a
ECHO git commit done
git tag %VERSION%
git push origin %VERSION%
ECHO git tag done
git push
ECHO git push done