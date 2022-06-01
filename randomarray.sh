echo "lower limit:"
read X
echo "upper limit:"
read Y
RANGE=$((Y-X+1))
RANDOM=$$

MAXCOUNT=10
count=1

while [ "$count" -le $MAXCOUNT ]; do
 number[$count]=$(($(($RANDOM%$RANGE))+X))
 let "count += 1"
done
echo "${number[@]}"
