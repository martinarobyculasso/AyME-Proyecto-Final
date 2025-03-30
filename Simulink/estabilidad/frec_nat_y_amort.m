parametros;
T=95;
% Fórmula para omega_n
R_s= R_s_ref * (1 + alpha_Cu * (T - T_s_ref));
omega_n = sqrt((R_s * b_eq_max + (3/2) * P_p^2 * lambda_m^2) / (J_eq_max * L_q))
% Fórmula para xi (xi)
xi = (L_q * b_eq_max + R_s * J_eq_max) / (2 * J_eq_max * L_q * omega_n)





% Definir los valores de T y los parámetros
T_values = 20:10.5:115;  % Temperaturas de 20°C a 115°C con paso de 10.5°C

% Inicializar vectores para R_s, xi (zeta) y omega_n
R_s_values = zeros(size(T_values)); 

%parametros nominales
xi_values = zeros(size(T_values)); 
omega_n_values = zeros(size(T_values));

%parametros minimos
xi_values_min = zeros(size(T_values)); 
omega_n_values_min = zeros(size(T_values));

%parametros maximos
xi_values_max = zeros(size(T_values)); 
omega_n_values_max = zeros(size(T_values));

% Calcular R_s, xi y omega_n para cada temperatura
for i = 1:length(T_values)
    
    % Calcular R_s para cada valor de T
    R_s_values(i) = R_s_ref * (1 + alpha_Cu * (T_values(i) - T_s_ref));
    
    % Calcular omega_n
    omega_n_values(i) = sqrt((R_s_values(i) * b_eq + (3/2) * P_p^2 * lambda_m^2) / (J_eq * L_q));
    xi_values(i) = (L_q * b_eq + R_s_values(i) * J_eq) / (2 * J_eq * L_q * omega_n_values(i));
    
    
    %parametros de carga minimos
    omega_n_values_min(i) = sqrt((R_s_values(i) * b_eq_min + (3/2) * P_p^2 * lambda_m^2) / (J_eq_min * L_q));
    xi_values_min(i) = (L_q * b_eq_min + R_s_values(i) * J_eq_min) / (2 * J_eq_min * L_q * omega_n_values_min(i));
    
    %parametros de carga minimos
    omega_n_values_max(i) = sqrt((R_s_values(i) * b_eq_max + (3/2) * P_p^2 * lambda_m^2) / (J_eq_max * L_q));
    xi_values_max(i) = (L_q * b_eq_max + R_s_values(i) * J_eq_max) / (2 * J_eq_max * L_q * omega_n_values_max(i));
end


%GRAFICO PARA VALORES MIN Y MAX DE PARAMETROS DE CARGA


% Graficar omega_n_values_min y omega_n_values_max en la misma figura
% Graficar omega_n_values_min y omega_n_values_max en la misma figura
figure(1);
hold on;  % Mantener la gráfica activa para agregar múltiples curvas

% Graficar omega_n_values_min
plot(R_s_values, omega_n_values_min, '-ro', 'LineWidth', 0.5, 'MarkerSize', 6, 'MarkerFaceColor', 'r', 'DisplayName', 'b_{eq} y J_{eq} min');

% Graficar omega_n_values_max
plot(R_s_values, omega_n_values_max, '-bo', 'LineWidth', 0.5, 'MarkerSize', 6, 'MarkerFaceColor', 'b', 'DisplayName', 'b_{eq} y J_{eq} max');

% Añadir etiquetas y título
xlabel('R_s (\Omega)');
ylabel('\omega_n (rad/s)');
%title('Frecuencia natural \omega_n vs R_s');
legend('show', 'Location', 'northeastoutside', 'FontSize',20);  % Mover fuera de la gráfica
grid on;
hold off;  % Dejar de mantener la gráfica activa


figure(2);
hold on;  % Mantener la gráfica activa para agregar múltiples curvas

% Graficar omega_n_values_min
plot(R_s_values, xi_values_min, '-ro', 'LineWidth', 0.5, 'MarkerSize', 6, 'MarkerFaceColor', 'r', 'DisplayName', 'omega_n_{min}');

% Graficar omega_n_values_max
plot(R_s_values, xi_values_max, '-bo', 'LineWidth', 0.5, 'MarkerSize', 6, 'MarkerFaceColor', 'b', 'DisplayName', 'omega_n_{max}');

% Añadir etiquetas y título
xlabel('R_s (\Omega)');
ylabel('\xi (Amortiguamiento)');
%title('Frecuencia natural \omega_n vs R_s');

grid on;
hold off;  % Dejar de mantener la gráfica activa







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


