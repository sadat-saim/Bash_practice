#!bash removeSpace.sh
#${str:startIndex:numberOfCharacters}
str='8 8 Bi fk8h B 8 BB8B B B  B888 c hl8 BhB fd'
len=${#str}
strArr=($(seq 1 $len))
for((i=0;i<len;i++));do
    strArr[$i]=${str:$i:1}
done
result=""
for i in ${strArr[@]};do
  result+=${i}
done
echo "$result"
echo ${strArr[@]}