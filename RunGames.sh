#make and suppress all warnings
make clean &> /dev/null
make &> /dev/null

Wins=0
Games=10

#Run games through loop. then increment wins
for ((i=1; i<=Games; i++))
do

	#pipe all output to temp file, and suppress terminal output.
	#timeout 5 ./checkers computer "java MyProg" 5 &> test
	#timeout 5 ./checkers foo computer 3 -MaxDepth 3 &> test
	timeout 10 ./checkers "java MyProg" computer 3 -MaxDepth 5 &> test
	
	# grab who won
	t=$(tail -1 test | awk '{print $2}')

	if test "$t" = 2
	then
		Wins=$[Wins+1]
	fi

	rm test
done

#output W/L ratio.
echo "MyProg won " $Wins " games out of " $Games " versus Computer"


#commented code below for inspiration

#tanner=$(tail -1 test)

#echo "test output:" $tanner
#echo "test hawk: " 
#tail -1 test | awk '{print $1, $2}'
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

#elif test "$t" = 2
