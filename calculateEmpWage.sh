#!/bin/bash

declare -A dailyWage;

PRESENT=1;
PART_TIME=2;
WAGE_PER_HOUR=20;
MAX_WORKING_DAY=20;
MAX_WORKING_HOUR=40;

function getWorkingHour() {
	case $1 in
	$PRESENT)
		workingHour=8;
	;;

	$PART_TIME)
		workingHour=4;
	;;

	*)
		workingHour=0;
	;;
	esac
	echo $workingHour;
}

totalSalary=0;
totalWorkingHour=0;

day=0;

while [[ $day -lt $MAX_WORKING_DAY && $totalWorkingHour -lt $MAX_WORKING_HOUR ]]
do
	if [ $((totalWorkingHour+4)) -eq $MAX_WORKING_HOUR ]
	then
		isPresent=$PART_TIME;
	else
		isPresent=$((RANDOM%3));
	fi
	wHour=$(getWorkingHour $isPresent);
	dailyWage["Day$day"]=$((wHour * WAGE_PER_HOUR));
	totalSalary=$((totalSalary+${dailyWage["Day$day"]}));
	totalWorkingHour=$((totalWorkingHour+wHour));
	((day++));
done

echo "Emplpoyee monthly wage : $"$totalSalary" USD";
echo "Total Working Hour : "$totalWorkingHour;
echo "Total working day : "$day;

#echo ${dailyWage[@]};
#echo ${!dailyWage[@]};

for key in ${!dailyWage[*]}
do
	echo $key " : $"${dailyWage[$key]} "USD";
done
