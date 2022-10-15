# FIFA Player Ratings: An ANOVA Analysis of Wage, Age, and Foot Preference
Academic Project using SAS programing

## Introduction

FIFA 19 is a football simulation video game, developed by EA Vancouver with several versions as an electric game series. The dataset, obtained from Kaggle.com, contains information of FIFA 19 players. The data was scraped from a website containing statistical information of all players in FIFA 19. Having information like Nationality, Potential, Club, Value, Wage, Preferred Foot, International Reputation, this dataset covers describes about 19000 players using 90 detailed attributes that allow us to perform analysis on the general performance of the players. 

We intend to look at this data and analyze what attributes make or break a soccer player in terms of rating score. From analyzing past data on soccer players, we will be able to predict if a player’s rating will be higher or not on a scale from 1-100. This study can impact people’s everyday decisions and lifestyles whether its what team to root for in a soccer match or what player to choose for your fantasy league. 

Though this study can be used for recreational purposes, it can also serve a very realistic purpose for coaches and recruiters for soccer. This was sample only consists of FIFA players, but we can apply it for high school players looking to move towards college soccer and college soccer players looking to move forward and play professionally in the FIFA league. Approximately, only 5.5% of high school soccer players move on to play NCAA’s men’s soccer.5 NCAA is the National Collegiate Athletic Association that centralizes and regulates college sports. After analyzing this data we can look at soccer players’ attributes from an early stage and see which players have the characteristics to have a high rating in FIFA and be successful. 

We chose to analyze this data using Three-Factor ANOVA with our factors being wage group, age group, and preferred foot. Since our analysis method requires qualitative independent variables we separated the wage group into low, medium, and high earnings and the age group into young and old. Preferred foot corresponds with left and right foot. We began our analysis by looking at each of the twelve possible three-way interactions between the groups and then looked at the two-way interactions. At each analysis step, we test the hypothesis that all of the treatment groups have equal means of overall rating score. Through our analysis, we found none of the three way interactions to be significant. We found our two way interactions between age group and wage group to be significant and by analyzing the two way interactions through extensive post-hoc testing we found five significantly different treatment groups: Young/Low Wage, Young/High Wage, Old/Low Wage, Old/High Wage, Young/Medium Wage and Old/High Wage. Each of three post-hoc tests (with Bonferroni’s test being the preferred post-hoc test) reach the same conclusion regarding the significantly different groups causing us to be confident in our results.

## Contents

### To read the full report, check document: "Project Final Report FIFA.pdf"

### To check the codes for project, check document: "Final Project.sas"
