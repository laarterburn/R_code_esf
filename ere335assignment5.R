#Part 1A. A microbial colony increases in mass 50% each hour plus a fixed addition of 0.01 kg of microbes are added each hour. The colony starts off with a mass of 0.01 kg. Write a script that calculates the colony's mass after 20 hours. Print the mass to the output window after each time step.

mass=0.01

for(i in 1:20){
  
  mass<-(mass*1.5+0.01)
  
  print(mass)
}