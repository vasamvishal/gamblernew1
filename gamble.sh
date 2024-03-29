#welcome gambler
#CONSTANT
STAKES=100
DAYS=6
BETAMOUNT=1
WIN=1
LOSS=0
EXPECTED_AMOUNT=-1

#variable
stake=$STAKES
luckyday=0
unluckday=0
total=0;
bet=$BETAMOUNT
losstotal=0
totalamount=0

declare -A daysValue
function percentage()
{
	maxlimit=$(( $cash+$cash/2 ))
	minlimit=$(( $cash/2 ))
}

function gambling()
{
	cash=$STAKES
	percentage
	for (( count=0;count<$DAYS;count++ ))
	do
   		while [ $bet!=0 ]
   		do
   			bet=$(( $bet +1 ))
   			random=$(( RANDOM%2 ))
   			if [ $random -eq $WIN ]
   			then 
				cash=$(( $cash+1 ))
			if [ $cash -ge $maxlimit ]
   			then
				win=$(( $win+1 ))
	   		break;
			fi
   			else
      				cash=$(( $cash-1 ))
   			if [ $cash -le $minlimit ]
			then
      				loss=$(( $loss+1 ))
	   		break
			fi
   			fi
   		done
   			if [ $cash == $minlimit ]
   			then
				totalamount=$(( $totalamount-$minlimit ))
      				daysValue["day"$count]=$totalamount
   			else
      				diff=$(( $maxlimit-$stake ))
      				totalamount=$(( $totalamount+$diff ))
	   			daysValue["day"$count]=$totalamount
   			fi
      				bet=1;
      				cash=100;
	done
}

function searchingDictionary()
{       
        local days
        local keys
	profitValue=$(printf "%s\n" ${daysValue[@]} | sort -nr | head -1 )
	lossValue=$(printf "%s\n" ${daysValue[@]} | sort -nr | tail -1 ) 
	echo $totalamount 
	for days  in ${!daysValue[@]}
	do
 		echo $days ":" ${daysValue[$days]}
   	done
	for keys in ${!daysValue[@]}
  	do 
		if [  ${daysValue[$keys]} -eq $profitValue ]
		then
	   		echo LuckyDay : $k Amount : $profitValue
   		fi
		if [ ${daysValue[$keys]} -eq $lossValue ] 
   		then
			echo UnLuckyDay : $k Amount : $lossValue
  		fi
 	done
}

	while [ $totalamount -ge $EXPECTED_AMOUNT ]
   	do 
   		gambling
   		searchingDictionary
   	done

