#! /bin/bash

#----------------------------------
# $Author: ee364g12 $
# $Date: 2018-01-24 16:14:23 -0500 (Wed, 24 Jan 2018) $
#----------------------------------

function part_1 
{               
    # Fill out your answer here
    sort -k 4,4 -k 6,6 -k 1,1 -k 2,2 -t ',' people.csv | tail -9
    return                      
}                               

function part_2
{              
    # Fill out your answer here
    Arr=(a.txt b.txt c.txt d.txt e.txt)
    
    file=${Arr[(($RANDOM%5))]}
    numLines=$(wc -l $file | cut -f 1 -d ' ')
    let middle1=$numLines/2 
    let middle2=0 

    (( $numLines%2 == 0 )) && (( middle2=$middle1+1 ))
    (( $numLines%2 == 1 )) && (( middle1=$middle1+1 ))

    count=1

    while read line
    do 
        (( $middle1==$count )) && echo $line
        (( $middle2==$count )) && echo $line
        let count=$count+1
    done < $file

    return                     
}                              

function part_3
{
    # Fill out your answer here
    cd src
    for file in *.c
    do
        gcc $file 2>/dev/null 1>/dev/null 0>/dev/null
        if (( $?==0 ))
        then
            echo "$file: success"
        else
            echo "$file: failure"
        fi
    done
    return
}

# To test your function, you can call it below like this:
#
#part_3
