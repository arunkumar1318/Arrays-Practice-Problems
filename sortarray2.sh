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
max=${array[0]}
secondmax=${array[1]}
min=${array[1]}
secondmin=${array[0]}

for i in "${array[@]}"
do
	if [[ $i -lt $min ]]
	then
		secondmin=$min
		min=$i
	fi
done
for i in "${array[@]}"
do
	if [[ $i -lt $secondmin && $i -ne $min ]]
	then
		secondmin=$i
	fi
done

echo "min : $min"
echo "secondmin : $secondmin"

for i in "${array[@]}"
do
        if [[ $i -gt $max ]]
        then
                secondmax=$max
                max=$i
        fi
done
for i in "${array[@]}"
do
        if [[ $i -gt $secondmax && $i -ne $max ]]
        then
                secondmax=$i
        fi
done

echo "max : $max"
echo "secondmax : $secondmax"
