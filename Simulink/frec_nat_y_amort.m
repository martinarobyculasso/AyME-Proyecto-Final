% parametros;
% T=95;
% % Fórmula para omega_n
% R_s= R_s_ref * (1 + alpha_Cu * (T - T_s_ref));
% omega_n = sqrt((R_s * b_eq_max + (3/2) * P_p^2 * lambda_m^2) / (J_eq_max * L_q))
% % Fórmula para xi (xi)
% xi = (L_q * b_eq_max + R_s * J_eq_max) / (2 * J_eq_max * L_q * omega_n)
% 
% 
% 
% 
% 
% % Definir los valores de T y los parámetros
% T_values = 20:10.5:115;  % Temperaturas de 20°C a 115°C con paso de 10.5°C
% 
% % Inicializar vectores para R_s, xi (zeta) y omega_n
% R_s_values = zeros(size(T_values)); 
% 
% %parametros nominales
% xi_values = zeros(size(T_values)); 
% omega_n_values = zeros(size(T_values));
% 
% %parametros minimos
% xi_values_min = zeros(size(T_values)); 
% omega_n_values_min = zeros(size(T_values));
% 
% %parametros maximos
% xi_values_max = zeros(size(T_values)); 
% omega_n_values_max = zeros(size(T_values));
% 
% % Calcular R_s, xi y omega_n para cada temperatura
% for i = 1:length(T_values)
% 
%     % Calcular R_s para cada valor de T
%     R_s_values(i) = R_s_ref * (1 + alpha_Cu * (T_values(i) - T_s_ref));
% 
%     % Calcular omega_n
%     omega_n_values(i) = sqrt((R_s_values(i) * b_eq + (3/2) * P_p^2 * lambda_m^2) / (J_eq * L_q));
%     xi_values(i) = (L_q * b_eq + R_s_values(i) * J_eq) / (2 * J_eq * L_q * omega_n_values(i));
% 
% 
%     %parametros de carga minimos
%     omega_n_values_min(i) = sqrt((R_s_values(i) * b_eq_min + (3/2) * P_p^2 * lambda_m^2) / (J_eq_min * L_q));
%     xi_values_min(i) = (L_q * b_eq_min + R_s_values(i) * J_eq_min) / (2 * J_eq_min * L_q * omega_n_values_min(i));
% 
%     %parametros de carga minimos
%     omega_n_values_max(i) = sqrt((R_s_values(i) * b_eq_max + (3/2) * P_p^2 * lambda_m^2) / (J_eq_max * L_q));
%     xi_values_max(i) = (L_q * b_eq_max + R_s_values(i) * J_eq_max) / (2 * J_eq_max * L_q * omega_n_values_max(i));
% end
% 
% 
% %GRAFICO PARA VALORES MIN Y MAX DE PARAMETROS DE CARGA
% 
% 
% % Graficar omega_n_values_min y omega_n_values_max en la misma figura
% % Graficar omega_n_values_min y omega_n_values_max en la misma figura
% figure(1);
% hold on;  % Mantener la gráfica activa para agregar múltiples curvas
% 
% % Graficar omega_n_values_min
% plot(R_s_values, omega_n_values_min, '-ro', 'LineWidth', 0.5, 'MarkerSize', 6, 'MarkerFaceColor', 'r', 'DisplayName', 'b_{eq} y J_{eq} min');
% 
% % Graficar omega_n_values_max
% plot(R_s_values, omega_n_values_max, '-bo', 'LineWidth', 0.5, 'MarkerSize', 6, 'MarkerFaceColor', 'b', 'DisplayName', 'b_{eq} y J_{eq} max');
% 
% % Añadir etiquetas y título
% xlabel('R_s (\Omega)');
% ylabel('\omega_n (rad/s)');
% %title('Frecuencia natural \omega_n vs R_s');
% legend('show', 'Location', 'northeastoutside', 'FontSize',20);  % Mover fuera de la gráfica
% grid on;
% hold off;  % Dejar de mantener la gráfica activa
% 
% 
% figure(2);
% hold on;  % Mantener la gráfica activa para agregar múltiples curvas
% 
% % Graficar omega_n_values_min
% plot(R_s_values, xi_values_min, '-ro', 'LineWidth', 0.5, 'MarkerSize', 6, 'MarkerFaceColor', 'r', 'DisplayName', 'omega_n_{min}');
% 
% % Graficar omega_n_values_max
% plot(R_s_values, xi_values_max, '-bo', 'LineWidth', 0.5, 'MarkerSize', 6, 'MarkerFaceColor', 'b', 'DisplayName', 'omega_n_{max}');
% 
% % Añadir etiquetas y título
% xlabel('R_s (\Omega)');
% ylabel('\xi (Amortiguamiento)');
% %title('Frecuencia natural \omega_n vs R_s');
% 
% grid on;
% hold off;  % Dejar de mantener la gráfica activa







