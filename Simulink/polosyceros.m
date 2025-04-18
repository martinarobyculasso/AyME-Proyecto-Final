parametros;
clc;
%{
%% Polos y ceros
T=20;
R_ss = R_s_ref*(1+alpha_Cu*(T-T_s_ref));
a = J_eq * L_q;
b = b_eq * L_q + J_eq * R_ss;
c = b_eq * R_ss + 1.5 * (P_p * lambda_m)^2;

% Numerador
num = -(1 / r) * [L_q R_ss];

% Denominador
den = [a b c]; 
den = conv([1 0], den); 

% Crear la función de transferencia
G = tf(num, den);
L_q=L_q^3;
L_d=L_d^3;
% Obtener polos y ceros
poles = pole(G)
zeros_G = zero(G)
%}
% Definir los valores de T para los que se calcularán los polos
T_values = 20:10.5:115; % Los valores de T van de 20 a 115 con un paso de 5°C
p_real=zeros(3,length(T_values));
p_im=zeros(3,length(T_values));

% Bucle para calcular los polos para cada valor de T
for i = 1:length(T_values)
    T = T_values(i);
    
    % Calcular R_s para el valor de T
    R_ss = R_s_ref * (1 + alpha_Cu * (T - T_s_ref));
    
    % Cálculo de los coeficientes a, b, c
    a = J_eq * L_q;
    b = b_eq* L_q + J_eq * R_ss;
    c = b_eq * R_ss + 1.5 * (P_p * lambda_m)^2;
    
    % Numerador y denominador
    num = -(1 / r) * [L_q R_ss];
    den = [a b c];
    den = conv([1 0], den); 
    
    % Crear la función de transferencia
    G = tf(num, den);
    
    % Calcular los polos
    poles = pole(G);
    p_real(:,i)=real(poles);
    p_im(:,i)=imag(poles);
end
% Graficar los polos en el plano complejo
figure;
hold on;

% Colores para cada valor de T
colors = jet(size(p_real, 2));  % Utiliza un color diferente para cada temperatura

% Graficar los polos para cada valor de T
for i = 1:size(p_real, 2)
    % Obtener la parte real e imaginaria para la columna i
    real_part = p_real(:, i);
    imag_part = p_im(:, i);
    
    % Graficar los polos
     plot(real_part, imag_part, 'x', 'Color', colors(i,:), 'MarkerSize', 10, 'LineWidth', 2, 'DisplayName', ['T = ', num2str(10.5 * (i - 1) + 20), '°C']);
    
end

% Añadir etiquetas y leyenda
xlabel('Parte Real');
ylabel('Parte Imaginaria');
title('Polos del Sistema para Diferentes Temperaturas');
legend('show');
grid on;
hold off;






