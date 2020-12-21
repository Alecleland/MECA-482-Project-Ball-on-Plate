clear all
close all
clc
pause on
sim=remApi('remoteApi'); % using the prototype file (remoteApiProto.m)
sim.simxFinish(-1); % just in case, close all opened connections
    clientID=sim.simxStart('127.0.0.1',19999,true,true,5000,5);
   
     if (clientID>-1)
         disp('Connected to remote API server');
         % handle callouts
         h=[0,0,0,0,];
         [r,h(1)]=sim.simxGetObjectHandle(clientID,'RotateX',sim.simx_opmode_blocking);
         [r,h(2)]=sim.simxGetObjectHandle(clientID,'RotateY0',sim.simx_opmode_blocking);
         [r,h(3)]=sim.simxGetObjectHandle(clientID,'Ball',sim.simx_opmode_blocking);
         [r,h(4)]=sim.simxGetObjectHandle(clientID,'Plate',sim.simx_opmode_blocking);
         %Constants and initial conditions
         L=1;
         r=3*10^-2;
         g=9.8;
         xa=.3;
         ya=.3;
         t=0;
         step=.1;
         C=10*g*r/(7*L)
         [r,position]=sim.simxGetObjectPosition(clientID,h(3),h(4),sim.simx_opmode_blocking)
         xa=position(1)
         ya=position(2)
         %desired location
         xd=0;
         yd=0;
         R=.5*step^2*C;
         %gain coefficents
         kp=3.4476
         kd=2.612
         ki=0
         %inititail error 
         errorx=xd-xa;
         errory=yd-ya;
         perrorx=errorx;
         perrory=errory;
         ferrorx=0
         ferrory=0
         %balance at location loop
         for i=1:10000
             %read position of ball
             [r,position]=sim.simxGetObjectPosition(clientID,h(3),h(4),sim.simx_opmode_blocking)
             xa=position(1)
             ya=position(2)
             %get error
             errorx=xd-xa;
             %PD controller
             thetax=(errorx*kp+(errorx-perrorx)*kd+ferrorx*ki/i);
             %model parameters
             if thetax>1.57
                 thetax=1.57
             end
             if thetax<-1.57
                     thetax=-1.57
             end
               
             errory=yd-ya
             thetay=(errory*kp+(errory-perrory)*kd+ferrory*ki/i)
             
             %attemted pathing loops
          if thetay>1.57
                 thetay=1.57
             end
             if thetay<-1.57
                     thetay=-1.57
             end
              joint_pos1=[thetax,thetay];
              sim.simxSetJointTargetPosition(clientID,h(1),joint_pos1(1),sim.simx_opmode_streaming);
            sim.simxSetJointTargetPosition(clientID,h(2),joint_pos1(2),sim.simx_opmode_streaming);
             pause(step);
             t=t+step;
             ferrorx=errorx+ferrorx
             ferrory=errory+ferrory
             perrorx=errorx;
             perrory=errory;
         end
         while xd*.95>xa | xd*1.05<xa | yd*.95>ya | yd*1.05<ya 
             [r,position]=sim.simxGetObjectPosition(clientID,h(3),h(4),sim.simx_opmode_blocking)
             xa=position(1)
             ya=position(2)
             errorx=xd-xa;
             thetax=(errorx*kp+(errorx-perrorx)*kd+ferrorx*ki/i);
             if thetax>1.57
                 thetax=1.57
             end
             if thetax<-1.57
                     thetax=-1.57
             end
               
             errory=yd-ya
             thetay=(errory*kp+(errory-perrory)*kd+ferrory*ki/i)
          if thetay>1.57
                 thetay=1.57
             end
             if thetay<-1.57
                     thetay=-1.57
             end
              joint_pos1=[thetax,thetay];
              sim.simxSetJointTargetPosition(clientID,h(1),joint_pos1(1),sim.simx_opmode_streaming);
            sim.simxSetJointTargetPosition(clientID,h(2),joint_pos1(2),sim.simx_opmode_streaming);
             pause(step);
             t=t+step;
             ferrorx=errorx+ferrorx
             ferrory=errory+ferrory
             perrorx=errorx;
             perrory=errory;
         end
         xa=-.3;
         ya=.3;
         errorx=xd-xa;
         errory=yd-ya;
         perrorx=errorx;
         perrory=errory;
         while xd*.95>xa | xd*1.05<xa | yd*.95>ya | yd*1.05<ya 
             [r,position]=sim.simxGetObjectPosition(clientID,h(3),h(4),sim.simx_opmode_blocking)
             xa=position(1)
             ya=position(2)
             errorx=xd-xa;
             thetax=(errorx*kp+(errorx-perrorx)*kd+ferrorx*ki/i);
             if thetax>1.57
                 thetax=1.57
             end
             if thetax<-1.57
                     thetax=-1.57
             end
               
             errory=yd-ya
             thetay=(errory*kp+(errory-perrory)*kd+ferrory*ki/i)
          if thetay>1.57
                 thetay=1.57
             end
             if thetay<-1.57
                     thetay=-1.57
             end
              joint_pos1=[thetax,thetay];
              sim.simxSetJointTargetPosition(clientID,h(1),joint_pos1(1),sim.simx_opmode_streaming);
            sim.simxSetJointTargetPosition(clientID,h(2),joint_pos1(2),sim.simx_opmode_streaming);
             pause(step);
             t=t+step;
             ferrorx=errorx+ferrorx
             ferrory=errory+ferrory
             perrorx=errorx;
             perrory=errory;
         end
         xa=-.3;
         ya=-.3;
         errorx=xd-xa;
         errory=yd-ya;
         perrorx=errorx;
         perrory=errory;
         while xd*.95>xa | xd*1.05<xa | yd*.95>ya | yd*1.05<ya 
             [r,position]=sim.simxGetObjectPosition(clientID,h(3),h(4),sim.simx_opmode_blocking)
             xa=position(1)
             ya=position(2)
             errorx=xd-xa;
             thetax=(errorx*kp+(errorx-perrorx)*kd+ferrorx*ki/i);
             if thetax>1.57
                 thetax=1.57
             end
             if thetax<-1.57
                     thetax=-1.57
             end
               
             errory=yd-ya
             thetay=(errory*kp+(errory-perrory)*kd+ferrory*ki/i)
          if thetay>1.57
                 thetay=1.57
             end
             if thetay<-1.57
                     thetay=-1.57
             end
              joint_pos1=[thetax,thetay];
              sim.simxSetJointTargetPosition(clientID,h(1),joint_pos1(1),sim.simx_opmode_streaming);
            sim.simxSetJointTargetPosition(clientID,h(2),joint_pos1(2),sim.simx_opmode_streaming);
             pause(step);
             t=t+step;
             ferrorx=errorx+ferrorx
             ferrory=errory+ferrory
             perrorx=errorx;
             perrory=errory;
         end
         xa=.3;
         ya=-.3;
         errorx=xd-xa;
         errory=yd-ya;
         perrorx=errorx;
         perrory=errory;
         while xd*.95>xa | xd*1.05<xa | yd*.95>ya | yd*1.05<ya 
             [r,position]=sim.simxGetObjectPosition(clientID,h(3),h(4),sim.simx_opmode_blocking)
             xa=position(1)
             ya=position(2)
             errorx=xd-xa;
             thetax=(errorx*kp+(errorx-perrorx)*kd+ferrorx*ki/i);
             if thetax>1.57
                 thetax=1.57
             end
             if thetax<-1.57
                     thetax=-1.57
             end
               
             errory=yd-ya
             thetay=(errory*kp+(errory-perrory)*kd+ferrory*ki/i)
          if thetay>1.57
                 thetay=1.57
             end
             if thetay<-1.57
                     thetay=-1.57
             end
              joint_pos1=[thetax,thetay];
              sim.simxSetJointTargetPosition(clientID,h(1),joint_pos1(1),sim.simx_opmode_streaming);
            sim.simxSetJointTargetPosition(clientID,h(2),joint_pos1(2),sim.simx_opmode_streaming);
             pause(step);
             t=t+step;
             ferrorx=errorx+ferrorx
             ferrory=errory+ferrory
             perrorx=errorx;
             perrory=errory;
         end
         
             sim.simxGetObjectPosition(clientID,h(3),h(4),sim.simx_opmode_blocking)
   [r,position]=sim.simxGetObjectPosition(clientID,h(3),h(4),sim.simx_opmode_blocking)
    else 
         disp('Failed connecting to remote API server');
    end
    sim.delete(); % call the destructor!
    
    disp('Program ended');