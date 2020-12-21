# MECA-482-Project-Ball-on-Plate
Ball on Plate

README.md


**Team #5**
MWF 12:00-12:50 p.m. 

**Members:**

AbdulAziz Alqatami

Steven Augusto

Jose Luis Leon

Jarod Mica

Alec Mitchell

**1. Introduction**

This project will track the balls motion on a plate and adjust its orientation accordingly so that the ball does not fall of the plate. Matlab and Simulink will used in this project and a PD based controller will be implemented to control the system. This system will be tested in CoppeliaSim. This system is a control-based experiment that will use two servo motors that control the X/Y axis of the plate to ensure that the ball does not fall off the plate.

   **1.a Equipment List**

* Matlab

* CoppeliaSim

* Simulink

* 2 DoF Ball Balancer

**2. Modeling**

![image](https://user-images.githubusercontent.com/70996514/102726982-a5ae5680-42d7-11eb-9732-664795f70454.png)

This figure shows the free body diagram of the ball on plate. This figure includes a rotary servo motor that adjusts the plate to keep the ball on top of it. 

**3. Position Sensor**

We were unable to use the camera sensor for the positioning of the balls so instead we used a built in function from CoppeliaSim in our matlab code that reads positions of objects in reference to another objects reference frame. By doing this we were able to get the ball’s position relative to the plate’s x and y coordinates.

**4. Controller Design**

The controller we decided to go with was a PD controller in order to minimize settling time. An integral portion was not added since this system has negligible steady state error and this would overcomplicate the system.

**5. Simulation**

With the simulations we were able to balance the ball on a set location on the plate indefinitely, however it was more complicated to make code that would allow the ball to follow a set path. In the Simulation folder there is a video of the ball balancing on the center of the plate.