%GRAFICO PARA VALORES NOMINALES
%{
% Graficar omega_n en la figura 1
figure(1);
plot(R_s_values, omega_n_values, 'b-', 'LineWidth', 0.5);  % Línea azul
hold on;
plot(R_s_values, omega_n_values, 'ko', 'MarkerFaceColor', 'b');  % Puntos rellenos
grid on;  % Activar la grilla
xlabel('R_s (\Omega)');
ylabel('\omega_n (rad/s)');
%title('Frecuencia natural \omega_n vs R_s');
legend('b_{eq} y J_{eq} Nom', 'Location', 'best', 'FontSize', 12);
hold off;


% Graficar xi en la figura 2
figure(2);
plot(R_s_values, xi_values, 'b-', 'LineWidth', 0.5);  % Línea azul
hold on;
plot(R_s_values, xi_values, 'ko', 'MarkerFaceColor', 'b');  % Puntos rellenos
grid on;  % Activar la grilla
xlabel('R_s (\Omega)');
ylabel('\xi (Amortiguamiento)');
%title('Amortiguamiento \xi vs R_s');
hold off;
%}
% %%
% 
% Colores
redd     = '#A2142F';
orangee  = '#D95319';
bluee    = '#0072BD';
greenn   = '#77AC30';
purplee  = '#7E2F8E';
yelloww  = '#EDB120';
pinkk    = '#ffafcc';
brownn   = '#7f4f24';

% --- Parámetros iniciales ---
parametros;

% Vector de temperaturas: 6 puntos equidistantes entre 20 °C y 115 °C
T_values = linspace(20, 115, 6);
R_s_values = R_s_ref * (1 + alpha_Cu * (T_values - T_s_ref));

% Inicialización de vectores
xi_values_min = zeros(size(T_values));
xi_values_max = zeros(size(T_values));
omega_n_values_min = zeros(size(T_values));
omega_n_values_max = zeros(size(T_values));

for i = 1:length(T_values)
    Rs = R_s_values(i);

    omega_n_values_min(i) = sqrt((Rs * b_eq_min + (3/2) * P_p^2 * lambda_m^2) / (J_eq_min * L_q));
    xi_values_min(i) = (L_q * b_eq_min + Rs * J_eq_min) / (2 * J_eq_min * L_q * omega_n_values_min(i));

    omega_n_values_max(i) = sqrt((Rs * b_eq_max + (3/2) * P_p^2 * lambda_m^2) / (J_eq_max * L_q));
    xi_values_max(i) = (L_q * b_eq_max + Rs * J_eq_max) / (2 * J_eq_max * L_q * omega_n_values_max(i));
end
% 
% % --- Gráfico 1: xi con parámetros mínimos ---
% f1 = figure;
% plot(R_s_values, xi_values_min, '-o', ...
%     'Color', bluee, ...
%     'MarkerFaceColor', bluee, ...
%     'MarkerEdgeColor', bluee, ...
%     'LineWidth', 1.5);
% hold on;
% yline(1, '--r', 'LineWidth', 1.5);
% 
% % Etiquetas de temperatura
% for i = 1:length(T_values)
%     text(R_s_values(i) + 0.005, xi_values_min(i), sprintf('%.0f°C', T_values(i)), 'FontSize', 10);
% end
% 
% xlabel('R_s [\Omega]');
% ylabel('\zeta [adim]');
% title('Variación de \zeta con R_s, parámetros de carga mínimos');
% grid on; axis tight;
% set(gca, 'FontSize', 12);
% exportgraphics(f1, 'xi_min_Rs.png', 'Resolution', 300);
% 
% % --- Gráfico 2: xi con parámetros máximos ---
% f2 = figure;
% plot(R_s_values, xi_values_max, '-o', ...
%     'Color', orangee, ...
%     'MarkerFaceColor', orangee, ...
%     'MarkerEdgeColor', orangee, ...
%     'LineWidth', 1.5);
% hold on;
% yline(1, '--r', 'LineWidth', 1.5);
% 
% for i = 1:length(T_values)
%     text(R_s_values(i) + 0.005, xi_values_max(i), sprintf('%.0f°C', T_values(i)), 'FontSize', 10);
% end
% 
% xlabel('R_s [\Omega]');
% ylabel('\zeta [adim]');
% title('Variación de \zeta con R_s, parámetros de carga máximos');
% grid on; axis tight;
% set(gca, 'FontSize', 12);
% exportgraphics(f2, 'xi_max_Rs.png', 'Resolution', 300);
% 
% % --- Gráfico 3: omega_n con parámetros mínimos ---
% f3 = figure;
% plot(R_s_values, omega_n_values_min, '-o', ...
%     'Color', bluee, ...
%     'MarkerFaceColor', bluee, ...
%     'MarkerEdgeColor', bluee, ...
%     'LineWidth', 1.5);
% hold on;
% 
% for i = 1:length(T_values)
%     text(R_s_values(i) + 0.005, omega_n_values_min(i), sprintf('%.0f°C', T_values(i)), 'FontSize', 10);
% end
% 
% xlabel('R_s [\Omega]');
% ylabel('\omega_n [rad/s]');
% title('Variación de \omega_n con R_s, parámetros de carga mínimos');
% grid on; axis tight;
% set(gca, 'FontSize', 12);
% exportgraphics(f3, 'omega_n_min_Rs.png', 'Resolution', 300);
% 
% % --- Gráfico 4: omega_n con parámetros máximos ---
% f4 = figure;
% plot(R_s_values, omega_n_values_max, '-o', ...
%     'Color', orangee, ...
%     'MarkerFaceColor', orangee, ...
%     'MarkerEdgeColor', orangee, ...
%     'LineWidth', 1.5);
% hold on;
% 
% for i = 1:length(T_values)
%     text(R_s_values(i) + 0.005, omega_n_values_max(i), sprintf('%.0f°C', T_values(i)), 'FontSize', 10);
% end
% 
% xlabel('R_s [\Omega]');
% ylabel('\omega_n [rad/s]');
% title('Variación de \omega_n con R_s, parámetros de carga máximos');
% grid on; axis tight;
% set(gca, 'FontSize', 12);
% exportgraphics(f4, 'omega_n_max_Rs.png', 'Resolution', 300);
defaultPos = get(groot, 'defaultFigurePosition');       % [left, bottom, width, height]
newWidth = defaultPos(3) * 1.5;     % 2.5    % 2                    
newheight = defaultPos(4) * 1.5;    % 0.5    % 1



