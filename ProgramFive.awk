# Nate McCain
# CS 390
# Project 5
# 11/06/2017 line 4

BEGIN {
	# Print out the report header.
	printf "\n---------------------------- BEGIN STATISTICS REPORT ----------------------------\n"
	printf "\nLASTNAME    , FIRSTNAME       AVG   SLG   OBP    \n\n"
}

# If the number of inputs is correct.
NF==9{
	# If the name is legal.
	if (($1 ~ /^[a-zA-Z'.\-]+$/) && ($2 ~ /^[a-zA-Z'.\-]+$/)){

		# If only numbers are given for inputs 3 through 9.
		if (($3 ~ /^[0-9]+$/) && ($4 ~ /^[0-9]+$/) && ($5 ~ /^[0-9]+$/) && ($6 ~ /^[0-9]+$/) && ($7 ~ /^[0-9]+$/) && ($8 ~ /^[0-9]+$/) && ($9 ~ /^[0-9]+$/)){
			

			# If the given values are possible, and the first two stats don't start with a 0.
			if (($3 >= ($5 + $6 + $7 + $8 + $9)) && ($4 >= ($5 + $6 + $7 + $8)) && ($3 ~ /^[1-9][0-9]*$/) && ($4 ~ /^[1-9][0-9]*$/)){
				
				# Everything is correct, we can report a stat.
				avg=($5+$6+$7+$8)/$4
				slg=((1*$5)+(2*$6)+(3*$7)+(4*$8))/$4
				obp=($5+$6+$7+$8+$9)/$3
				
				# Print out the statistics for the batter.
				printf "%-12s, %-12s : %1.3f %1.3f %1.3f \n", $2, $1, avg, slg, obp
				
			} else{
				# If all given stats are zero
				if (($3 == 0) && ($4 == 0) && ($5 == 0) && ($6 == 0) && ($7 == 0) && ($8 == 0) && ($9 == 0)){
					# All calculated stats will be zero.
					avg=0
					slg=0
					obp=0
					
					# Print out the statistics for the batter.
					printf "%-12s, %-12s : %1.3f %1.3f %1.3f \n", $2, $1, avg, slg, obp
				} else{
					# Impossible stat line given. Print out the error message.
					printf "%-12s, %-12s : The statistics given are impossible to achieve.\n", $2, $1
				}
			}
		} else{
			# At least one of the statistics is not given in the correct format. Print out the error message.
			printf "%-12s, %-12s : The statistics given are not in the correct format.\n", $2, $1
		}
	} else{
		# The name is not in a legal format. Print out the error message.
		printf "%-12s, %-12s : This is not a valid name.\n", $2, $1
	}
}

# If there are too many inputs.
NF>9{
	# Print out the error message.
	printf "ERROR: Too much information.\n"
}

# If there are not enough inputs.
NF<9{
	# Print out the error message.
	printf "ERROR: Not enough information.\n"
}

END {
	printf "\n----------------------------- END STATISTICS REPORT -----------------------------\n\n"
}