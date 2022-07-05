#!bash Bash.sh
echo "hello world";
name="Saim";
last_name="Sadat";
echo "hello $name";
echo 'Hello $name';
echo ${name};
echo ${name:2};#returns im... string sliceing from 2 to length
echo ${name:0:2};#string:start:end; string slice
echo ${#name};#string length #sign before string

array=(One two three four five)
echo $array; #returns first element
echo ${array[1]}; #0 indexed array
echo ${array[@]}; #returns all elements of array
echo ${#array[0]}; #prints nuber of characters in the first element
echo ${array[@]:1:2}; #array slice from 1 and number is 2

for i in ${array[@]}; do
 echo ${i} 
 done;
#prints all elements of array one by one
echo {1..10}; #prints 1 to 10 number
echo {a..z}; #prints a to z
Variable=3
# Bash uses a `case` statement that works similarly to switch in Java and C++:
case "$Variable" in
    # List patterns for the conditions you want to meet
    0) echo "There is a zero.";;
    1) echo "There is a one.";;
    *) echo "It is not null.";;  # match everything
esac

# `for` loops iterate for as many arguments given:
# The contents of $Variable is printed three times.
for Variable in {1..3}
do
    echo "$Variable"
done
# Or write it the "traditional for loop" way:
for ((a=1; a <= 3; a++))
do
    echo $a
done
# They can also be used to act on files..
# This will run the command `cat` on file1 and file2
for Variable in file1 file2
do
    cat "$Variable"
done
# Only prints the first occurance
for Output in $(ls | grep "\.txt")
do
    cat "$Output"
done
# Prints all the occurance
for Output in ./*.txt
do
    cat "$Output"
done

while [ true ]
do
    echo "loop body here..."
    break
done

# You can also define functions
# Definition:
function foo ()
{
    echo "Arguments work just like script arguments: $@"
    echo "And: $1 $2..."
    echo "This is a function"
    returnValue=0    # Variable values can be returned
    return $returnValue
}
# Call the function `foo` with two arguments, arg1 and arg2:
foo arg1 arg2
# => Arguments work just like script arguments: arg1 arg2
# => And: arg1 arg2...
# => This is a function
# Return values can be obtained with $?
resultValue=$?
echo "Last program's return value: $?"
# More than 9 arguments are also possible by using braces, e.g. ${10}, ${11}, ...

# or simply
bar ()
{
    echo "Another way to declare functions!"
    return 0
}
# Call the function `bar` with no arguments:
bar # => Another way to declare functions!

# Calling your function
foo "My name is" $Name
# Built-in variables:
# There are some useful built-in variables, like

echo "Script's PID: $$"
echo "Number of arguments passed to script: $#"
echo "All arguments passed to script: $@"
echo "Script's arguments separated into different variables: $1 $2..."
################################################################
echo "I am currently in $(pwd)"; #Notice you should use first bracket instead of Second
echo "I am currently in $PWD"; #Both gives same result
echo $(ls);#Executes the command ls
#echo $(clear); #Clears the screen
##############################################################
#Input a Value from a user and save in in a variable and prints it out
echo "What is your name?"
read name;
echo "your name is $name"; 

if [ "$name" != 'saim' ]
then
    echo "Your name isn't your username" && echo "saim";
else
    echo "Your name is your username" || echo "saim";
fi

if [ "$name" == "saim" ] || [ "$name" == "sam" ]
then
    echo "This will run if $name is Daniya OR Zach."
fi

# There is also the `=~` operator, which tests a string against a Regex pattern:
Email=me@example.com
if [[ "$Email" =~ [a-z]+@[a-z]{2,}\.(com|net|org) ]]
then
    echo "Valid email!"
fi
# Note that =~ only works within double [[ ]] square brackets,
# which are subtly different from single [ ].
# See https://www.gnu.org/software/bash/manual/bashref.html#Conditional-Constructs for more on this.
# Redefine command `ping` as alias to send only 5 packets

# alias bundle different command into one namespace
# alias ping='ping -c 5'
# # Escape the alias and use command with this name instead
# \ping 192.168.1.1
# # Print all aliases
# alias -p
echo $((10+5))

# This command has options that control its execution:
#ls -l # Lists every file and directory on a separate line
#ls -t # Sorts the directory contents by last-modified date (descending)
#ls -R # Recursively `ls` this directory and all of its subdirectories
# Results of the previous command can be passed to the next command as input.
# The `grep` command filters the input with provided patterns.
# That's how we can list .txt files in the current directory:
# ls -l | grep "\.txt"
# # Use `cat` to print files to stdout:
# cat row.txt
# # We can also read the file using `cat`:
# Contents=$(cat row.txt)
# echo -e "\n$Contents"
# "\n" prints a new line character
# "-e" to interpret the newline escape characters as escape characters

# Use `mv` to move files or directories from one place to another.
# `mv` is similar to `cp`, but it deletes the source.
# `mv` is also useful for renaming files!
# mv row.txt col.txt # row.txt changed to col.txt

# # Use `mkdir` to create new directories.
# mkdir myNewDir
# # The `-p` flag causes new intermediate directories to be created as necessary.
# mkdir -p myNewDir/with/intermediate/directories
# # if the intermediate directories didn't already exist, running the above
# # command without the `-p` flag would return an error


#"|"is pipe command which means the output of first command is the input of second command
echo "There are $(ls | wc -l) items here."
#wc means word count
# wc -c <filename> prints the byte count
# wc -l <filename> prints the line count
# wc -m <filename> prints the character count
# wc -w <filename> prints the word count
# wc -L <filename> prints the length of the longest line (GNU extension)

# You should be aware that bash only performs integer arithmetic. If you have floating point numbers (numbers with decimals), then there are other tools to assist. For example, use bc:
# $ b=3.14
# $ echo "$(($b + 1))"
# bash: 3.14 + 1: syntax error: invalid arithmetic operator (error token is ".14 + 1")
# $ echo "$b + 1" | bc -l
# 4.14
