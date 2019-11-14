#welcome gambler
STAKES=100
bet=1
WIN=1
LOSS=0
random=$(( RANDOM%2 ))
bet=$(( $bet +1 ))
if [ $random -eq $WIN ]
   then 
        echo "Win"
	if [ $STAKES -ge $(( $STAKES+$STAKES/2 )) ]
           then
		break;
	fi
   else
        echo "Loss"
        if [ $STAKES -le $(( $STAKES/2 )) ]
	   then
		break

	fi
fi
