**********************************************
*Author: Muhammad Wajahat Mirza 
*Date Created: 11 December 2019
*Purpose: CLass Project
*Stata Version 15
*Professor: Etienne Wasmer
**********************************************

clear all
capture log close
set more off
log using MirzaW_P.log, replace
*Import CSV file
import delimited /Users/mwajahatmirza/Desktop/5K_wajahat/Sports-women.csv  

**************CODE FOR SUB CONTINENT********************************
*Directory
cd "/Users/mwajahatmirza/Desktop/5K_wajahat"
* Generate a new var and assign it a value of 1 if the gender is Female. For non-female gender, make it 0.
g z = (gender_b == "Female")
* Generate a new var and place ranking value to it if gender is female
g z2 = 0
replace z2 = ranking_final_b_5 if z==1
* Generate a new var and replace it with ranking of women
g women_visibility_ranking= ranking_final_b_5 if z !=0
* Generate a new var for birth year of women
g z3 = 0
replace z3 = birth_b if z==1
g women_birth_b= birth_b if z !=0
* Generate a new var with death year of the women
g z4 = 0
replace z4 = death_b if z==1
g women_death_b= death_b if z !=0

* this encode assigns a numeric value to the string occupation. E.g giving value of 18 to cricket
encode final_occupation, gen (final_occupation2)
g z5= 0
replace z5 = final_occupation2 if z==1

*codebook
*check generally for frequency of missing values to get an idea of data set's reliability to help draw conclusions

* Cleaning the data and keeping only Pakistan, India, Chile, Argentina and any formerly association with these
keep if area1_of_ratt ==  "Pakistan" |area1_of_ratt == "Pakistan_(Former_political_/_geographical_entity)" |area1_of_ratt == "India" |area1_of_ratt == "India_(Former_political_/_geographical_entity)" |area1_of_ratt == "Argentina" |area1_of_ratt == "Argentina_(Former_political_/_geographical_entity)" |area1_of_ratt == "Chile" |area1_of_ratt == "Chile_(Former_political_/_geographical_entity)" | area2_of_ratt ==  "Pakistan" |area2_of_ratt == "Pakistan_(Former_political_/_geographical_entity)" |area2_of_ratt == "India" |area2_of_ratt == "India_(Former_political_/_geographical_entity)" |area2_of_ratt == "Argentina" |area2_of_ratt == "Argentina_(Former_political_/_geographical_entity)" |area2_of_ratt == "Chile" |area2_of_ratt == "Chile_(Former_political_/_geographical_entity)"
save DataAll, replace
* Export the data
export excel using "DataAll", replace

* This file only cleans the data for subcontinent - pakistan and India
keep if area1_of_ratt ==  "Pakistan" |area1_of_ratt == "Pakistan_(Former_political_/_geographical_entity)" |area1_of_ratt == "India" |area1_of_ratt == "India_(Former_political_/_geographical_entity)" | area2_of_ratt ==  "Pakistan" |area2_of_ratt == "Pakistan_(Former_political_/_geographical_entity)" |area2_of_ratt == "India" |area2_of_ratt == "India_(Former_political_/_geographical_entity)"
save DataSub, replace
export excel using "/Users/mwajahatmirza/Desktop/5K_wajahat/DataSub.xls", replace



* Using Subcontinental data only for the following.
* Here, data is divided into equal intervals to find mean ranking of each interval, mean birth year of each interval and mean ratio of women in each interval
use DataSub.dta

* Sort the file according to birth years
sort birth_b

* Take each interval of 90 data entries and do the following until the end. 
keep in 1/90
sum z
return list
* mean of women ratio in interval
gen y = r(mean)
* list all data entries
list y
*summarize
sum birth_b
*mean birth date/year in interval
gen x=r(mean)
list x
*potential check with sum_ln5
sum ranking_final_b_5
return list 
*avg rank in interval
gen w=r(mean)
save DataSub1, replace


use DataSub.dta

sort birth_b

keep in 91/180
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub2, replace


use DataSub.dta
sort birth_b
keep in 181/270
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub3, replace

