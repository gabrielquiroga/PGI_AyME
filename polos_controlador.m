%% Comparación de polos sin y con control PID

figure(1)
colours = [1 0 0;
           0 0 0;
           0.5 0.5 1];

% z1 = tf( 1, [J_eq b_a k_sa k_sia]);
% z2 = tf( 1, [L_q*J_eq (L_q*b_eq + R_s*J_eq) (R_s*b_eq + (3*P_p^2*lambda_m^2)/2) 0]);
% z3 = tf( 1, [L_q/Rp_q 1]);

z1 = tf( 1, [J_eq b_a k_sa k_sia]);
z2 = tf( 1, [L_q*J_eq (L_q*b_eq + R_s*J_eq) (R_s*b_eq + (3*P_p^2*lambda_m^2)/2) 0]);
z3 = tf( 1, [L_q/Rp_q 1]);

%Componentes a b y c de la ecuacion
a = 1;
b = 1;
c = 1;

%Seleccion de color con i
i = 1;

s = tf(1, [a b c 0]);
h = pzplot(z1, z2, z3, 'o');
%set(h.allaxes.Children(1).Children, 'MarkerSize', 12, 'MarkerEdgeColor', colours(1,:), 'linewidth',3);
set(h.allaxes.Children(3).Children, 'MarkerSize', 12, 'MarkerEdgeColor', 'blue', 'linewidth',3);
set(h.allaxes.Children(2).Children, 'MarkerSize', 12, 'MarkerEdgeColor', 'red', 'linewidth',3);
set(h.allaxes.Children(1).Children, 'MarkerSize', 12, 'MarkerEdgeColor', 'green', 'linewidth',3);
grid on;