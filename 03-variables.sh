a=100
b=Devops

echo ${a}times
echo $b

DATE=$(date +%F)
echo "Today's" date is $DATE

echo  Time is $(date +%T)

x=10
y=20
z=$(($x+$y))

echo Addition of $x and $y is $z

## Array 

c=(10 20 first second 45 third)

echo ${c[0]}
echo ${c[1]}
echo ${c[2]}
echo ${c[3]}
echo ${c[*]}

## Environment Variable 

echo training = ${TRAINING}
echo training = $TRAINING