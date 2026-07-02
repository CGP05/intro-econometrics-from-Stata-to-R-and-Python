**Data project 1 - figures**

clear all

**Import our data when its an excel file**
import excel "ECO220_DataProject_AI.xlsx", sheet("data") firstrow

**Rename (and relocate if needed) the dataset we just imported**
save "dataproject.dta", replace

**Tell stata what data set to use for the next set of code**
use "dataproject.dta", clear
**Create a new variable for GDP purchasing power parity per capita**gen GDP_PPP_PER_CAPITA = GDP_PPP / (POP * 1000)
**Create summary of all the variables**
summarize
**Demonstrating the created GDP PPP per capita variable
list Country GDP_PPP GDP_PPP_PER_CAPITA Overall_AI
**Correlations between the overall AI variable and each economic variable
 cor Overall_AI GDP_PPP_PER_CAPITA
cor Overall_AI GNI_CAP
cor Overall_AI GDP_PPP
cor Overall_AI GDPG
cor Overall_AI UNEMP
cor Overall_AI INF
cor Overall_AI CA
cor Overall_AI GDEBT
cor Overall_AI HDI
cor Overall_AI LIFE
**

**FIGURE 1**
**Create a histogram of the means of each AI variable
graph bar (mean) Overall_AI Talent_AI Infrastructure_AI OperatingEnvironment_AI Research_AI Development_AI GovernmentSTrategy_AI Commercial_AI Scale_AI Intensity_AI, ///
    title("Mean of Each AI Variable") ///
	ytitle("Index score out of 100") ///
	legend(size(small)) ///
	caption("Figure 1", position (6) size(small))

**FIGURE 2**
**Scatter plot of GDP per capita and overall AI**	
scatter Overall_AI GDP_PPP_PER_CAPITA, ///
    title("Overall AI vs GDP per Capita") ///
    xtitle("GDP per Capita (PPP, current international $)") ///
    ytitle("Overall AI Score (Index out of 100)") ///
	caption("Figure 2", position (6) size(small))
	
**FIGURE 3**
**Create an open string variable for regions**
gen region = ""

**Create a string variable for Asian countries**
replace region = "Asia" if inlist(Country, "Armenia", "Azerbaijan", "Bahrain", "Bangladesh", "China", "Hong Kong") ///
	| inlist(Country, "India", "Indonesia", "Iran", "Iraq", "Israel", "Japan") ///
	| inlist(Country, "Jordan", "Malaysia", "Oman", "Pakistan", "Philippines", "Qatar") ///
	| inlist(Country, "Saudi Arabia", "Singapore", "South Korea", "Sri Lanka", "Thailand", "Turkey") ///
	| inlist(Country, "United Arab Emirates", "Vietnam")

**Create a string variable for African countries**
replace region = "Africa" if inlist(Country, "Algeria", "Benin", "Egypt", "Ethiopia", "Ghana", "Kenya") ///
	| inlist(Country, "Mauritius", "Morocco", "Nigiria", "Rwanda", "South Africa", "Tunisia")

**Create a string variable for North American countries**
replace region = "North America" if inlist(Country, "Canada", "Mexico", "United States")

**Create a string variable for South American countries**
replace region = "South America" if inlist(Country, "Argentina", "Brazil", "Chile", "Colombia", "Peru", "Uruguay")

**Create a string variable for Oceanian countries**
replace region = "Oceania" if inlist(Country, "Australia", "New Zealand") 

**Create a string variable for European countries**
replace region = "Europe" if inlist(Country, "Austria", "Belgium", "Bulgaria", "Croatia", "Czech Republic", "Denmark") ///
	| inlist(Country, "Estonia", "Finland", "France", "Germany", "Greece", "Hungary") ///
	| inlist(Country, "Iceland", "Ireland", "Italy", "Latvia", "Lithuania", "Luxembourg") ///
	| inlist(Country, "Malta", "Netherlands", "Norway", "Poland", "Portugal", "Romania") ///
	| inlist(Country, "Russia", "Serbia", "Slovakia", "Slovenia", "Spain", "Sweden") ///
	| inlist(Country, "Switzerland", "Ukraine", "United Kingdom")
	
**Scatter plot of GDPG vs Talent_AI**	
twoway scatter GDPG Talent_AI, by(region) ///
    ytitle("Real GDP Growth (Annual % Change)", size(small)) ///
    xtitle("Talent AI Index (Out of 100)", size(small)) ///
    title("Talent AI Index vs GDPG by Region", size(small))

	
**FIGURE 4**
**Create levels of development using GNI per capita**
gen income = "Low Income" if GNI_CAP < 10000
replace income = "Lower Middle Income" if GNI_CAP >= 10000 & GNI_CAP < 25000
replace income = "Upper Middle Income" if GNI_CAP >= 25000 & GNI_CAP < 50000
replace income = "High Income" if GNI_CAP > 50000
label var income "Level of Development (by GNI per Capita)"

**Order the strings**
label define income_ord 0 "Low Income" 1 "Lower Middle Income" 2 "Upper Middle Income" 3 "High Income"
encode income, gen(income_ordered) label(income_ord)
	
**Create a box plot for Development_AI for income levels**
graph box Development_AI, over(income_ordered) ///
    ytitle("Development AI Score") ///
    title("Development AI by Income Level", size(medium)) ///
	caption("Figure 4", position(6))


