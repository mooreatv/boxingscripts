REM This is to clone wow's actual directory structure without taking too much disk space
REM yet have unique Config.wtf
set wowdir=C:\Program Files (x86)\World of Warcraft
set tdir=c:\mbox
mkdir %tdir%
cd %tdir%
mklink /d "%tdir%\data" "%wowdir%\data"
for %%w in (_wow1_ _wow2_ _wow3_ _wow4_ _wow5_) do (
mkdir %%w
cd %%w
xcopy "%wowdir%\_retail_\*.*"
mkdir WTF
copy "%wowdir%\_retail_\WTF\Config.wtf" WTF\
mkdir WTF\SavedVariables
copy "%wowdir%\_retail_\WTF\SavedVariables\*.* WTF\SavedVariables\
for %%x in (
    Utils
    Interface
    WTF\Account
  ) do (
    mklink /d %%x "%wowdir%\_retail_\%%x"
  )
cd ..
)
cd ..