use DataSub.dta
sort birth_b
keep in 271/360
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub4, replace

use DataSub.dta
sort birth_b
keep in 361/450
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub5, replace

use DataSub.dta
sort birth_b
keep in 451/540
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub6, replace

use DataSub.dta
sort birth_b
keep in 541/630
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub7, replace

use DataSub.dta
sort birth_b
keep in 631/720
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub8, replace

use DataSub.dta
sort birth_b
keep in 721/810
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub9, replace

use DataSub.dta
sort birth_b
keep in 811/900
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub10, replace

use DataSub.dta
sort birth_b
keep in 901/990
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub11, replace

use DataSub.dta
sort birth_b
keep in 991/1080
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub12, replace

use DataSub.dta
sort birth_b
keep in 1081/1170
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub13, replace

use DataSub.dta
sort birth_b
keep in 1171/1260
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub14, replace

use DataSub.dta
sort birth_b
keep in 1261/1350
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub15, replace

use DataSub.dta
sort birth_b
keep in 1351/1440
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub16, replace

use DataSub.dta
sort birth_b
keep in 1441/1530
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub17, replace

use DataSub.dta
sort birth_b
keep in 1531/1620
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub18, replace

use DataSub.dta
sort birth_b
keep in 1621/1710
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub19, replace

use DataSub.dta
sort birth_b
keep in 1711/1862
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub20, replace

*combine all the interval files created
append using DataSub1 DataSub2 DataSub3 DataSub4 DataSub5 DataSub6 DataSub7 DataSub8 DataSub9 DataSub10 DataSub11 DataSub12 DataSub13 DataSub14 DataSub15 DataSub16 DataSub17 DataSub18 DataSub19 DataSub20
save DataSubFinal, replace

*keyword list the professions and assign values to it
encode keyword_used, gen(keyword_used2)
g z6= 0
replace z6 = keyword_used2 if z==1
g women_keyword_used2= keyword_used2 if z !=0

* Take the square of it
gen x22=x^2
gen y22=y^2
gen w22=w^2

*rename the variables to be used for graphs
rename x avg_interval_birthyr
rename y avg_interval_wmnratio
rename w avg_interval_rank


*********************** Graphs ********************************************
*** this regresses women ratio with birthyear
regress avg_interval_wmnratio avg_interval_birthyr x22
* this regresses ranking with birthyear
regress avg_interval_rank avg_interval_birthyr x22
*this regresses ratio with ranking
regress avg_interval_wmnratio avg_interval_rank w22
* draws correlation of ratio and birthyear
corr avg_interval_wmnratio avg_interval_birthyr 
*draws correlation of ranking with birthyear
corr avg_interval_rank avg_interval_birthyr 
* draws correlation of ratio with ranking
corr avg_interval_wmnratio avg_interval_rank
* draws a scatter plot with curve of best fit of ratio with birthyear
twoway scatter avg_interval_wmnratio avg_interval_birthyr ||qfit avg_interval_wmnratio avg_interval_birthyr if avg_interval_rank
*draws a scatter plot with curve of best fit of rank with birthyear
twoway scatter avg_interval_rank avg_interval_birthyr if avg_interval_rank<1000000 || qfit avg_interval_rank avg_interval_birthyr if avg_interval_rank<1000000 
*draws a scatter plot with curve of best fit of ratio with ranking
twoway scatter avg_interval_wmnratio avg_interval_rank if avg_interval_rank<1000000 || qfit avg_interval_wmnratio avg_interval_rank if avg_interval_rank<1000000 
* historgeam of collective occupation with freq
hist keyword_used2, freq
* histogram of women occupation with freq
hist women_keyword_used2, freq

mean z birth_b living_people noccur_languages_b
tab avg_interval_wmnratio if strpos(string_citizenship_raw_d, "Pakistan")
twoway (line ratio var1 if country=="Pakistan") || (line ratio var1 if country=="Chile")

**************CODE FOR SOUTH AMERICA********************************

