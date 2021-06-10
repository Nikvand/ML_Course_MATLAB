%KNN
clear 
close all
clc
num=200;
tic;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%DATA GENERATION %%%%%%%%SKIP if repeating
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%trial
% x1=2*randn(1,num)+0.5;
% x2=1+1.5*x1+3*randn(1,num);
% z1 = 2*randn(1,1)+0.5;
% z2 = 2*randn(1,1)+1;
% label = zeros(1,num);
% label((x1>1) & (x2>3))=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('KNN.mat');
pitch=0.1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%DATA PLOTTING
figure(1)
plot(x1(label==1),x2(label==1),'r*');
hold on;
h=plot(x1(label==0),x2(label==0),'bd','Markersize',5,'Markerfacecolor','blue');
hold on;
plot(z1,z2,'pk','MarkerSize',20,'Markerfacecolor','black');
grid on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%Training
p=[z1,z2];
class = cell(1,numel(x1));
for i=1:numel(x1)
    class{i} = [x1(i);x2(i);label(i)];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%TESTING
k=4;
[typex,d] = knn_classfier(p,class,k);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Visualization for k=4;
visualize(h,class,k,x1,x2,pitch);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Visualization for k=8
figure(2)
plot(x1(label==1),x2(label==1),'r*');
hold on;
h=plot(x1(label==0),x2(label==0),'bd','Markersize',5,'Markerfacecolor','blue');
hold on;
plot(z1,z2,'pk','MarkerSize',20,'Markerfacecolor','black');
grid on;
k=8;
visualize(h,class,k,x1,x2,pitch);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Visualization for k=20
figure(3)
plot(x1(label==1),x2(label==1),'r*');
hold on;
h=plot(x1(label==0),x2(label==0),'bd','Markersize',5,'Markerfacecolor','blue');
hold on;
plot(z1,z2,'pk','MarkerSize',20,'Markerfacecolor','black');
grid on;
k=20;
visualize(h,class,k,x1,x2,pitch);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Visualization for k=1
figure(4)
plot(x1(label==1),x2(label==1),'r*');
hold on;
h=plot(x1(label==0),x2(label==0),'bd','Markersize',5,'Markerfacecolor','blue');
hold on;
plot(z1,z2,'pk','MarkerSize',20,'Markerfacecolor','black');
grid on;
k=1;
visualize(h,class,k,x1,x2,pitch);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
time=toc;
display(['Processing time is ',num2str(time),' seconds'])
save('KNN.mat');
