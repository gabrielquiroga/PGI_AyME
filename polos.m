
colours = ['g' 'b' 'r'];
z1 = zeros(1, 2);
for k=1:length(R_s_range)
    figure(k)
    R_s_i = R_s_range(k);
    z1(k) = -R_s_i/L_q;
    s2 = zeros(1, 3);
    s3 = zeros(1, 3);

    for i=1:length(Jeq_range)

        Jeq_i = Jeq_range(i);
        beq_i = beq_range(i);

        a = Jeq_i*L_q;
        b = (L_q*beq_i + R_s*Jeq_i);
        c = (R_s*beq_i + 1.5*(P_p^2)*(lambda_m^2));
        s2(i) = (- b + sqrt(b^2 - 4*a*c))/(2*a);
        s3(i) = (- b - sqrt(b^2 - 4*a*c))/(2*a);
        wn = sqrt((c/a));
        zitta = (R_s/L_q + beq_i/Jeq_i)/(2*wn);

        plot(s2, ('x' + colours(i)))
        %plot(s2, 'x')
        hold on
        plot(s3, ('x' + colours(i)))
        %plot(s3, 'x')
    end
    
    plot(s2(1),'xg')
    plot(s2(2),'xb')
    plot(s2(3),'xr')
    plot(s3(1),'xg')
    plot(s3(2),'xb')
    plot(s3(3),'xr')
    plot(z1(k), 0, 'bo')
    plot(0,0)
    grid on
    hold off
end
