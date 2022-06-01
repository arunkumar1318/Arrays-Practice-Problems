array=(7 8 9)
result2=0
for i  in ${array[@]};
do
    result2=$((result2+i))  
done
echo $result2
