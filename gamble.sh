#welcome gambler
STAKES=100
DAYS=6
bet=1
stake=100
WIN=1
luckyday=0
unluckday=0
LOSS=0
total=0;
losstotal=0
totalamount=0

declare -A dictionary
function percentage()
{
maxlimit=$(( $cash+$cash/2 ))
minlimit=$(( $cash/2 ))

}

function gamble()
{
cash=$STAKES
percentage
for (( count=0;count<DAYS;count++ ))
do
   while [ $bet!=0 ]
   do
    bet=$(( $bet +1 ))
    random=$(( RANDOM%2 ))
     if [ $random -eq $WIN ]
        then 
            STAKES=$(( $STAKES+1 ))
	if [ $STAKES -ge $maxlimit ]
           then
	       win=$(( $win+1 ))
	       break;
	fi
     else
        STAKES=$(( $STAKES-1 ))
        if [ $STAKES -le $minlimit ]
	   then
              loss=$(( $loss+1 ))
	      break
	fi
     fi
   done
   if [ $STAKES == $minlimit ]
      then

          totalamount=$(( $totalamount-$minlimit ))
          dictionary["day"$count]=$totalamount
      else
          diff=$(( $maxlimit-$stake ))
          totalamount=$(( $totalamount+$diff ))
	 dictionary["day"$count]=$totalamount
   fi
bet=1;
STAKES=100;
done
function luckday(){
 luckyDay=$(printf "%s\n" ${dictionary[@]} | sort -nr | head -1 )
 unLuckyDay=$(printf "%s\n" ${dictionary[@]} | sort -nr | tail -1 ) 
 echo $totalamount 
 for i in ${!dictionary[@]}
   do
     echo $i ":" ${dictionary[$i]}
   done
 for k in ${!dictionary[@]}
   do 
     if [  ${dictionary[$k]} -eq $luckyDay ]
        then
	   echo LuckyDay : $k Amount : $luckyDay
     fi
     if [ ${dictionary[$k]} -eq $unLuckyDay ] 
        then
            echo UnLuckyDay : $k Amount : $unLuckyDay
     fi
 done
}
echo "no of losses" $loss
echo "no of wins" $win
}
if [ $totalamount -ge -1 ]
then
 
   gamble
   luckday

fi

