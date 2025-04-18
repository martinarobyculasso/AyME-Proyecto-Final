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
m_l_min = 0.0;
m_l_max = 1.5;

% Momento de inercia total (al eje de rotacion) [kg.m^2]
J_l = (m*(l_cm)^2 + J_cm) + m_l*(l_l^2);     

J_l_min = (m*(l_cm)^2 + J_cm) + m_l_min*(l_l^2);  
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
R_s = R_s_ref;

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
T_amb = 20;         % [-15...40]

%% Modelo matematico equivalente del subsistema mecanico completo

% Momento de inercia equivalente [kg.m^2]
J_eq = J_m + J_l/(r^2);

J_eq_min = J_m + J_l_min/(r^2);
J_eq_max = J_m + J_l_max/(r^2);

% Coeficiente de friccion equivalente [N.m/(rad/s)]
b_eq = b_m + b_l/(r^2);

b_eq_min = b_m + b_l_min/(r^2);
b_eq_max = b_m + b_l_max/(r^2);

