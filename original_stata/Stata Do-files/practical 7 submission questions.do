**Use Stata to replicate rolling a 6 sided die 10000 times
label define sides dice 1 "1" 2 "2" 3 "3" 4 "4" 5 "5" 6 "6"
*Set the number of observations that will be drawn to 10000 and the seed
set obs 10000
set seed 3
*Draw observations randomly from discrete uniform distribution over values 1 to 6
generate die = floor((6)*runiform() + 1)
*Generate the histogram for 10000 observations of your random variable
histogram die, discrete percent xlabel(1 2 3 4 5 6, valuelabel) xmtick(none) title(Random Coin Flips (10000 Obs)) name(die10000)
drop _all

clear
**Use Stata to replicate rolling a second 6 sided die 10000 times, look at both and add them together
label define sides_die1 1 "1" 2 "2" 3 "3" 4 "4" 5 "5" 6 "6"
generate die_2 = floor((6)*runiform() + 1)

*Reset the seed in the computer algorithm to get a different random result
set seed 7
*Redo the steps above to generate a new 10000 observations for a second die
set obs 10000
generate die = floor((6)*runiform() + 1)

set seed 8
generate die_2 = floor((6)*runiform() + 1)
*Add together the two rolls of the die
generate dice = die + die_2
*Generate the histogram for the 10000 observations of your new combined random variable (made from two random variables)
label define sides die_2 1 "1" 2 "2" 3 "3" 4 "4" 5 "5" 6 "6"
histogram dice, discrete percent xlabel(1 2 3 4 5 6, valuelabel) xmtick(none) title(Random Dice Rolls (10000 Obs)) name(dice10000)

drop _all