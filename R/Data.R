#' Ice cream data
#'
#' Nutritional information on vanilla and chocolate ice cream from a sample of
#' companies.
#'
#' @name Icecream
#' @docType data
#' @format A data frame with 39 observations on the following 7 variables.
#' \describe{
#' \item{Brand}{Brand name}
#' \item{VanillaCalories}{Calories per serving in vanilla}
#' \item{VanillaFat}{Fat per serving (g) in vanilla}
#' \item{VanillaSugar}{Sugar per serving (g) in vanilla}
#' \item{ChocCalories}{Calories per serving in chocolate}
#' \item{ChocFat}{Fat per serving (g) in chocolate}
#' \item{ChocSugar}{Sugar per serving (g) in chocolate}
#' }
#' @source Data collected by Carleton student Ann Butkowski (2008).
#' @keywords datasets
#' @examples
#'
#' head(Icecream)
#' t.test(Icecream$VanillaCalories, Icecream$ChocCalories, paired = TRUE)
#'
NULL


#' Milkshakes (chocolate)
#' Nutrional information on chocolate milkshakes from a sample of restaurants.
#'
#' @name Milkshakes
#' @docType data
#' @format A data frame with 29 observations on the following 11 variables.
#' \describe{
#' \item{Restaurant}{Names of restaurants}
#' \item{Type}{Type of restaurant, \code{Dine In} \code{Fast Food}}
#' \item{Calories}{Calories per serving}
#' \item{Fat}{Fat per
#' serving (g)}
#' \item{Sodium}{Sodium per serving (mg)}
#' \item{Carbs}{Carbohydrates per serving (g)}
#' \item{SizeOunces}{Size of milkshake (ounces)}
#' \item{CalPerOunce}{Calories per ounce}
#' \item{FatPerOunce}{Fat per ounce}
#' \item{CarbsPerOunce}{Carbohydrates per ounce}
#' }
#' @source Data collected by Carleton students Yoni Blumberg (2013) and Lindsay
#' Guthrie (2013).
#' @keywords datasets
NULL

#' US government data, 2003
#'
#' Census data on the 50 states from 2003.
#'
#' @name states03
#' @docType data
#' @format A data frame with 50 observations on the following 24 variables.
#' \describe{
#' \item{State}{the 50 states}
#' \item{Region}{a
#' factor with levels \code{Midwest}, \code{Northeast}, \code{South},
#' \code{West}}
#' \item{Pop}{Population in 1000}
#' \item{Births}{Number of births}
#' \item{Deaths}{Number of
#' deaths}
#' \item{Pop18}{Percent of population 18 years of age or
#' younger}
#' \item{Pop65}{Percent of population 65 years of age or
#' older}
#' \item{HSGrad}{Percent of population 25 years of age or older
#' with a high school degree}
#' \item{ColGrad}{Percent of population 25
#' years of age or older with a college degree}
#' \item{TeacherPay}{Average teachers salary in dollars}
#' \item{InfMortality}{Infant mortality per 1000 live births}
#' \item{TeenBirths}{Live births per 1000 15-19 year old females}
#' \item{ViolentCrime}{Violent crime per 100000 population}
#' \item{PropertyCrime}{Property crime per 100000 population}
#' \item{DeathPenalty}{State has death penalty?}
#' \item{Executions}{Number of executions 1977-2003}
#' \item{Poverty}{Percent of populaton below the poverty level}
#' \item{Unemp}{Percent unemployed (of population 16 years or older)}
#' \item{Uninsured}{Percent uninsured (3 year aveage)}
#' \item{Income}{Median household income in 1998 dollars}
#' \item{Earnings}{Average hourly earnings of production workers in
#' manufacturing}
#' \item{Heart}{Deaths by heart disease per 100000
#' population}
#' \item{Vehicles}{Deaths by motor vehicle accidents per
#' 100000 population}
#'  \item{Homeowners}{Home ownership rate}
#' }
#' @source United States Census Bureau \url{https://www.census.gov/}
#' @keywords datasets
NULL
