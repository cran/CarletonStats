# boot() print output is stable

    Code
      print(result)
    Output
      
      	** Bootstrap interval for mean 
      
       Observed  ToothGrowth$len : 18.81333 
       Mean of bootstrap distribution: 18.83433 
       Standard error of bootstrap distribution: 0.9604 
      
       Bootstrap percentile interval
          2.5%    97.5% 
      16.87433 20.63175 
      
      		*--------------*

# boot() two-group print output is stable

    Code
      print(result)
    Output
      
      	** Bootstrap interval for difference of mean 
      
       Observed difference of mean : OJ - VC = 3.7 
       Mean of bootstrap distribution: 3.65638 
       Standard error of bootstrap distribution: 1.84858 
      
       Bootstrap percentile interval
           2.5%     97.5% 
      -0.113500  7.187833 
      
      		*--------------*

# bootPaired() print output is stable

    Code
      print(result)
    Output
      
      	**Bootstrap interval for mean of paired difference 
      
       Observed mean of  Icecream$ChocCalories - Icecream$VanillaCalories : 7.33333 
       Mean of bootstrap distribution: 7.44503 
       Standard error of bootstrap distribution: 2.01653 
      
       Bootstrap percentile interval
           2.5%     97.5% 
       3.947436 11.605769 
      
      		*--------------*

# bootCor() print output is stable

    Code
      print(result)
    Output
      
      	** Bootstrap interval of correlation 
      
       Observed correlation between Icecream$VanillaCalories and Icecream$ChocCalories : 0.98003 
       Mean of bootstrap distribution: 0.97991 
       Standard error of bootstrap distribution: 0.00623 
      
       Bootstrap percentile interval
           2.5%     97.5% 
      0.9661542 0.9902951 
      
      		*--------------*

# bootSlope() print output is stable

    Code
      print(result)
    Output
      
      	** Bootstrap interval of slope 
      
       Observed slope between Icecream$VanillaCalories and Icecream$ChocCalories : 1.0539 
       Mean of bootstrap distribution: 1.05576 
       Standard error of bootstrap distribution: 0.03129 
      
       Bootstrap percentile interval
           2.5%     97.5% 
      0.9959494 1.1166018 
      
      		*--------------*

# permTest() print output is stable

    Code
      print(result)
    Output
      
      	** Permutation test **
      
       Permutation test with alternative: two.sided 
       Observed mean 
        No :  286.6917 	 Yes :  453.7974 
       Observed difference: -167.1057 
      
       Mean of permutation distribution: -1.02484 
       Standard error of permutation distribution: 62.39977 
       P-value:   0.004 
      
      	*-------------*
      

# boot() categorical print output is stable

    Code
      print(result)
    Output
      
      	** Bootstrap interval for difference of proportion 
      
       Observed difference of proportion : A - B = 0.25 
       Mean of bootstrap distribution: 0.2325 
       Standard error of bootstrap distribution: 0.33435 
      
       Bootstrap percentile interval
       2.5% 97.5% 
      -0.50  0.75 
      
      		*--------------*

# permTest() categorical print output is stable

    Code
      print(result)
    Output
      
      	** Permutation test **
      
       Permutation test with alternative: two.sided 
       Observed proportion 
        A :  0.5 	 B :  0.5 
       Observed difference: 0 
      
       Mean of permutation distribution: -0.02705 
       Standard error of permutation distribution: 0.36785 
       P-value:       1 
      
      	*-------------*
      

# boot() penguin proportion print output is stable

    Code
      print(result)
    Output
      
      	** Bootstrap interval for difference of proportion 
      
       Observed difference of proportion : Electronic - Metal = 0.16218 
       Mean of bootstrap distribution: 0.16402 
       Standard error of bootstrap distribution: 0.04676 
      
       Bootstrap percentile interval
            2.5%      97.5% 
      0.08162009 0.25347876 
      
      		*--------------*

# permTest() penguin proportion print output is stable

    Code
      print(result)
    Output
      
      	** Permutation test **
      
       Permutation test with alternative: two.sided 
       Observed proportion 
        Electronic :  0.3597884 	 Metal :  0.1976048 
       Observed difference: 0.16218 
      
       Mean of permutation distribution: -0.00234 
       Standard error of permutation distribution: 0.04836 
       P-value:   0.002 
      
      	*-------------*
      

# permTestPaired() print output is stable

    Code
      print(result)
    Output
      
      	** Permutation test **
      
       Permutation test with alternative: two.sided 
       Observed mean
        Icecream$VanillaCalories :  191.4103 	 Icecream$ChocCalories :  198.7436 
       Observed difference: 7.33333 
      
       Mean of permutation distribution: 0.05513 
       Standard error of permutation distribution: 2.38151 
       P-value:   0.002 
      
      	*-------------*
      

# permTestAnova() print output is stable

    Code
      print(result)
    Output
      
      	** Permutation test **
      
       Permutation test with alternative: greater 
       Observed F statistic: 15.3648 
       Mean of permutation distribution: 1.05676 
       Standard error of permutation distribution: 0.70723 
       P-value:   0.001 
      
      	*-------------*
      

# permTestCor() print output is stable

    Code
      print(result)
    Output
      
      	** Permutation test **
      
       Permutation test with alternative: two.sided 
       Observed correlation between Icecream$VanillaCalories ,  Icecream$ChocCalories : 0.98 
       Mean of permutation distribution: 0.00089 
       Standard error of permutation distribution: 0.16395 
       P-value:   0.001 
      
      	*-------------*
      

# permTestSlope() print output is stable

    Code
      print(result)
    Output
      
      	** Permutation test **
      
       Permutation test with alternative: two.sided 
       Observed slope between Icecream$VanillaCalories ,  Icecream$ChocCalories :  1.0539 
       Mean of permutation distribution: 0.00096 
       Standard error of permutation distribution: 0.17631 
       P-value:   0.001 
      
      	*-------------*
      

# anovaSummarized() output is stable

    Code
      anovaSummarized(N, mn, stdev)
    Output
                                          
      Treatment SS            231129.16210
      Residual SS             195556.02100
      numerator DF                 5.00000
      denominator DF              65.00000
      Residual standard error     54.85029
      
           F-stat     P-value 
      1.53648e+01 5.93642e-10 

# summary.carlboot() output is stable

    Code
      summary(result)
    Output
      Replications: 500 
      
      Summary Statistics of Bootstrap Distribution: 
        Observed     Mean        SE
      1 18.81333 18.83433 0.9604015

# summary.carlperm() output is stable

    Code
      summary(result)
    Output
      Replications: 999 
      
      Summary Statistics of Permutation Distribution: 
      
         Observed     Mean Alternative P.value
      1 -167.1057 -1.02484   two.sided   0.004

# summary.carlperm() includes df columns for ANOVA results

    Code
      summary(result)
    Output
      Replications: 999 
      
      Summary Statistics of Permutation Distribution: 
      
        Observed     Mean df1 df2 P.value
      1  15.3648 1.056757   5  65   0.001

