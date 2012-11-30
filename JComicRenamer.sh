#!/bin/bash
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

pkill java
echo "Stoping JComicDowloader..."

#Please replace this line to your .jar directory.
cd $HOME/Images/Comics/

echo
echo "Start searching for the new version."
echo
ls -rt | tac | grep 'JComicDownloader_v.*' -m 1 | read newapp

if [[ ! -f $newapp ]]
then
echo
echo "Could not find the new JComicDowloader program, please download it first!"
echo
echo "Exiting script..."
echo
exit 1
fi

echo
echo "Find new $newapp"
echo
mv $newapp JComicDownloader.jar
echo
echo "The new $newapp has been renamed to JComicDownloader.jar"
echo
sudo chmod r+x JComicDownloader.jar
echo
echo "Add Execute permission to the file."
echo

echo
echo "Start searching for the old version."
echo
ls -rt | grep 'JComicDownloader.*' -m 1 | read oldapp

if [[ ! -f $oldapp ]]
then
echo
echo "Could not find the old JComicDowloader program"
echo
echo "Exiting script..."
echo
exit 1
fi

echo
echo "Find old $oldapp"
echo
rm $oldapp
echo
echo "Old version：$oldapp has been removed."
echo
exit 0