%% === Gráfico 1: ζ (xi) vs R_s, parámetros min y max superpuestos ===
f1 = figure('Position', [defaultPos(1:2) newWidth newheight]);
plot(R_s_values, xi_values_min, '-o', ...
     'Color', bluee, 'MarkerFaceColor', bluee, ...
     'DisplayName', 'Carga mínima', 'LineWidth', 1.5);
hold on;
plot(R_s_values, xi_values_max, '-s', ...
     'Color', orangee, 'MarkerFaceColor', orangee, ...
     'DisplayName', 'Carga máxima', 'LineWidth', 1.5);
yline(1, '--', 'DisplayName', '\zeta = 1', 'LineWidth', 1.5);

% Etiquetas de temperatura (desfasadas para evitar solaparse)
for i = 1:length(T_values)
    text(R_s_values(i) + 0.004, xi_values_min(i) + 0.02, ...
         sprintf('%.0f°C', T_values(i)), 'FontSize', 9, 'Color', bluee);
    text(R_s_values(i) + 0.004, xi_values_max(i) - 0.02, ...
         sprintf('%.0f°C', T_values(i)), 'FontSize', 9, 'Color', orangee);
end

xlabel('R_s [\Omega]');
ylabel('\zeta [adim]');
title('Variación de \zeta con R_s (mín./máx.)');
legend('Location','best');
grid on; 
set(gca,'FontSize',12);

exportgraphics(f1, 'xi_Rs_superpuesto.png', 'Resolution', 300);

%% === Gráfico 2: \omega_n vs R_s, parámetros min y max superpuestos ===
f2 = figure('Position', [defaultPos(1:2) newWidth newheight]);
plot(R_s_values, omega_n_values_min, '-o', ...
     'Color', bluee, 'MarkerFaceColor', bluee, ...
     'DisplayName', 'Carga mínima', 'LineWidth', 1.5);
hold on;
plot(R_s_values, omega_n_values_max, '-s', ...
     'Color', orangee, 'MarkerFaceColor', orangee, ...
     'DisplayName', 'Carga máxima', 'LineWidth', 1.5);

% Etiquetas de temperatura (mismo criterio de desplazamiento)
for i = 1:length(T_values)
    text(R_s_values(i) + 0.004, omega_n_values_min(i) + 0.02*omega_n_values_min(i), ...
         sprintf('%.0f°C', T_values(i)), 'FontSize', 9, 'Color', bluee);
    text(R_s_values(i) + 0.004, omega_n_values_max(i) - 0.02*omega_n_values_max(i), ...
         sprintf('%.0f°C', T_values(i)), 'FontSize', 9, 'Color', orangee);
end

xlabel('R_s [\Omega]');
ylabel('\omega_n [rad/s]');
title('Variación de \omega_n con R_s (mín./máx.)');
legend('Location','best');
grid on; 
set(gca,'FontSize',12);

exportgraphics(f2, 'omega_n_Rs_superpuesto.png', 'Resolution', 300);


