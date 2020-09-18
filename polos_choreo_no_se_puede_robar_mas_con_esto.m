%% Análisis de Estabilidad a lazo abierto para Sistema LTI
%% Determinación de polos y ceros

% Gráfico con polos y cero en el plano imaginario
figure(1)
colours = [1 0 0;
           0 0 0;
           0.5 0.5 1];
Rs_var2 = [1.02 1.32];
R_s = 1.02;
z = tf([L_q R_s], 1);

for i=1:length(beq_range)
    s = tf(1, [Jeq_range(i)*L_q (beq_range(i)*L_q+Jeq_range(i)*R_s) (3/2*lambda_m^2*P_p^2) 0]);
    h = pzplot(s, z, 'o');
    set(h.allaxes.Children(2).Children, 'MarkerSize', 12, 'MarkerEdgeColor', colours(i,:), 'linewidth',3);
    set(h.allaxes.Children(1).Children, 'MarkerSize', 12, 'MarkerEdgeColor', 'green', 'linewidth',3);
    grid on;
    hold on;
end

for k=1:length(Rs_var2)
    z = tf([L_q Rs_var2(k)], 1);
    for i=1:length(beq_range)
        s = tf(1, [Jeq_range(i)*L_q (beq_range(i)*L_q + Jeq_range(i)*Rs_var2(k)) (3/2*lambda_m^2*P_p^2) 0]);
        h = pzplot(s, z, 'o');
        set(h.allaxes.Children(2).Children, 'MarkerSize', 10, 'MarkerEdgeColor', colours(i, :));
        set(h.allaxes.Children(1).Children, 'MarkerSize', 10, 'MarkerEdgeColor', 'green');
        grid on;
        hold on;
    end 
end
hold off;

