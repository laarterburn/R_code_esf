
#superlative         
superlative<-c("best", "worst", "mediocre", "annoying")
superlativeoptions<-readline("best, worst, mediocre, annoying")


#plural noun 1
pluralnoun1<-c('students', 'professors', 'food', 'research')
pluralnoun1options<-readline(prompt='students, professors, food, research')

#adjective 1
adjective1<-c('amazing', 'boring','annoying', 'magnificent')
adjective1options<-readline('amazing, boring, annoying, magnificent')

#noun 2
noun2<-c('work', 'trees', 'research', 'syrup')
noun2options<-readline('work, trees, research, syrup')

#unit of time
unitoftime<-c('seconds', 'minutes', 'hours', 'years')
unitoftimeoptions<-readline('seconds, minutes, hours, years')

#ing verb
ingverb<-c('dancing', 'working', 'crying', 'fighting')
ingverboptions<-readline('dancing, working, crying, fighting')

#noun 4
noun4<-c('syrup', 'sports', 'food', 'social lives')
noun4options<-readline('syrup, sports, food, social lives')

#Base Text
Text1<-paste("SUNY ESF has some of the", paste(superlative[2]), paste(pluralnoun1[3]),"in the country.")
Text2<-paste("The people are known for their", paste(adjective1[1]), paste(noun2[3]),".")
Text3<-paste("The", paste(adjective1[1]), paste(noun2[3]), "was refined by thousands of", paste(unitoftime[2]), "of tireless", paste(unitoftime[4]),".")
Text4<-paste('However, if the', paste(pluralnoun1[1]), "had done less", paste(ingverb[2]), "then SUNY ESF may have a better", paste(noun4[2]), "club.")

#printing text
Totaltext<-paste(Text1, Text2, Text3, Text4)
print(Totaltext)
