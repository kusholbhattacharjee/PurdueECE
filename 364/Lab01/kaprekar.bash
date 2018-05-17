#! /bin/bash

#---------------------------------------
# $Author: ee364g12 $
# $Date: 2018-01-17 16:21:08 -0500 (Wed, 17 Jan 2018) $
#---------------------------------------

# Do not modify above this line.



(( ! $# == 1 )) && echo "Usage: kaprekar.bash <non-negitive number>" && exit 1

let end=$((10#$1))
let num=1

while (( $num <= $end ))
do
    let sqr=$num*$num

    len=${#num}
    sqrlen=${#sqr}

    let otherHalf=$sqrlen-$len
    add1=${sqr:$otherHalf}
    add2=${sqr:0:$otherHalf}

    [[ -z $add2 ]] && let add2=0

    let add3=$((10#$add1))
    let add4=$((10#$add2))

    let sum=$add3+$add4

    #echo "$len $sqrlen $otherHalf"

    (( $sum == $num )) && echo "$num, square=$sqr, $add1+$add2=$sum"
    (( num=$num+1 ))
done
