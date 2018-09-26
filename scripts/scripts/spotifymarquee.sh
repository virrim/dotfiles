#!/bin/sh
#
# Little marquee-text script
# Written by Claudio M. Alessi
#

# Interval between permutation in the current marquee
INTERVAL=.3

# Interval between marquees
INTERVAL2=2

# Output program
#PRINT="$(which xsetroot) -name"
PRINT="echo -ne"

#
# Marquee text from right to the left
#
marquee_left()
{
	string="$(playerctl metadata xesam:artist; echo -n " - "; playerctl metadata xesam:title)"
	let eidx=${#string}+1

	for i in $(seq 1 $eidx)
	do
		let j=i-1
		strout="$(echo "$string" |cut -b $i-)"
		[ $j -ne 0 ] && strout="$strout$(echo "$string" |cut -b -$j)"
		$PRINT "$strout\r"
		sleep $INTERVAL
	done
}


#
# The main function
#
main()
{

	# Empty the title on exit
	for SIG in INT TERM
		do trap "$PRINT '' && exit" $SIG
	done

	n=0
	while true
	do
		let "$n"
		n=$?

		[ $n -ne 0 ] && marquee_left "$*"
		sleep $INTERVAL2
	done
}

main