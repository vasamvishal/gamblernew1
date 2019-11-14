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
   else
        echo "Loss"
fi
