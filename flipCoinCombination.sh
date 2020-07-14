#!/bin/bash
declare -A dict
dict=(["H"]=0 ["T"]=0)
declare -A dict2
dict2=(["HH"]=0 ["TT"]=0 ["TH"]=0 ["HT"]=0)
read -p "Number of times to flip the coin" n
for (( i=1;i<=$n;i++ ))
do
        flip=$(( RANDOM%2 ))
        if [ $flip -eq 0 ]
        then
                key="T"
        else
                key="H"
        fi
        dict[$key]=$(( ${dict[$key]}+1 ))
	key1=""
	for(( j=1;j<=2;j++ ))
	do
		flip1=$(( RANDOM%2 ))
		if [ $flip1 -eq 0 ]
		then
			key1=$key1"T"
		else
			key1=$key1"H"
		fi
	done
        dict2[$key1]=$(( ${dict2[$key1]}+1 ))
done
for index in  ${!dict[@]}
do
        echo "Number of times $index appears is "${dict[$index]}
        percent=`echo ${dict[$index]} $n | awk '{print $1/$2}'`
        percentage=`echo $percent 100 | awk '{print $1*$2}'`
        echo "The percentage of $index is "$percentage
done
for index in  ${!dict2[@]}
do
        echo "Number of times $index appears is "${dict2[$index]}
        percent=`echo ${dict2[$index]} $n | awk '{print $1/$2}'`
        percentage=`echo $percent 100 | awk '{print $1*$2}'`
        echo "The percentage of $index is "$percentage
done
