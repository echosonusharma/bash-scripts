#! /bin/bash


echo "this file is not to be executed !"

exit 1

# multi-line comment
:'
to make a file executable do // chmod +x [file name] // does nothing wsl or git bash
add a .sh extension so that it could run in any linux shell just not bash
place your script in the bin folder {mkdir bin} in your home dir {cd ~} so you can run it from anywhere in the shell
'

# create a file in the current dir and write into it //ctrl+c to exit and it would rewrite everytime 
cat > file.txt
# to append
cat >> file.txt


# here doc
cat << _zzzzz_ 
 you can write anything inside it that you 
 want to sho in the output. the Delimiter can be anything you want
 not just _zzzzz_ but as you will use it to end this, you can not
 use it inside the output txt
_zzzzz_


# variables
'variable name'='variable value'
count=10

echo ${count} #to use the variable

# if else
if [ "contions to evaluate" ]
then 
   "things to do if the condition is valid"
elif [ "some other contions to evaluate" ]
then
   "things to do if the condition is valid"
else
   "things to do if non of the conditions are valid"
fi # to end the  if else

#
if [ 3 -eq 5 ] # is equals to
if [ 3 -ne 5 ] # is not equals to
if [ 3 -gt 5 ] # is grater than
if [ 3 -ge 5 ] # is greater than or equal to
if [ 3 -lt 5 ] # is less than
if [ 3 -le 5 ] # is less than or equal to

# to use angle brackets
if (( 3 == 9 )) # comparison
if (( 3 != 9 ))
if (( 3 > 9 ))
if (( 3 >= 9 ))
if (( 3 < 9 ))
if (( 3 <= 9 ))

#
# only if both conditions are valid
if [ 5 -eq 5 ]  && [ 3 -ne 5 ] 
if [[ 5 -eq 5   &&  3 -ne 5 ]]
if [ 5 -eq 5  -a  3 -ne 5 ] # and

#
# if one of the condition is valid
if [ 5 -eq 5 ]  || [ 3 -ne 5 ] 
if [ 5 -eq 5  -o  3 -ne 5 ] # or


# null and not null cases with string
if [ -z "$s" ] # string is null. that is, has zero length
if [ -n "$s" ] # string is not null. 



# loop

# for
for i in 1 2 3 4 5 
do 
    echo $i
done

# form 0 to 30
for i in {0..30} 
do 
    echo $i
done


# form 0 to 30 with increment of 3
for i in {0..30..3} # {starting..ending..increment}
do 
    echo $i
done


#
for (( i=0; i<=10; i++ ))
do
    echo $i
done


# break 
# break statement will break out of the loop
for (( i=0; i<=10; i++ ))
do
    if [ $i -gt 5 ]
    then 
        break # brakes out of the for loop
    fi
    echo $i
done

# continue
for (( i=0; i<=10; i++ ))
do
    if [ $i -eq 5 ] || [ $i -eq 7 ] # enter if it's valid
    then 
        echo "walla" # do things told to do
        continue # continue on with parent loop
    fi
    echo $i
done

# while
number=1
while [ $number -lt 10 ]  # runs the loop while the condition is true
do
   echo "$number"
   number=$(( number+1 ))
done 


# until
number=1
until [ $number -gt 10 ]  # runs the loop until the condition is true (i.e. while the condition is false).
do
   echo "$number"
   number=$(( number+1 ))
done 



# file test operator                 

( -e and -a ) # to check if file exists
# -a is deprecated and its use is discouraged.

-f # file is a regular file (not a directory or device file)

-d # file is a directory

( -h and -L ) # file is a symbolic link

-b # file is a block device

-c # file is a character device

-p # file is a pipe

-S # file is a socket

-s # file is not zero size

-t # file (descriptor) is associated with a terminal device
:'
This test option may be used to check whether 
the stdin [ -t 0 ] or stdout [ -t 1 ] 
in a given script is a terminal.
'
-r # file has read permission (for the user running the test)

-w # file has write permission (for the user running the test)

-x # file has execute permission (for the user running the test)

-g # set-group-id (sgid) flag set on file or directory

-u # set-user-id (suid) flag set on file

-k # sticky bit set

-O # you are owner of file

-G # group-id of file same as yours

-N # file modified since it was last read

-nt # file f1 is newer than f2
if [ "$f1" -nt "$f2" ]

-ot # file f1 is older than f2
if [ "$f1" -ot "$f2" ]

-ef # files f1 and f2 are hard links to the same file
if [ "$f1" -ef "$f2" ]

! # "not" -- reverses the sense of the tests above (returns true if condition absent).