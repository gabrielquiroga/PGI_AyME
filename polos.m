
% colours = ['gx' 'bx' 'rx'];

for k=1:length(R_s_range)
    figure(k)
    R_s_i = R_s_range(k)
    z1 = -R_s/L_q;

    for i=1:length(Jeq_range)

        Jeq_i = Jeq_range(i);
        beq_i = beq_range(i);

        a = Jeq_i*L_q;
        b = (L_q*beq_i + R_s*Jeq_i);
        c = (R_s*beq_i + 1.5*(P_p^2)*(lambda_m^2));
        s2 = (- b + sqrt(b^2 - 4*a*c))/(2*a)
        s3 = (- b - sqrt(b^2 - 4*a*c))/(2*a)
        wn = sqrt((c/a));
        zitta = (R_s/L_q + beq_i/Jeq_i)/(2*wn);

        % plot(s2, colours(i))
        plot(s2, 'gx')
        hold on
        % plot(s3, colours(i))
        plot(s3, 'gx')
    end

    plot(z1, 0, 'bo')
    plot(0,0)
    grid on
    hold off
end
