% Gráfico con polos y cero en el plano imaginario
figure(1)
colours = [1 0 0;
           0 0 0;
           0.5 0.5 1];

%Reemplazar aqui con los Zeros del sistema
z = tf([L_q R_s], 1);

%Componentes a b y c de la ecuacion
a = 1;
b = 1;
c = 1;

%Seleccion de color con i
i = 1;

s = tf(1, [a b c 0]);
h = pzplot(s, z, 'o');
set(h.allaxes.Children(2).Children, 'MarkerSize', 12, 'MarkerEdgeColor', colours(i,:), 'linewidth',3);
set(h.allaxes.Children(1).Children, 'MarkerSize', 12, 'MarkerEdgeColor', 'green', 'linewidth',3);
grid on;
