The problem
We want to build a utility to design ASCII trains of a given configuration.

Building a train
Types of cars
The locomotive
The almighty locomotive will always be at the head of the train. It’s tried, tested and for your convenience, static.

     o o
   o  ___ 
 _][__|o| 
(_______|-1
/O-O-O-O  
The passenger car
We should be able to specify the number of windows on the car. It is important that windows have a single space between them. We will specify a passenger car with the keywords p# where # is the number of windows on the car. Some examples of passenger cars are provided below.

---

|O O O O|
|_______|-1       // p4
 oo   oo  

---

|O O O O O O|
|___________|-1   // p6
 oo       oo  
The hopper car
We should be able to specify the length of the car and type of mineral. We will specify a hopper car with the keywords h#% where # is the length of the car and % is any single character. Some examples of hopper cars are provided below.

|++++++++++|
|__________|-1   // h10+
 oo      oo  

|@@@@@|
|_____|-1        // h5@
 oo oo  
Wheels
A car will have wheels (oo) at the front and back. Wheels must have at least one space in between the front and back set and be offset by 1 space from the ends of the car. Below are some samples of invalid wheel configurations on a car.

|++++|
|____|-1   // no space
 oooo  

|++++|
|____|-1   // front wheels overflow
oo oo  
Joining cars together
Cars are joint together by their trailing -. We drop the 1 and attach the next car. Make sure we leave the full trailing connector at the end of the train. It is possible for a locomotive to stand by itself without any cars. Below is an example of a complete train with configuration p4 p6 h10O.

     o o    
   o  ___ _________ _____________                
 _][__|o| |O O O O| |O O O O O O| |OOOOOOOOOO|   
(_______|-|_______|-|___________|-|__________|-1
/O-O-O-O   oo   oo   oo       oo   oo      oo    

What you need to do
Write a function in a language of your choosing that will print out ASCII trains based on the above configuration. The function should take a single string argument specifying the configuration (eg. "p5 h5# p2") and either print the ASCII train to console or an error detailing why the given configuration is invalid.
