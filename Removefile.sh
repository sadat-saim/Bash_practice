#!bash BashScripts/Removefile.sh
#removes the file with the extension of exe
# rm -i "./$(ls | grep "\.exe")"

# n=1
# # Iterate the loop for 5 times
# while [ $n -le 5 ]
# do
#     # Print the value of n in each iteration
#     echo "Running $n time"
#     # Increment the value of n by 1
#     (( n++ ))
# done

#output of ls is the name array and i is the element of the array
# name=($(ls))
# for i in ${name[@]};do
#  echo ${i}
# done
accum () {
  str=$1
  #Lowercase all characters
  str=$(tr '[:upper:]' '[:lower:]' <<<"$str")
  len=${#str};
  final=""
  rep=""
  echo $str
  echo $len
  for ((i=0; i<len; i++));do
    for ((j=0; j<=$i; j++));do
            rep+=${str:$i:1}
    done
    rep+="-"
    #uppercas the first character
    final+="${rep^}"
    rep=""
  done
  finLen=${#final}
  echo ${final:0:$((finLen-1))}
}
accum "ZpglnRxqenU"