import delimited /Users/mwajahatmirza/Desktop/5K_wajahat/Sports-women.csv, clear  
*Directory
cd "/Users/mwajahatmirza/Desktop/5K_wajahat"
* Generate a new var and assign it a value of 1 if the gender is Female. For non-female gender, make it 0.
g z = (gender_b == "Female")
* Generate a new var and place ranking value to it if gender is female
g z2 = 0
replace z2 = ranking_final_b_5 if z==1
* Generate a new var and replace it with ranking of women
g women_visibility_ranking= ranking_final_b_5 if z !=0
* Generate a new var for birth year of women
g z3 = 0
replace z3 = birth_b if z==1
g women_birth_b= birth_b if z !=0
* Generate a new var with death year of the women
g z4 = 0
replace z4 = death_b if z==1
g women_death_b= death_b if z !=0

* this encode assigns a numeric value to the string occupation. E.g giving value of 18 to cricket
encode final_occupation, gen (final_occupation2)
g z5= 0
replace z5 = final_occupation2 if z==1

* This file only cleans the data for Chile and Argentina
keep if area1_of_ratt == "Argentina" |area1_of_ratt == "Argentina_(Former_political_/_geographical_entity)" |area1_of_ratt == "Chile" |area1_of_ratt == "Chile_(Former_political_/_geographical_entity)"|area2_of_ratt == "Argentina" |area2_of_ratt == "Argentina_(Former_political_/_geographical_entity)" |area2_of_ratt == "Chile" |area2_of_ratt == "Chile_(Former_political_/_geographical_entity)"
save DataSouthA, replace
export excel using "/Users/mwajahatmirza/Desktop/5K_wajahat/DataSouthA.xls", replace

* Using Subcontinental data only for the following.
* Here, data is divided into equal intervals to find mean ranking of each interval, mean birth year of each interval and mean ratio of women in each interval
use DataSouthA.dta
sum birth_b
* Sort the file according to birth years
sort birth_b

* Take each interval of 90 data entries and do the following until the end. 
keep in 1/296

sum z
return list
* mean of women ratio in interval
gen y = r(mean)
* list all data entries
list y
*summarize
sum birth_b
*mean birth date/year in interval
gen x=r(mean)
list x
*potential check with sum_ln5
sum ranking_final_b_5
return list 
*avg rank in interval
gen w=r(mean)
save DataSub1, replace

use DataSouthA.dta

sort birth_b

keep in 297/592

sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub2, replace


use DataSouthA.dta
sort birth_b
keep in 593/888
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub3, replace

use DataSouthA.dta
sort birth_b
keep in 889/1184
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub4, replace

use DataSouthA.dta
sort birth_b
keep in 1185/1480
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub5, replace

use DataSouthA.dta
sort birth_b
keep in 1481/1776
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub6, replace

use DataSouthA.dta
sort birth_b
keep in 1777/2072
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub7, replace

use DataSouthA.dta
sort birth_b
keep in 2073/2368
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub8, replace

use DataSouthA.dta
sort birth_b
keep in 2369/2664
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub9, replace

use DataSouthA.dta
sort birth_b
keep in 2665/2960
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub10, replace

use DataSouthA.dta
sort birth_b
keep in 2961/3256
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub11, replace

use DataSouthA.dta
sort birth_b
keep in 3257/3552
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub12, replace

use DataSouthA.dta
sort birth_b
keep in 3553/3848
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub13, replace

use DataSouthA.dta
sort birth_b
keep in 3849/4144
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub14, replace

use DataSouthA.dta
sort birth_b
keep in 4145/4440
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub15, replace

use DataSouthA.dta
sort birth_b
keep in 4441/4736
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub16, replace

use DataSouthA.dta
sort birth_b
keep in 4737/5032
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub17, replace

use DataSouthA.dta
sort birth_b
keep in 5033/5328
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub18, replace

use DataSouthA.dta
sort birth_b
keep in 5329/5624
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub19, replace

use DataSouthA.dta
sort birth_b
keep in 5625/5920
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub20, replace

use DataSouthA.dta
sort birth_b
keep in 5921/6216
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub21, replace

