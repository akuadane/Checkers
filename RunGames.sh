#make and suppress all warnings
make clean &> /dev/null
make &> /dev/null
javac MyProg.java

Wins=0
Losses=0
Games=10

#Run games through loop. then increment wins
for ((i=1; i<=Games; i++))
do

	#pipe all output to temp file, and suppress terminal output.
	#timeout 5 ./checkers computer "java MyProg" 5 &> test
	#timeout 5 ./checkers foo computer 3 -MaxDepth 3 &> test
	./checkers "java MyProg" computer 2 -MaxDepth 5 &> test
	 

	
	
	# grab who won
	t=$(tail -1 test | awk '{print $2}')

	if test "$t" = 2
	then
		Wins=$[Wins+1]
	elif test "$t" = 1
	then
		Losses=$[Losses+1]
		tail test
	fi

	rm test
done

#output W/L ratio.
echo "MyProg won " $Wins " and lost " $Losses " out of " $Games "  versus computer"


