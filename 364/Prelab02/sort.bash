#! /bin/bash

#---------------------------------------
# $Author: ee364g12 $
# $Date: 2018-01-17 22:23:12 -0500 (Wed, 17 Jan 2018) $
#---------------------------------------

# Do not modify above this line.

(( ! $# == 1 )) && echo "Usage: ./sort.bash <filename>" && exit 1
filename=$1
[[ ! -e $filename ]] && echo "Error: $1 does not exist" && exit 2

#print 5 fastest performing CPUs (lowest execution time)
echo "The 5 fastest CPUs:"
sort -n -k 5 -t ',' simulations.txt | head -5
echo

#print 3 most efficient (lowest CPI)
echo "The 3 most efficient CPUs:"
sort -n -k 4 -t ',' simulations.txt | head -3
echo

#print all with cache size of 4, in order of increasing execution time
echo "The CPUs with cache size 4:"
sort -n -k 5 -t ',' simulations.txt > testfile.txt 
while read line
do
    cache=$(echo $line | cut -d ',' -f 2)
    if (( $cache == 4 ))
    then
        echo $line
    fi
done < testfile.txt
rm testfile.txt
echo

#print n slowest CPUs (prompt user)
read -p "Enter a value for n: " n
echo "The $n slowest CPUs:"
sort -n -r -k 5 -t ',' simulations.txt | head -$n
echo

#print to a file (sorted_CPI.txt) list of all AMD CPUs 
#(in order of increasing CPI)
#followed by all Intel CPUs
[[ -e sorted_CPI.txt ]] && rm sorted_CPI.txt
sort -k 1,1 -k 4,4 -t ',' simulations.txt > sorted_CPI.txt

exit 0
