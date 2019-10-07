#!/bin/bash
function GetVersion
{
	PROJECT_PBXPROJ_PATH=$1
	INFOPLIST_FILE_PATH=$(echo $2 | sed -e 's/\//\\\//g')
	version=$(sed -n -e "/INFOPLIST_FILE = \"${INFOPLIST_FILE_PATH}\"/,/MARKETING_VERSION/p" $PROJECT_PBXPROJ_PATH\
			| sed -n -e '/MARKETING_VERSION.*/p'\
			| sed 's/.*MARKETING_VERSION = //g'\
			| sed 's/;//g'\
			| head -1)
	echo $version
}
# GetVersion PROJECT_PBXPROJ_PATH INFOPLIST_FILE_PATH(Relative to $(SRCROOT))
version=$(GetVersion "TestProject.xcodeproj/project.pbxproj" "TestProject/info.plist")
echo $version
exit 0