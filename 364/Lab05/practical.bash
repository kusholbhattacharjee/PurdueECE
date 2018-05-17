#! /bin/bash

#----------------------------------
# $Author: ee364g12 $
# $Date: 2018-02-14 17:11:19 -0500 (Wed, 14 Feb 2018) $
#----------------------------------

function part_a 
{               
    # Fill out your answer here. Do not include exit 0 in your code.
    Arr=(a.txt b.txt c.txt d.txt)
    file=${Arr[(($RANDOM%4))]}
    echo $file
    head -n 5 $file | tail -n 3
    return                      
}                               

function part_b
{              
    # Fill out your answer here. Do not include exit 0 in your code.
    count1=$( ls myDir1/* | wc -w )
    count2=$( ls myDir2/* | wc -w )
    (( $count1 == $count2 )) && echo "Similar"
    (( $count1 == $count2 )) || echo "Different"

    return                     
}                              

function part_c
{
    # Fill out your answer here. Do not include exit 0 in your code.
    filename='file.txt'
    temp=""
    while read line
    do
        [[ $line = $temp ]] && echo $line
        temp=$line
    done < $filename
    return
}

function part_d
{
    # Fill out your answer here. Do not include exit 0 in your code.
    filename='temp.txt'
    X=0
    while read line
    do
        len=${#line}
        (( $len > 9 )) && (( X=$X+1 ))
    done < $filename
    echo "temp.txt has $X lines with at least length ten"
    return
}

function part_e
{
    # Fill out your answer here. Do not include exit 0 in your code.
    python3.4 ece364.py > output.txt
    return
}

function part_f
{
    # Fill out your answer here. Do not include exit 0 in your code.
    sort -k 4,4 -k 6,6 -k 1,1 -k 2,2 -t ',' people.csv | head -10 
    return
}

function part_g
{
    # Fill out your answer here. Do not include exit 0 in your code.
    ls myDir/*.java myDir/*.c | wc -w
    return
}


function part_h
{
    # Fill out your answer here. Do not include exit 0 in your code.
    grep -e "VALENTINE" info.txt | wc -l
    return
}

function part_i
{
    # Fill out your answer here. Do not include exit 0 in your code.
    curr_sum=1
    for num in {1..100}
    do
        for i in {2..10}
        do
            ((div=$num/$i))
            if (($num % $i == 0)) 
            then
                (($div != $i)) && (( curr_sum=$curr_sum + $i + $div ))
                (($div != $i)) && (( curr_sum=$curr_sum + $i ))
            fi
        done
        echo $curr_sum
        (( $curr_sum > $num )) && echo $num
    done
    return
}


# To test your function, you can call it below like this:
#
#part_i
