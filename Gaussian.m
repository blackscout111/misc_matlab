%% Calculates Values For A Normal Distribution
% Created by Bryan A. Clifford
% Last modified: 03/23/2010


%% Clears Memory & Consol Screen
clear
clc

%% Variables
xMin = -5;             %minimum x value
xMax = 5;              %maximum x value
xChg = 1e-5;           %difference between x values
yMin = -1;             %minimum y value
yMax = 1;              %maximum y value
a = 0;                 %x value at maximum
stdev = 1;             %standard deviation

%% The Normal Distribution
%Calculates the value of e
e = exp(1);

%Generates the x values
x = xMin:xChg:xMax;

%Stores the size of X
sizeX = size(x);

%Generates the y values
y = zeros(sizeX);
for i = 1:(sizeX(1,2))
    y(1,i) = 1/(stdev*sqrt(2*pi)) * e^(-(x(1,i) - a)^2/(2*stdev^2));
end

%Generates Figure #1: A plot of the Guassian.
f1 = figure(1);
set(f1,'Units','inches','Position',[1,1,9,6])
axes('FontSize',14,'XTick',xMin:xMax,'YTick',yMin:.2:yMax)
box on
hold all

%Generates the plot in Figure #1
plot(x,y,'Color',[0 0 1],'LineWidth',2)
xlim([xMin,xMax])
ylim([yMin,yMax])
grid on
title({'Probability Distribution',cat(2,'standard deviation = ',int2str(stdev))},'FontSize',32,...
    'FontName','Times New Roman')
xlabel('X Axis','FontSize',22,'FontName','Times New Roman',...
        'FontAngle','Italic')
ylabel('Y Axis','FontSize',22,'FontName','Times New Roman',...
        'FontAngle','Italic')



%% The Probability Function
%Integrates using the midpoint method
Y= zeros(sizeX );
[r,c] = find(x == a);                       %finds the index of the value 'a' in 'x'
Y(1,c) = 0;
for i = (c + 1):1:(sizeX(1,2))
    Y(1,i) = Y(1,(i - 1)) + ...
        (1/(stdev*sqrt(2*pi)) * e^(-(x(1,i) - a)^2/(2*stdev^2))) * xChg;
end
for i = (c - 1):-1:1
    Y(1,i) = Y(1,(i + 1)) - ...
        (1/(stdev*sqrt(2*pi)) * e^(-(x(1,i) - a)^2/(2*stdev^2))) * xChg;
end

%Generates Figure #2: A plot of the Error Function
f2 = figure(2);
set(f2,'Units','inches','Position',[1.25,1,9,6])
axes('FontSize',14,'XTick',xMin:xMax,'YTick',yMin:.2:yMax)
box on
hold all

%Plots the Error Function
plot(x,Y,'Color',[1 0 0],'LineWidth',2)
xlim([xMin,xMax])
ylim([yMin,yMax])
grid on
title('Error Function','FontSize',32,'FontName','Times New Roman')
xlabel('X Axis','FontSize',22,'FontName','Times New Roman',...
        'FontAngle','Italic')
ylabel('Y Axis','FontSize',22,'FontName','Times New Roman',...
        'FontAngle','Italic')


%% Prompts User for input until 'calc' == n
% Prompts user for the value of calc and sets calc equal to the char
% array created by the text value the user entered
calc = input('Calculate probabilities? (y/n):  ','s');

% Gets the number of rows (n) and the number of columns (m) in 'calc'
[n,m] = size(calc);


% Checks to make sure the value entered by the user is valid.  If not
% re-prompt the user
% (Checks size of calc)
while (n ~= 1) || (m ~= 1)
    calc = input('Calculate probabilities? (y/n):  ','s');
    [n,m] = size(calc);
end
% (Checks dimensions of calc
while ((calc ~= 'n') && (calc ~= 'y'))
    calc = input('Calculate probabilities? (y/n):  ','s');
end
while calc == 'y'
    % Prompts the user for lower bound
    lb = input('Enter the lower bound value:  ');
    
    % Prompts the user for higher bound
    hb = input('Enter the higher bound value:  ');
    
    % Finds the indicies (r,c) of the bounds in 'x'
    [rl,cl] = find(x >= lb,1,'first');
    [rh,ch] = find(x <= hb,1,'last');
    
    % Calculates probability that value is between the lower and higher
    % bounds
    P = 100*(Y(1,ch) - Y(1,cl));
    fprintf('Probability = %g%% \n\n',P)
    
    % Prompts user for the value of calc and sets calc equal to the char
    % array created by the text value the user entered
    calc = input('Calculate probabilities? (y/n):  ','s');
    
    % Gets the number of rows (n) and the number of columns (m) in 'calc'
    [n,m] = size(calc);
    
    % Checks to make sure the value entered by the user is valid.  If not
    % re-prompt the user
    % (Checks size of calc)
    while (n ~= 1) || (m ~= 1)
        calc = input('Calculate probabilities? (y/n):  ','s');
        [n,m] = size(calc);
    end
    
    % (Checks dimensions of calc
    while ((calc ~= 'n') && (calc ~= 'y'))
        calc = input('Calculate probabilities? (y/n):  ','s');
    end
end



