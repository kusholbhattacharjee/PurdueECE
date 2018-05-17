#! /bin/bash

#---------------------------------------
# $Author: ee364g12 $
# $Date: 2018-01-17 23:10:57 -0500 (Wed, 17 Jan 2018) $
#---------------------------------------

# Do not modify above this line.

(( ! $# == 1 )) && echo "Usage: ./treasure.bash <filename>" && exit 1
[[ ! -e $1 ]] && echo "file not found" && exit 2

t_found=0
row=0
col=0

while (( $t_found == 0 ))
do
    #print coords
    echo "($row,$col)"

    ((row=$row+1))
    ((col=$col+1))

    #get the line we need & cut to get the value
    num=$(head -$row $1| tail -1 | cut -f ${col} -d' ' )

    #get tens digit with div
    (( tens=$num/10 ))

    #get ones digit with mod
    (( ones=$num%10 ))

    #check if they are the same as the current
    if (( $row == (($tens+1)) )) && (( $col == (($ones+1)) )) 
    then
        let t_found=1
    else
        let row=$tens
        let col=$ones
    fi
done

echo "Treasure found at: ($tens,$ones)"
exit 0
