#Answers
Vegetarian<-'Yes'
Spicy<-'Yes'
Budget<-'Yes'

#Choices
if(Spicy=='Yes'){
  if(Vegetarian=='Yes'){
    Choice<-c('spicy tofu', 'garlic green beans', 'mango sticky rice')
  } else if(Vegetarian=='No'){
    Choice<-c('spicy beef', 'garlic green beans', 'mango sticky rice')
  }
  }else{
    if (Vegetarian=="Yes" & Budget=="Yes"){
      Choice<-c('impossible burger', 'sauteed mushrooms', 'carrot cake')
    }else if (Vegetarian=="Yes" & Budget=="No"){
      Choice<-c('bean burger', 'slaw', 'carrot cake')
    }else{
      Choice<-c('beef burger', 'deep fried pickles', 'cheese cake')
    }
  }

#Print Statement
print(paste("As a main course, you might enjoy", Choice[1],". For a side vegetable, there are generous servings of", Choice[2], ". For dessert, there is delicious", Choice[3],"."))
      