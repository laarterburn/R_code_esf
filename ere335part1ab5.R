#Part 1B. A microbial colony increases in mass 50% each hour plus a fixed addition of 0.01 kg of microbes are added each hour. The colony starts off with a mass of 0.01 kg. Write a script that determines how many hours it will take the colony to reach a mass of 1 kg. Include a print statement that indicates the number of hours. Also, print the mass to the output window after each time step.

mass=0.01
hour=1

while(mass < 1.0){
  
  mass<-(mass*1.5+0.01)
  hour=hour+1
  
}

print(hour-1)