#! /bin/bash

#---------------------------------------
# $Author: ee364g12 $
# $Date: 2018-01-11 17:11:51 -0500 (Thu, 11 Jan 2018) $
#---------------------------------------

# Do not modify above this line.

inputCount=$#
inputParameters=$@

file=$1
sport=$2

if (( $inputCount != 2 ))
then
    echo "Usage: ./collect_stats.bash <file> <sport>"
    exit 1
elif [[ ! -e $file ]]
then
    echo "Error: $1 does not exist"
    exit 2
fi

A=""
B=""
C=0
athletes=0
total_medals=0
most_medals=0
winner=""

while read line
do
    A=$(echo $line | cut -d ',' -f 1)
    B=$(echo $line | cut -d ',' -f 2)
    C=$(echo $line | cut -d ',' -f 3)

    if [[ $sport == $B ]]
    then
        let athletes=$athletes+1
        if (( $most_medals < $C )) 
        then
            most_medals=$C
            winner=$A
        fi
        let total_medals=$total_medals+$C
    fi
done < $file

echo "Total athletes: $athletes"
echo "Total medals won: $total_medals"
echo "$winner won the most medals: $most_medals"

exit 0



