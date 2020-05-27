rm(list=ls())

# Example 1:
ttype <- c(60,67,42,67,56,62,64,59,72,71,
        50,52,43,67,67,59,67,64,63,65,
        48,49,50,55,56,61,61,60,59,64,
        47,67,54,67,68,65,65,56,60,65)

treatment = c(rep("t1",10), 
              rep("t2",10), 
              rep("t3",10),
              rep("t4",10))

data.treat = data.frame(ttype,treatment)

View(data.treat)

plot(ttype ~ treatment, data=data.treat)

# the R function aov() can be used 
# for fitting ANOVA models. 

#Syntax
#aov(response ~ factor, data=data_name)



results = aov(ttype ~ treatment, 
              data=data.treat)
results
summary(results)

TukeyHSD(results,conf.level = .90)

plot(TukeyHSD(results))



# Example 2:
#A drug company tested three formulations 
# of a pain relief medicine for
# migraine headache sufferers. 
# For the experiment 27 volunteers were 
# selected and 9 were randomly assigned 
# to one of three drug formulations. 
# The subjects were instructed to take 
# the drug during their next migraine 
# headache episode and to report their 
# pain on a scale of 1 to 10 
# (10 being most pain)

#Drug A 4 5 4 3 2 4 3 4 4
#Drug B 6 8 4 5 4 6 5 8 6
#Drug C 6 7 6 6 7 5 6 5 5

pain = c(4, 5, 4, 3, 2, 4, 3, 
         4, 4, 6, 8, 4, 5, 4, 
         6, 5, 8, 6, 6, 7, 6, 
         6, 7, 5, 6, 5, 5)
drug = c(rep("A",9), rep("B",9), rep("C",9))
migraine = data.frame(pain,drug)
#we print the data frame migraine we can see the format the data should be on
#in order to make side-by-side boxplots and perform ANOVA

View(migraine)

# now make the boxplots by typing:

plot(pain ~ drug, data=migraine)

# the R function aov() can be used 
# for fitting ANOVA models. 

#Syntax
#aov(response ~ factor, data=data_name)



results = aov(pain ~ drug, data=migraine)
results
summary(results)

TukeyHSD(results)

plot(TukeyHSD(results))
