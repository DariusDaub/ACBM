function quader(E,nb)
%######################################
%3D Plot für einen Einheitswürfel
%E: Matrix mit allen Eckpunkten des Würfels
%nb {0,1}: Gibt an, ob der Würfel in ein neues Bild {nb==1} gezeichnet werden
%soll oder nicht {nb==0}.

if nb==1
    figure;
end

%Definition der Seitenflächen
faces = [1 2 3 4;
    4 3 5 6;
    6 7 8 5;
    1 2 8 7;
    6 7 1 4;
    2 3 5 8];
              
kantenlaenge = 1;
hold on
patch('Faces',faces,'vertices',E,'FaceVertexCData',[0 0 1;0 1 0;1 0 0;1 1 0;0.5 0.5 0.5;1 0.5 0.5],'FaceColor','flat');

axis(2*[-kantenlaenge kantenlaenge -kantenlaenge kantenlaenge -kantenlaenge kantenlaenge]);
hold on;
alpha(0.7);
view(30,30);

P1x=[0 0 0];
P2x=[1.2*kantenlaenge/2 0 0];
%Plot der x-Achse
arrow3(P1x,P2x,'k');
text(P2x(1),P2x(2),P2x(3),'  x','HorizontalAlignment','left','FontSize',10);


P1y=[0 0 0];
P2y=[0 1.2*kantenlaenge/2 0];
%Plot der y-Achse
arrow3(P1y,P2y,'k');
text(P2y(1),P2y(2),P2y(3),'  y','HorizontalAlignment','left','FontSize',10);

P1z=[0 0 0];
P2z=[0 0 1.2*kantenlaenge/2];
%Plot der z-Achse
arrow3(P1z,P2z,'k');
text(P2z(1),P2z(2),P2z(3),'  z','HorizontalAlignment','left','FontSize',10);

grid on;
hold off;

end
