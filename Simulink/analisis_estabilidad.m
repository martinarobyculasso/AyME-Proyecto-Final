
% Analisis de estabilidad a lazo abierto

clc; clear; close;

% Parametros 

% Aceleracion de la gravedad [m/s^2]
g = 9.80665;

%% CARGA MECANICA 
% Coeficiente de friccion viscosa en la articulacion [N.m/(rad/s)]
b_l = 0.1;          % [+- 0.03]

b_l_nom = 0.1;
b_l_min = b_l_nom - 0.03;
b_l_max = b_l_nom + 0.03;

% Masa del brazo manipulador
m = 1.0;

% Longitud equivalente del brazo (hasta el centro de masa) [m]
l_cm = 0.25;

% Momento de inercia equivalente del brazo (ref. al centro de masa) [kg.m^2]
J_cm = 0.0208;

% Longitud total del brazo (hasta el extremo) [m]
l_l = 0.50;

% Masa de carga util en el extremo - variable [kg]
m_l = 0.0;            % [0...1.5]
m_l_sc = 0.0;
m_l_max = 1.5;

% Momento de inercia total (al eje de rotacion) [kg.m^2]
J_l = (m*(l_cm)^2 + J_cm) + m_l*(l_l^2);     

J_l_min = (m*(l_cm)^2 + J_cm) + m_l_sc*(l_l^2);  
J_l_max = (m*(l_cm)^2 + J_cm) + m_l_max*(l_l^2);    

% Coeficiente k_l del torque de carga (incluye g) [N.m]
k_l = (m*l_cm + m_l*l_l)*g;

% Torque de perturbacion por contacto [N.m]
T_dl = 0;            % [+- 5.0]


%% TREN DE TRANSMISION

% Relación de reducción total
r = 120;

% Velocidad nominal a la salida [rpm]
n_l_nom = 60.0;

% Velocidad nominal a la salida [rad/s]
omega_l_nom = 6.28;

% Torque de saldia nominal [N.m]
T_q_nom = 17.0;

% Torque de salida pico [N.m]
T_q_max = 45.0;


%% MAQUINA ELECTRICA

% Momento de inercia (motor y caja) [kg.m^2]
J_m = 14.0e-6;

% Coeficiente de friccion viscosa (motor y caja) [N.m/(rad/s)]
b_m = 15.0e-6;

% Pares de polos magneticos
P_p = 3;

% Flujo magnetico equivalente de imanes concatenado por espiras del
% bobinado de estator [WB-t = V/(rad/s)]
lambda_m = 0.016;

% Inductancia de estator (eje en cuadratura, q) [mH]
L_q = 5.8 * 10^-3;

% Inductancia de estator (eje directo, d) [mH]
L_d = 6.6 * 10^-3;

% Inductancia de dispersion de estator [mH]
L_ls = 0.8* 10^-3;

% Resistencia de estator por fase (@ T_sREF) [ohm]
R_s_ref = 1.02;

% Resistencia de estator lineal [ohm]
R_s = 1;

% Temperatura de referencia del bobinado del estator [ºC]
T_s_ref = 20;

% Temperatura maxima del bobinado del estator [ºC]
T_s_max = 115;

% Coeficiente de aumento de la resistencia de bobinado del estator con la
% temperatura [1/ºC]
alpha_Cu = 3.9e-3;

% Resistencia de estator por fase @ T_s_max

T_s_min = -10;

R_s_min = R_s_ref*(1+alpha_Cu*(T_s_min-T_s_ref));
R_s_max = R_s_ref*(1+alpha_Cu*(T_s_max-T_s_ref));


% Capacitancia termica de estator [ W/(ºC/s)]
C_ts = 0.818;

% Resistencia termica estator-ambiente [ºC/W]
R_ts_amb = 146.7;

% Constante de tiempo termica = R_ts_amb * C_ts [s]
tau_ts_amb = 120;

% Velocidad nominal del rotor [rmp]
n_m_nom = 6600;

% Velocidad nominal del rotor [rad/s]
omega_m_nom = 691.15;

% Tension nominal de linea

% Tension nominal de fase

% Corriente nominal

% Corriente maxima

% Temperatura ambiente [ºC]
T_amb = 25;         % [-15...40]

%% Modelo matematico equivalente del subsistema mecanico completo

% Momento de inercia equivalente [kg.m^2]
J_eq = J_m + J_l/(r^2);

J_eq_min = J_m + J_l_min/(r^2);
J_eq_max = J_m + J_l_max/(r^2);

% Coeficiente de friccion equivalente [N.m/(rad/s)]
b_eq = b_m + b_l/(r^2);

b_eq_min = b_m + b_l_min/(r^2);
b_eq_max = b_m + b_l_max/(r^2);

%% Polos y ceros

a = J_eq * L_q;
b = b_eq * L_q + J_eq * R_s_ref;
c = b_eq * R_s_ref + 1.5 * (P_p * lambda_m)^2;

% Numerador
num = -(1 / r) * [L_q R_s];

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