use DataSouthA.dta
sort birth_b
keep in 6217/6512
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub22, replace

use DataSouthA.dta
sort birth_b
keep in 6513/6808
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub23, replace

use DataSouthA.dta
sort birth_b
keep in 6809/7104
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub24, replace

use DataSouthA.dta
sort birth_b
keep in 7105/7400
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub25, replace

use DataSouthA.dta
sort birth_b
keep in 7401/7696
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub26, replace

use DataSouthA.dta
sort birth_b
keep in 7697/7992
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub27, replace

use DataSouthA.dta
sort birth_b
keep in 7993/8288
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub28, replace

use DataSouthA.dta
sort birth_b
keep in 8289/8584
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub29, replace

use DataSouthA.dta
sort birth_b
keep in 8585/8880
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub30, replace

use DataSouthA.dta
sort birth_b
keep in 8881/9176
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub31, replace

use DataSouthA.dta
sort birth_b
keep in 9177/9472
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub32, replace

use DataSouthA.dta
sort birth_b
keep in 9473/9768
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub33, replace

use DataSouthA.dta
sort birth_b
keep in 9769/10064
sum z
return list
gen y = r(mean)
list y
sum birth_b
gen x=r(mean)
list x
sum ranking_final_b_5
return list 
gen w=r(mean)
save DataSub34, replace

*combine all the interval files created
append using DataSub1 DataSub2 DataSub3 DataSub4 DataSub5 DataSub6 DataSub7 DataSub8 DataSub9 DataSub10 DataSub11 DataSub12 DataSub13 DataSub14 DataSub15 DataSub16 DataSub17 DataSub18 DataSub19 DataSub20 DataSub21 DataSub22 DataSub23 DataSub24 DataSub25 DataSub26 DataSub27 DataSub28 DataSub29 DataSub30 DataSub31 DataSub32 DataSub33 DataSub34
save DataSubFinal, replace

*keyword list the professions and assign values to it
encode keyword_used, gen(keyword_used2)
g z6= 0
replace z6 = keyword_used2 if z==1
g women_keyword_used2= keyword_used2 if z !=0

* Take the square of it
gen x22=x^2
gen y22=y^2
gen w22=w^2

*rename the variables to be used for graphs
rename x avg_interval_birthyr
rename y avg_interval_wmnratio
rename w avg_interval_rank


*********************** Graphs ********************************************
*** this regresses women ratio with birthyear
regress avg_interval_wmnratio avg_interval_birthyr x22
* this regresses ranking with birthyear
regress avg_interval_rank avg_interval_birthyr x22
*this regresses ratio with ranking
regress avg_interval_wmnratio avg_interval_rank w22
* draws correlation of ratio and birthyear
corr avg_interval_wmnratio avg_interval_birthyr 
*draws correlation of ranking with birthyear
corr avg_interval_rank avg_interval_birthyr 
* draws correlation of ratio with ranking
corr avg_interval_wmnratio avg_interval_rank
* draws a scatter plot with curve of best fit of ratio with birthyear
twoway scatter avg_interval_wmnratio avg_interval_birthyr if avg_interval_birthyr < 1997 & avg_interval_birthyr > 1910||qfit avg_interval_wmnratio avg_interval_birthyr if avg_interval_birthyr < 1997 & avg_interval_birthyr > 1910
*draws a scatter plot with curve of best fit of rank with birthyear
twoway scatter avg_interval_rank avg_interval_birthyr if avg_interval_rank <1600000  || lfit avg_interval_rank avg_interval_birthyr if avg_interval_rank <1600000
*draws a scatter plot with curve of best fit of ratio with ranking
twoway scatter avg_interval_wmnratio avg_interval_rank if avg_interval_rank<1600000 || qfit avg_interval_wmnratio avg_interval_rank if avg_interval_rank<1600000 
* historgeam of collective occupation with freq
hist keyword_used2, freq
* histogram of women occupation with freq
hist women_keyword_used2, freq

sort keyword_used2


mean z birth_b living_people noccur_languages_b



log close
