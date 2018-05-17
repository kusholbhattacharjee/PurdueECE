#! /bin/bash

#---------------------------------------
# $Author: ee364g12 $
# $Date: 2018-01-17 16:57:42 -0500 (Wed, 17 Jan 2018) $
#---------------------------------------

# Do not modify above this line.


(( ! $# == 1 )) && echo "Usage: check_permissions.bash <input file/directory>" && exit 1
[[ ! -e $1 ]] && echo "File/directory doesn't exist" && exit 1

permissions=$(ls -ld $1)
#echo $permissions

isfile=${permissions:0:1}
[[ $isfile == "d" ]] && echo "$1 is a directory"
[[ $isfile == "-" ]] && echo "$1 is an ordinary file"
echo

echo "Owner Permissions:";echo 

re=${permissions:1:1}
[[ $re == "r" ]] && echo "$1 is readable" 
[[ $re == "-" ]] && echo "$1 is not readable" 

wr=${permissions:2:1}
[[ $wr == "w" ]] && echo "$1 is writable" 
[[ $wr == "-" ]] && echo "$1 is not writable" 

ex=${permissions:3:1}
[[ $ex == "x" ]] && echo "$1 is executable" 
[[ $ex == "-" ]] && echo "$1 is not executable" 


echo; echo "Group Permissions:";echo

re=${permissions:4:1}
[[ $re == "r" ]] && echo "$1 is readable" 
[[ $re == "-" ]] && echo "$1 is not readable" 

wr=${permissions:5:1}
[[ $wr == "w" ]] && echo "$1 is writable" 
[[ $wr == "-" ]] && echo "$1 is not writable" 

ex=${permissions:6:1}
[[ $ex == "x" ]] && echo "$1 is executable" 
[[ $ex == "-" ]] && echo "$1 is not executable" 


echo; echo "Others Permissions:";echo

re=${permissions:7:1}
[[ $re == "r" ]] && echo "$1 is readable" 
[[ $re == "-" ]] && echo "$1 is not readable" 

wr=${permissions:8:1}
[[ $wr == "w" ]] && echo "$1 is writable" 
[[ $wr == "-" ]] && echo "$1 is not writable" 

ex=${permissions:9:1}
[[ $ex == "x" ]] && echo "$1 is executable" 
[[ $ex == "-" ]] && echo "$1 is not executable" 
echo
