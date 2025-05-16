figure; hold on;
zeta = 0.1:0.1:0.9;  % Razón de amortiguamiento (líneas curvas)
wn = 0:50:500;       % Frecuencia natural en rad/s
sgrid(zeta, wn);     % Rejilla polar del plano s

colors = jet(length(T_values));  % Paleta de colores para T
legend_entries = strings(length(T_values), 1);

for i = 1:length(T_values)
    T = T_values(i);
    
    R_ss = R_s_ref * (1 + alpha_Cu * (T - T_s_ref));
    a = J_eq * L_q;
    b = b_eq * L_q + J_eq * R_ss;
    c = b_eq * R_ss + 1.5 * (P_p * lambda_m)^2;
    
    num = -(1 / r) * [L_q R_ss];
    den = conv([1 0], [a b c]);
    
    G = tf(num, den);
    
    % Obtener polos y graficar
    p = pole(G);
    plot(real(p), imag(p), 'x', 'Color', colors(i,:), 'MarkerSize', 10, 'LineWidth', 2);
    legend_entries(i) = sprintf('T = %.1f°C', T);
end

xlabel('Parte Real (s^{-1})');
ylabel('Parte Imaginaria (s^{-1})');
title('Diagrama de Polos con Variación de T');
legend(legend_entries, 'Location', 'eastoutside');
grid on;
set(gca, 'FontSize', 12);
