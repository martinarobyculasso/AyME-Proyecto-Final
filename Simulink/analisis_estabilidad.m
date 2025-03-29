
% Analisis de estabilidad a lazo abierto

clc; clear; close;
parametros_sim

% Polos y ceros

a = J_eq * L_q;
b = b_eq * L_q + J_eq * R_s_ref;
c = b_eq * R_s_ref + 1.5 * (P_p * lambda_m)^2;

% Numerador
num = -(1 / r) * [L_q R_s_ref];

% Denominador
den = [a b c]; 
den = conv([1 0], den); 

% Crear la función de transferencia
G = tf(num, den);

% Obtener polos y ceros
poles = pole(G)
zeros_G = zero(G)


% % Barrido de J_eq
% J_eq_values = linspace(J_eq_min, J_eq_max, 20); 
% 
% % Barrido de b_eq
% b_eq_values = linspace(b_eq_min, b_eq_max, 20); 
% 
% % Barrido de R_s
% R_s_values = linspace(R_s_min, R_s_max, 20); 
% 
% % Inicializar figura 1 - J_eq %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure;
% hold on;
% 
% % Graficar polos y ceros con J_eq_min
% J_eq = J_eq_min;  % Valor mínimo de J_eq
% a = J_eq * L_q;
% b = b_eq * L_q + J_eq * R_s_ref;
% c = b_eq * R_s_ref + 1.5 * (P_p * lambda_m)^2;
% 
% % Numerador
% num = -(1 / r) * [L_q R_s];
% 
% % Denominador
% den = [a b c]; 
% den = conv([1 0], den); 
% 
% % Crear la función de transferencia
% G = tf(num, den);
% 
% % Obtener polos y ceros
% poles = pole(G);
% zeros_G = zero(G);
% 
% % Graficar con cruz roja
% plot(real(poles), imag(poles), 'rx', 'MarkerSize', 10, 'LineWidth', 2);
% text(real(poles(2)), imag(poles(2)), '   min J_l', 'Color', 'red', 'FontSize', 12, 'HorizontalAlignment', 'left');
% text(real(poles(3)), imag(poles(3)), '   min J_l', 'Color', 'red', 'FontSize', 12, 'HorizontalAlignment', 'left');
% % plot(real(zeros_G), imag(zeros_G), 'rx', 'MarkerSize', 10, 'LineWidth', 2);
% 
% % Graficar polos y ceros con J_eq_max
% J_eq = J_eq_max;  % Valor máximo de J_eq
% a = J_eq * L_q;
% b = b_eq * L_q + J_eq * R_s_ref;
% c = b_eq * R_s_ref + 1.5 * (P_p * lambda_m)^2;
% 
% % Numerador
% num = -(1 / r) * [L_q R_s];
% 
% % Denominador
% den = [a b c]; 
% den = conv([1 0], den); 
% 
% % Crear la función de transferencia
% G = tf(num, den);
% 
% % Obtener polos y ceros
% poles = pole(G);
% zeros_G = zero(G);
% 
% % Graficar con cruz azul
% plot(real(poles), imag(poles), 'bx', 'MarkerSize', 12, 'LineWidth', 2);
% text(real(poles(2)), imag(poles(2)), '   max J_l', 'Color', 'blue', 'FontSize', 12, 'HorizontalAlignment', 'left');
% text(real(poles(3)), imag(poles(3)), '   max J_l', 'Color', 'blue', 'FontSize', 12, 'HorizontalAlignment', 'left');
% % plot(real(zeros_G), imag(zeros_G), 'bx', 'MarkerSize', 10, 'LineWidth', 2);
% 
% % Barrer los valores de J_eq y graficar polos y ceros con b_eq y R_s_ref
% for J_eq = J_eq_values(2:end-1)  % No tomar primer ni último valor de J_eq
%     a = J_eq * L_q;
%     b = b_eq * L_q + J_eq * R_s_ref;
%     c = b_eq * R_s_ref + 1.5 * (P_p * lambda_m)^2;
% 
%     % Numerador
%     num = -(1 / r) * [L_q R_s];
% 
%     % Denominador
%     den = [a b c]; 
%     den = conv([1 0], den); 
% 
%     % Crear la función de transferencia
%     G = tf(num, den);
% 
%     % Obtener polos y ceros
%     poles = pole(G);
%     zeros_G = zero(G);
% 
%     % Graficar con punto gris pequeño
%     plot(real(poles), imag(poles), 'k.', 'MarkerSize', 6, 'LineWidth', 1);
%     plot(real(poles(1)), imag(poles(1)), 'kx', 'MarkerSize', 12, 'LineWidth', 2);
% %     plot(real(zeros_G), imag(zeros_G), 'k.', 'MarkerSize', 6, 'LineWidth', 1);
% end
% 
% % Configurar el gráfico
% xlabel('Parte Real');
% ylabel('Parte Imaginaria');
% title('Polos - barrido de J_{eq}');
% grid on;
% set(gca, 'XMinorTick', 'on', 'YMinorTick', 'on');  % Activar los ticks menores
% grid minor;  % Activar la cuadrícula secundaria
% axis equal;
% xlim([-5, 2]);  % Limitar el eje x hasta 1
% ylim([-8, 8]);  % Limitar el eje y
% xline(0, '--k'); % Línea vertical en el eje imaginario
% yline(0, '--k'); % Línea horizontal en el eje real
% hold off;
% 
% 
% % Inicializar figura 2 - b_eq %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure;
% hold on;
% 
% % Graficar polos y ceros con b_eq_min
% b_eq = b_eq_min;  % Valor mínimo de b_eq
% a = J_eq * L_q;
% b = b_eq * L_q + J_eq * R_s_ref;
% c = b_eq * R_s_ref + 1.5 * (P_p * lambda_m)^2;
% 
% % Numerador
% num = -(1 / r) * [L_q R_s];
% 
% % Denominador
% den = [a b c]; 
% den = conv([1 0], den); 
% 
% % Crear la función de transferencia
% G = tf(num, den);
% 
% % Obtener polos y ceros
% poles = pole(G);
% zeros_G = zero(G);
% 
% % Graficar con cruz roja
% plot(real(poles), imag(poles), 'rx', 'MarkerSize', 10, 'LineWidth', 2);
% text(real(poles(2)), imag(poles(2)), '   min b_{eq}', 'Color', 'red', 'FontSize', 12, 'HorizontalAlignment', 'left');
% text(real(poles(3)), imag(poles(3)), '   min b_{eq}', 'Color', 'red', 'FontSize', 12, 'HorizontalAlignment', 'left');
% 
% % Graficar polos y ceros con b_eq_max
% b_eq = b_eq_max;  % Valor máximo de b_eq
% a = J_eq * L_q;
% b = b_eq * L_q + J_eq * R_s_ref;
% c = b_eq * R_s_ref + 1.5 * (P_p * lambda_m)^2;
% 
% % Numerador
% num = -(1 / r) * [L_q R_s];
% 
% % Denominador
% den = [a b c]; 
% den = conv([1 0], den); 
% 
% % Crear la función de transferencia
% G = tf(num, den);
% 
% % Obtener polos y ceros
% poles = pole(G);
% zeros_G = zero(G);
% 
% % Graficar con cruz azul
% plot(real(poles), imag(poles), 'bx', 'MarkerSize', 12, 'LineWidth', 2);
% text(real(poles(2)), imag(poles(2)), '   max b_{eq}', 'Color', 'blue', 'FontSize', 12, 'HorizontalAlignment', 'left');
% text(real(poles(3)), imag(poles(3)), '   max b_{eq}', 'Color', 'blue', 'FontSize', 12, 'HorizontalAlignment', 'left');
% 
% % Barrer los valores de b_eq y graficar polos y ceros con b_eq y R_s_ref
% for b_eq = b_eq_values(2:end-1)  % No tomar primer ni último valor de b_eq
%     a = J_eq * L_q;
%     b = b_eq * L_q + J_eq * R_s_ref;
%     c = b_eq * R_s_ref + 1.5 * (P_p * lambda_m)^2;
% 
%     % Numerador
%     num = -(1 / r) * [L_q R_s];
% 
%     % Denominador
%     den = [a b c]; 
%     den = conv([1 0], den); 
% 
%     % Crear la función de transferencia
%     G = tf(num, den);
% 
%     % Obtener polos y ceros
%     poles = pole(G);
%     zeros_G = zero(G);
% 
%     % Graficar con punto gris pequeño
%     plot(real(poles), imag(poles), 'k.', 'MarkerSize', 6, 'LineWidth', 1);
%     plot(real(poles(1)), imag(poles(1)), 'kx', 'MarkerSize', 12, 'LineWidth', 2);
% end
% 
% % Configurar el gráfico
% xlabel('Parte Real');
% ylabel('Parte Imaginaria');
% title('Polos - barrido de b_{eq}');
% grid on;
% set(gca, 'XMinorTick', 'on', 'YMinorTick', 'on');  % Activar los ticks menores
% grid minor;  % Activar la cuadrícula secundaria
% axis equal;
% xlim([-5, 2]);  % Limitar el eje x hasta 1
% ylim([-8, 8]);  % Limitar el eje y
% xline(0, '--k'); % Línea vertical en el eje imaginario
% yline(0, '--k'); % Línea horizontal en el eje real
% hold off;
% 
% 
% % Inicializar figura 3 - R_s %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure;
% hold on;
% 
% % Graficar polos y ceros con R_s_ref
% R_s = R_s_min;  % Valor mínimo de R_s
% a = J_eq * L_q;
% b = b_eq * L_q + J_eq * R_s;
% c = b_eq * R_s + 1.5 * (P_p * lambda_m)^2;
% 
% % Numerador
% num = -(1 / r) * [L_q R_s];
% 
% % Denominador
% den = [a b c]; 
% den = conv([1 0], den); 
% 
% % Crear la función de transferencia
% G = tf(num, den);
% 
% % Obtener polos y ceros
% poles = pole(G);
% zeros_G = zero(G);
% 
% % Graficar con cruz roja
% plot(real(poles), imag(poles), 'rx', 'MarkerSize', 10, 'LineWidth', 2);
% text(real(poles(2)), imag(poles(2)), '   min R_s', 'Color', 'red', 'FontSize', 12, 'HorizontalAlignment', 'left');
% text(real(poles(3)), imag(poles(3)), '   min R_s', 'Color', 'red', 'FontSize', 12, 'HorizontalAlignment', 'left');
% 
% % Graficar polos y ceros con R_s_max
% R_s = R_s_max;  % Valor máximo de R_s
% a = J_eq * L_q;
% b = b_eq * L_q + J_eq * R_s;
% c = b_eq * R_s + 1.5 * (P_p * lambda_m)^2;
% 
% % Numerador
% num = -(1 / r) * [L_q R_s];
% 
% % Denominador
% den = [a b c]; 
% den = conv([1 0], den); 
% 
% % Crear la función de transferencia
% G = tf(num, den);
% 
% % Obtener polos y ceros
% poles = pole(G);
% zeros_G = zero(G);
% 
% % Graficar con cruz azul
% plot(real(poles), imag(poles), 'bx', 'MarkerSize', 12, 'LineWidth', 2);
% text(real(poles(2)), imag(poles(2)), '   max R_s', 'Color', 'blue', 'FontSize', 12, 'HorizontalAlignment', 'left');
% text(real(poles(3)), imag(poles(3)), '   max R_s', 'Color', 'blue', 'FontSize', 12, 'HorizontalAlignment', 'left');
% 
% % Barrer los valores de R_s y graficar polos y ceros con R_s y b_eq
% for R_s = R_s_values(2:end-1)  % No tomar primer ni último valor de R_s
%     a = J_eq * L_q;
%     b = b_eq * L_q + J_eq * R_s;
%     c = b_eq * R_s + 1.5 * (P_p * lambda_m)^2;
% 
%     % Numerador
%     num = -(1 / r) * [L_q R_s];
% 
%     % Denominador
%     den = [a b c]; 
%     den = conv([1 0], den); 
% 
%     % Crear la función de transferencia
%     G = tf(num, den);
% 
%     % Obtener polos y ceros
%     poles = pole(G);
%     zeros_G = zero(G);
% 
%     % Graficar con punto gris pequeño
%     plot(real(poles), imag(poles), 'k.', 'MarkerSize', 6, 'LineWidth', 1);
%     plot(real(poles(1)), imag(poles(1)), 'kx', 'MarkerSize', 12, 'LineWidth', 2);
% end
% 
% % Configurar el gráfico
% xlabel('Parte Real');
% ylabel('Parte Imaginaria');
% title('Polos - barrido de R_{s}');
% grid on;
% set(gca, 'XMinorTick', 'on', 'YMinorTick', 'on');  % Activar los ticks menores
% grid minor;  % Activar la cuadrícula secundaria
% axis equal;
% xlim([-5, 2]);  % Limitar el eje x hasta 1
% ylim([-8, 8]);  % Limitar el eje y
% xline(0, '--k'); % Línea vertical en el eje imaginario
% yline(0, '--k'); % Línea horizontal en el eje real
% hold off;
