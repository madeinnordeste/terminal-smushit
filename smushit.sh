#!/bin/bash

#
# REQUIRE:  smushit.jar
#
# http://abhirama.wordpress.com/2010/10/20/a-command-line-tool-to-run-smush-it/
#
#command line tool to run smush.it
#
#I came to know of yahoo!’s awesome lossless image compression service smush.it through this blog post. After playing around with smush.it for sometime I realised that there is no command line client that does it to images in local directories. So thought why not write one and this is the result – https://bitbucket.org/abhirama/smushit. You can download the binary from here – https://bitbucket.org/abhirama/smushit/downloads.
# 
# Directions for use:
# This is a command line tool which losslessly compresses all the images in the passed directory using yahoo!’s smush.it image compression utility – http://www.smushit.com/ysmush.it/, downloads the smushed images and replaces the original image with the smushed ones in their respective directories.
# 
# Usage:
# java -jar smushit.jar [options]
# 
# Mandatory options:
# -imageDir
# Root directory of the images to be smushed. The program recursively traverses all sub directories of this directory smushing images.
# 
# Optional Options:
# -verbose
# Will print detailed messages on screen.
# -dryRun
# Will not download the smushed images.
# -imgExtensions
# Specify a list of comma separated image extensions. Only images with those extensions will be smushed.
# 
# Example usage:
# java -jar smushit.jar -imageDir=/foo -verbose=true -dryRun=false -imgExtensions=gif,png,jpeg
# 
# The above will smush all images with extensions gif, png and jpeg in directory foo and it’s sub directories and will download the smushed images and replace the original with the smushed images.
# 
# Important:
# Sometimes smushit converts gifs to pngs if the resulting png files are smaller. Take a look at this faq – http://developer.yahoo.com/yslow/smushit/faq.html#faq_giftopng . If this happens with your images, your image folder will have the original image as well as the newly converted png image.
# 
# Give it a spin and let me know if there are any bugs or any enhancements needed. It is in a fledgling state and I will keep on improving it in the coming days.
# 
#java -jar smushit.jar -imageDir=/foo -verbose=true -dryRun=false -imgExtensions=gif,png,jpeg 


echo 'Run Smushit ...'

if [ $# = 0 ]; then 
    echo "* ERROR: directory not found";
    echo "  Use: ./smushit.sh YOU/DIRECTORY/IMAGES/"; 
    echo " "
else
    echo "* start images compress \"$1\"";
    
    java -jar smushit.jar -imageDir=$1 -verbose=true -dryRun=false 
fi
echo ""
echo ""
