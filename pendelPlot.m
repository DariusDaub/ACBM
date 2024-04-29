function pendelPlot(theta1, theta2, state)


persistent f x1 x2 y1 y2;   

if(state==0)
    clear f x1 x2 y1 y2
else
    clc; 

    if isempty(f) 
        f = figure( 'Units','pixel','Position', [10 10 800 800]);
    end

    l1=2;
    l2=4;
    x_limit = 8;
    y_limit = 8;

    hold off; 
    %Spuren
    x1=[x1,l1*sin(theta1)];
    y1=[y1,-l1*cos(theta1)];
    x2=[x2,l1*sin(theta1)+l2*sin(theta2)];
    y2=[y2,-l1*cos(theta1)-l2*cos(theta2)];
    if length(x1)>20000
        x1(1)=[];
        y1(1)=[];
        x2(1)=[];
        y2(1)=[];
    end

    plot(x1,y1, 'm','linewidth',1);
    hold on;
    plot(x2,y2, 'g','linewidth',1);


    plot([-x_limit x_limit],[0 0],'k','linewidth',2);


    %Erstes Pendel
    plot([0 0+l1*sin(theta1)],[0 0-l1*cos(theta1)],'b','linewidth',3);

    %Zweites Pendel
    plot([l1*sin(theta1) l1*sin(theta1)+l2*sin(theta2)],[-l1*cos(theta1) -l1*cos(theta1)-l2*cos(theta2)],'b','linewidth',3);

    %Massen
    plot(l1*sin(theta1), -l1*cos(theta1), '.r', 'MarkerSize',69);
    plot(l1*sin(theta1)+l2*sin(theta2), -l1*cos(theta1)-l2*cos(theta2), '.r', 'MarkerSize',69);


    %Beschriftung
    xlabel('x [m]');
    ylabel('y [m]');

    %Grenzen der Achsen
    axis([-x_limit x_limit -y_limit y_limit])
    end


end