@echo off

echo "=== Copy the pre-installed Boost to the includes folder"

:: create folders
mkdir C:\projects\fifengine-dependencies\includes\lib\boost
mkdir C:\projects\fifengine-dependencies\includes\include\boost

:: copy boost includes
xcopy /Y /S "C:\Libraries\boost_1_64_0\boost" "C:\projects\fifengine-dependencies\includes\include\boost" >nul 2>&1

:: copy binaries (dlls) and libs
copy "C:\Libraries\boost_1_64_0\lib32-msvc-14.1\boost_filesystem-vc141-mt-1_64.dll" "C:\projects\fifengine-dependencies\includes\bin\boost_filesystem-vc141-mt-1_64.dll"
copy "C:\Libraries\boost_1_64_0\lib32-msvc-14.1\boost_system-vc141-mt-1_64.dll" "C:\projects\fifengine-dependencies\includes\bin\boost_system-vc141-mt-1_64.dll"
copy "C:\Libraries\boost_1_64_0\lib32-msvc-14.1\libboost_filesystem-vc141-mt-1_64.lib" "C:\projects\fifengine-dependencies\includes\lib\boost\libboost_filesystem-vc1410-mt-1_64.lib"
copy "C:\Libraries\boost_1_64_0\lib32-msvc-14.1\libboost_system-vc141-mt-1_64.lib" "C:\projects\fifengine-dependencies\includes\lib\boost\libboost_system-vc141-mt-1_64.lib"

:: remove the "share" folder
rmdir /S /Q C:\projects\fifengine-dependencies\includes\share

echo "Done."
