a=100
b=Devops

echo ${a}times
echo $b

DATE=$(date +%F)
echo "Today's" date is $DATE

echo  Time is $(date +%T)  ## Statement

x=10
y=20
z=$(($x+$y))  ##expression

echo Addition of $x and $y is $z

## Array 

c=(10 20 first second 45 third)

echo ${c[0]}
echo ${c[1]}
echo ${c[2]}
echo ${c[3]}
echo ${c[*]}

## Environment Variable 
TRAINING=Devops -- in SSH
export TRAINING -- in SSH 
or 
export TRAINING=DevOps -- in SSH 

echo training = ${TRAINING}
echo training = $TRAINING