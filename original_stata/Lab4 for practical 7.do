**Create a random variable by generating 100 random numbers on the interval [0,1) with equal probability of any number occurring
clear all
**set the number of observations that will be drawn
set obs 100
**set the random number starting point in the computer algorithm so results can be replicated again
set seed 1
**Stata’s built in command for pseudorandom (algorithm approx random) drawn from uniform distribution over [0,1)
gen unif = runiform()
hist unif
drop _all

**Prove the law of large numbers holds by flipping a 2 sided coin

**Generate 10 random numbers that can only take the values 1 or 2 with equal probability
**set the number of observations that will be drawn
set obs 10
**set the random number starting point in the computer algorithm so results can be replicated again
set seed 1
**draw observations randomly from discrete uniform distribution over values 1 and 2 (at this point students just need to know this code draws randomly over values 1 and 2 with equal probability)
generate coin = floor((2)*runiform() + 1)
**set and assign labels so value 1 is tails and value 2 is heads
label define heads 1 tails 2 heads
label value coin heads
**Generate the histogram for heads and tails and save it to memory as coin10
histogram coin, discrete percent xlabel(1 2, valuelabel) xmtick(none) title(Random Coin Flips (10 Obs)) name(coin10)
drop _all
**repeat with 100 observations
set obs 100
set seed 1
generate coin = floor((2)*runiform() + 1)
label value coin heads
histogram coin, discrete percent xlabel(1 2, valuelabel) xmtick(none) title(Random Coin Flips (100 Obs)) name(coin100)
drop _all
**repeat with 1000 observations
set obs 1000
set seed 1
generate coin = floor((2)*runiform() + 1)
label value coin heads
histogram coin, discrete percent xlabel(1 2, valuelabel) xmtick(none) title(Random Coin Flips (1000 Obs)) name(coin1000)
drop _all
**repeat with 100000 observations
set obs 100000
set seed 1
generate coin = floor((2)*runiform() + 1)
label value coin heads
histogram coin, discrete percent xlabel(1 2, valuelabel) xmtick(none) title(Random Coin Flips (100000 Obs)) name(coin100000)
**graph them all together and notice the law of large numbers holds (empirical probability becomes theoretical probability as number of observations goes to infinity)
graph combine coin10 coin100 coin1000 coin100000, ycommon

**Use Stata to replicate flipping a second coin 100000 times, look at both and add them together
set seed 10001
generate coin2 = floor((2)*runiform() + 1)
label value coin2 heads
histogram coin2, discrete percent xlabel(1 2, valuelabel) xmtick(none) title(Random Coin Flips (100000 Obs)) name(coin2)
graph combine coin100000 coin2, ycommon
gen flip = coin + coin2
label define flip 2 twotails 3 onetailonehead 4 twoheads
label value flip flip
histogram flip, discrete percent xlabel(2 3 4, valuelabel) xmtick(none) title(Two Random Coin Flips (100000 Obs)) name(flip)
drop _all

clear

**Generate a Venn Diagram to show the event A rolling 3 or less (1, 2, 3) and event B getting an even roll (2, 4, 6)
ssc install pvenn, replace
**generate eventA
input eventA
1
1
1
0
0
0
end
**generate eventB
input eventB
0
1
0
1
0
1

**generate the venn diagram using event variables
pvenn eventA eventB, labels("A: roll<= 3" "B: even")
**manually pvenn, plabel(eventA eventB) pA(3) pB(3) pC(0) pAB(1) pAC(0) pBC(0) ptotal(6)

**Use this information to calculate probability of event A and B
gen AandB = 1 if eventA==1 & eventB==1
replace AandB = 0 if eventA==0 | eventB==0
sum AandB

**Use this information to calculate probability of event A or B
gen AorB = 1 if eventA==1 | eventB==1
replace AorB = 0 if eventA==0 & eventB==0
sum AorB

**Use this information to calculate probability of event not A and B
gen notAandB = 1-AandB
sum notAandB
clear
