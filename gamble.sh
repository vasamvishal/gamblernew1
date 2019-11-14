#welcome gambler
STAKES=100
DAYS=20
bet=1
stake=100
WIN=1
LOSS=0
totalamount=0
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
      else
          diff=$(( $maxlimit-$stake ))
          totalamount=$(( $totalamount+$diff ))
   fi
bet=1;
STAKES=100;
done
echo "no of losses" $loss
echo "no of wins" $win
echo "totalamount" $totalamount

}
gamble
