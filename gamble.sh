#welcome gambler
STAKES=100
bet=1
WIN=1
LOSS=0
random=$(( RANDOM%2 ))

function percentage()
{
maxlimit=$(( $cash+$cash/2 ))
minlimit=$(( $cash/2 ))

}
function gamble()
{
bet=$(( $bet +1 ))
cash=$STAKES
percentage
if [ $random -eq $WIN ]
   then 
        echo "Win"
	if [ $STAKES -ge $maxlimit ]
           then
		break;
	fi
   else
        echo "Loss"
        if [ $STAKES -le $minlimit ]
	   then
		break

	fi
fi
}
gamble
