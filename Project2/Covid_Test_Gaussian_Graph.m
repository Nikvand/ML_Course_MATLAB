clear
close all;
clc;

x=-20:0.01:20;
sigma_pos = 5;
%sigma_pos = 2;
sigma_neg = 2;
mu_pos = 10;
mu_neg = 1;
syms y;
fpos = (1/(sqrt(2*pi)*sigma_pos))*exp(-1/2*((x-mu_pos)/sigma_pos).^2);
fposy = (1/(sqrt(2*pi)*sigma_pos))*exp(-1/2*((y-mu_pos)/sigma_pos)^2);

plot(x,fpos,'linewidth',2);

fneg = (1/(sqrt(2*pi)*sigma_neg))*exp(-1/2*((x-mu_neg)/sigma_neg).^2);
fnegy = (1/(sqrt(2*pi)*sigma_neg))*exp(-1/2*((y-mu_neg)/sigma_neg)^2);

hold on;
plot(x,fneg,'r','linewidth',2);
grid on;
x0 = vpasolve(fposy-fnegy == 0, y,3);
y = x0;
yy=subs(fposy);
plot(y,yy,'g.','Markersize',16);
zz = 0:0.001:yy;
title('COVID-19 Test');
xlabel('COVID Test Level');
ylabel('Probability Density');

hx = -20:0.01:y;
fposhx  = (1/(sqrt(2*pi)*sigma_pos))*exp(-1/2*((hx-mu_pos)/sigma_pos).^2);
hx2 = [hx, fliplr(hx)];
z=zeros(size(hx));
inBetween = [fposhx, fliplr(z)];
h=fill(hx2, inBetween, 'g');
alpha(h,0.2)


hz = y:0.01:20;
fnegz=(1/(sqrt(2*pi)*sigma_neg))*exp(-1/2*((hz-mu_neg)/sigma_neg).^2);
hz2 = [hz, fliplr(hz)];
zh = zeros(size(hz));
inBetweenl = [fnegz, fliplr(zh)];
hl=fill(hz2, inBetweenl, 'm');
alpha(hl,0.2);

plot(x0*ones(size(zz)),zz,'-k' , 'linewidth', 3)

legend('Positive','Negative','Intersection Point','False Negative Rate','False Positive Rate','Decision Boundary');

FNR = eval(int(fposy,-100,x0));
FPR = eval(int(fnegy,x0,100));
alpha = linspace(-20,20,100);
sensitivity = zeros(size(alpha));
FPRs = zeros(size(alpha));
for i=1:length(alpha)
    sensitivity(i) = eval(1-int(fposy,-100,alpha(i)));
    FPRs(i) = eval(int(fnegy,alpha(i),100));
end
figure;
plot(FPRs,sensitivity,'linewidth',2);
hold on;
RandomA = 0:0.1:1;
RandomB = 0:0.1:1;
plot(RandomA,RandomB,'-.r','linewidth',2);
xlabel('1-Specificity');
ylabel('Sensitivity');
title('ROC Curve');
grid on;
legend('Proposed COVID-19 Classifier','Random Classifier');
AUC = trapz(FPRs,sensitivity);
AUC_Random = trapz(RandomA,RandomB);
    
    
    

