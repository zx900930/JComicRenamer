#!/bin/bash
#Please replace $HOME/Images/Comics/ to your own JComicDownloader_v*.jar directory.
cd $HOME/Images/Comics/

echo
echo "Start searching for the new version."
echo
newapp=$(ls -rt | tac | grep '^JComicDownloader_v.*jar$' -m 1)

if [ "1${newapp}" = "1" ];
then
echo
echo "Could not find the new JComicDowloader program, please download it first!"
echo
echo "Exiting script..."
echo
exit 1
fi

echo
echo "Start searching for the old version."
echo
oldapp=$(ls -rt | grep 'JComicDownloader.*' -m 1)

if [ ! -f $oldapp ]
then
echo
echo "Could not find the old JComicDowloader program"
echo
echo "Exiting script..."
echo
exit 1
fi

echo
echo "Find new $newapp"
echo
echo "Replacing old version..."
echo
echo "Add Execute permission to the file..."
echo
mv $newapp JComicDownloader.jar && sudo chmod 775 JComicDownloader.jar
if [ $? -eq 0 ]
then
echo "The new $newapp has been renamed to JComicDownloader.jar"
echo
exit 0
else
echo "Must stop JComicDowloader first, stop now?(Y/N): "
read answer
echo
if [ "$answer" = "n" ] || [ "$answer" = "N" ]
then exit
fi
if [ "$answer" != "y" -a "$answer" != "Y" ]
then
echo
echo "Response $answer is not recognized, "
echo
echo "Exiting script..."
echo
exit 1
fi
fi
echo "Done, Please restart this script!"
exit 0
