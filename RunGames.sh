#make and suppress all warnings
make clean &> /dev/null
make &> /dev/null

#pipe all output to temp file
./checkers "java MyProg" computer 5 &> test

P1Wins=0
P2Wins=0
#could add for loop, 
#then increment wins and output W/L ratio.

tanner=$(tail -1 test)

#echo "test output:" $tanner

#echo "test hawk: " 

#tail -1 test | awk '{print $1, $2}'

t=$(tail -1 test | awk '{print $2}')

if test "$t" = 1
then
	echo " player one has lost"
elif test "$t" = 2
then		
	echo " player two has lost"
fi

rm test

#num=0
#total=0
	#num=$[num+10]

	#tanner=$(java RandomTest $num | awk '{print $1;}' )
		
	#if test "$tanner" = "PASS"
	#then
	#	total=$[total+1]
	#fi

#echo "For numRandoms =" $num "     pass rate = " $total 

#rm *.class
