echo "lower limit:"
read X
echo "upper limit:"
read Y
RANGE=$((Y-X+1))
RANDOM=$$

MAXCOUNT=10
count=1
while [ "$count" -le $MAXCOUNT ]; do
 array[$count]=$(($(($RANDOM%$RANGE))+X))
 let "count += 1"
done
echo "${array[@]}"

if [ "${#array[@]}" -lt 2 ]
then
  echo Incoming array is not large enough >&2
  exit 1
fi

largest=${array[0]}
secondGreatest='unset'

for((i=1; i < ${#array[@]}; i++))
do
  if [[ ${array[i]} > $largest ]]
  then
    secondGreatest=$largest
    largest=${array[i]}
  elif (( ${array[i]} != $largest )) && { [[ "$secondGreatest" = "unset" ]] || [[ ${array[i]} > $secondGreatest ]]; }
  then
    secondGreatest=${array[i]}
  fi
done

echo "secondGreatest = $secondGreatest"
