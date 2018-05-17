#! /bin/bash

#---------------------------------------
# $Author: ee364g12 $
# $Date: 2018-01-11 17:09:33 -0500 (Thu, 11 Jan 2018) $
#---------------------------------------

# Do not modify above this line.

user=$(whoami)
cmd=""

while [[ $cmd != "quit" ]]
do
    read -p "Enter a command: " cmd

    if [[ $cmd == "hello" ]]
    then
        echo "Hello $user"
    elif [[ $cmd == "compile" ]]
    then
        #RUN EACH .C FIL
        for f in *.c
        do
            f1=$(echo $f | cut -d'.' -f 1)
            gcc -Wall -Werror $f -o ${f1}.o
            code=$?
            if [[ $code != 0 ]]
            then
                echo "Compilation failed for: $f"
            else 
                echo "Compilation succeeded for: $f"
            fi
        done

    elif [[ $cmd == "run" ]]
    then
        read  -p "Enter filename: " filename
        read  -p "Enter arguments: " arguments
        if [[ ! -e $filename ]] || [[ ! -x $filename ]]
        then
            echo "Invalid filename"
        else
            ./$filename $arguments 
        fi
    else
        [[ $cmd == "quit" ]] || echo "Error: unrecognized input"
    fi
        [[ $cmd == "quit" ]] || echo
done

echo "Goodbye"
exit 0



