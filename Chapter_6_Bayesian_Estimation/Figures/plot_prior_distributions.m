addpath('../../Common Matlab-Files')
%% beta
abscissa = linspace(0,1,500);
betamean=0.7;
betavariance=0.1^2;
[a,b]=betaparametertransform(betamean,betavariance);
y1=betapdf(abscissa , a, b);
betamean=0.7;
betavariance=0.4^2;
[a,b]=betaparametertransform(betamean,betavariance);
y2=betapdf(abscissa , a, b);
figure
plot(abscissa,y1,'k-',abscissa,y2,'r--','LineWidth',1.5)
legend_handle=legend(['Beta, \mu=0.7, \sigma=0.1'],['Beta, \mu=0.7, \sigma=0.4']);
set(legend_handle,'FontSize',14)
title('Beta Prior','Fontsize',14)
print -depsc2 beta_prior
%% normal
abscissa = linspace(-2,2,500);
y1= normpdf(abscissa,0,1);  
y2= normpdf(abscissa,0,0.5);  
figure
plot(abscissa,y1,'k-',abscissa,y2,'r--','LineWidth',1.5)
legend_handle=legend('Normal, \sigma=1','Normal, \sigma=0.5');
set(legend_handle,'FontSize',14)
title('Normal Prior','Fontsize',14)
print -depsc2 normal_prior
%% uniform
supbound=1;
infbound=0;
steps=500;
absciss_1=linspace(infbound,supbound,steps);
y1 = ones(1, steps) / (supbound-infbound);
supbound=1;
infbound=-1;
absciss_2=linspace(infbound,supbound,steps);
y2 = ones(1, steps) / (supbound-infbound);
figure
plot(absciss_1,y1,'k-',absciss_2,y2,'r-','LineWidth',1.5)
legend_handle=legend('Unform [0,1]','Uniform [-1,1]','Location','NorthWest');
set(legend_handle,'FontSize',14)
title('Uniform Prior','Fontsize',14)
ylim([0,1.1*max([y1 y2])])
xlim([-1.1 1.1])
hold 
plot([0 0],[0 max(y1)],'k-.')
plot([1 1],[0 max(y1)],'k-.')
plot([-1 -1],[0 max(y2)],'r-.')
plot([1 1],[0 max(y2)],'r-.')
print -depsc2 uniform_prior
%% gamma   
abscissa = linspace(0,1,500);
gammamean=0.01;
gammavariance=0.05^2;
[a,b]=gammaparametertransform(gammamean,gammavariance);
y1=gampdf(abscissa,a,b);
gammamean=.5;
gammavariance=0.2^2;
[a,b]=gammaparametertransform(gammamean,gammavariance);
y2=gampdf(abscissa,a,b);
figure
plot(abscissa,y1,'k-',abscissa,y2,'r--','LineWidth',1.5)
legend_handle=legend('Gamma, \mu=0.01, \sigma=0.05','Gamma, \mu=0.5, \sigma=0.2');
set(legend_handle,'FontSize',14)
title('Gamma Prior','Fontsize',14)
print -depsc2 gamma_prior

%% inverse gamma
abscissa = linspace(0,0.2,500);
mu=0.01;
sigma=0.1;
[s,nu] = inverse_gamma_specification(mu,sigma,1,0);
y1 = exp(lpdfig1(abscissa,s,nu));  
mu=0.1;
sigma=0.1^2;
[s,nu] = inverse_gamma_specification(mu,sigma,1,0);
y2 = exp(lpdfig1(abscissa,s,nu));  

figure
plot(abscissa,y1,'k-',abscissa,y2,'r--','LineWidth',1.5)
legend_handle=legend('Inverse Gamma, \mu=0.01, \sigma=0.1','Inverse Gamma, \mu=0.1, \sigma=0.1');
set(legend_handle,'FontSize',14)
title('Inverse Gamma Prior','Fontsize',14)
print -depsc2 inverse_gamma_prior
