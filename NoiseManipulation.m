Segmentation

[x,t]=audioread('C:\Users\kkt\Documents\MATLAB\20B_044_Ce.wav');
seg1 = x (1:88000);
seg2 = x (88000:320000);
shuffled = [seg2,seg1];
sound (shuffled,t);

Distortion

[x,t]=audioread('C:\Users\kkt\Documents\MATLAB\20B_044_Ce.wav');
sound (x,t);
x2= rand(150000,2)
sound(x2,t);
