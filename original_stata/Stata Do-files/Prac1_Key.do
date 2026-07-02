#this file is not my work, copied from TA

**Start with a fresh memory by wiping any data in the system**
clear all

**Import our data when its an excel file**
import excel "C:\Users\Downloads\tutorialdata-1.xlsx", sheet("data") firstrow

**Rename (and relocate if needed) the dataset we just imported**
save "C:\Users\Downloads\tutorial_1.dta", replace

**Tell stata what data set to use for the next set of code**
use "C:\Users\Downloads\tutorial_1.dta", clear

**Rename Variables**
rename exp experience

**Get summary statistics for specified variables**
summarize earnings experience hours

**Get basic info of the data set quickly**
describe 
set more off
list earnings exp hours

**Create a new binary variable that takes value of 1 if age is 40 and 0 otherwise**
generate age40 = (age == 40)

**Generate a new variable called lnearn which is the natural log transformation of earnings
generate lnearn = ln(earnings)

**Using equations in stata**

**Define a variable z in Stata over the range 0 to 4 with 5 observations and all other values are missing (empty). 
**range var min max number**
range z 0 4 5
**List the values in a variable within a range**
**list variable_name in (start)/(end)**
list z in 1/5
**Create a variable k in Stata for the equation in your last tutorial k = (−((z − 2)^2) + 4)
generate k = (-((z-2)^2) + 4)

**Use Stata to calculate the definite integral over the range for k
**Example use: integ x^2 , range(0 1)**
integ k z

**Use Stata to generate a new variable kprime for the derivative of k
**Example Usage: **
dydx k z, gen(kprime)
