close all
hh=figure;
set(hh,'PaperType','a4','PaperPositionMode','manual','PaperUnits','centimeters','PaperPosition',[1,1,28,19],'renderer', 'painters');
x=-0.9999:0.0001:0.9999;
y=x;
subplot(1,2,1)
plot(x,y,'b-','LineWidth',1.5)
hold on
plot([0 0],[0 y(x==0)],'r--')
xlabel('$x$','Interpreter','LaTeX','FontSize',19)
h=title('Bounded support $x\in [-0.9999,0.9999]$','Interpreter','LaTeX','FontSize',19)
set(gca,'FontSize',12)
pos=get(h,'Position');
set(h,'Position',pos+[0,.01,0])

subplot(1,2,2)
x=-0.9999:0.0001:0.9999;
y=log((0.9999-x)./(x-(-0.9999)));
plot(x,y,'b-','LineWidth',1.5)
hold on
set(gca,'FontSize',12)
xlabel('$\tilde x=\log\left(\frac{0.9999-x}{x-(-0.9999)}\right)$','Interpreter','LaTeX','FontSize',19)
h=title('Transformation to unbounded support','Interpreter','LaTeX','FontSize',19);
pos=get(h,'Position');
set(h,'Position',pos+[0,.01,0])

print -depsc transformed_support