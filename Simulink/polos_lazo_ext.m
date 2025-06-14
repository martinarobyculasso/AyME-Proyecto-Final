
% Comparacion de la ubicacion de polos
% Lazo Abierto vs. Lazo de corrientes vs. Controlador de movimiento

% Colores
redd ='#A2142F';
orangee = '#D95319';
bluee = '#0072BD';
greenn = '#77AC30';
purplee = '#7E2F8E';
yelloww = '#EDB120';
pinkk = '#ffafcc';
brownn = '#7f4f24';

syms s

% Polinomios simbólicos 
p_pid = s^3 + (b_a/J_eq)*s^2 + (K_sa/J_eq)*s + (K_sia/J_eq);
p_pid_max = s^3 + (b_a/J_eq_max)*s^2 + (K_sa/J_eq_max)*s + (K_sia/J_eq_max);
p_la = J_eq*L_q*s^3 + (L_q*b_eq+J_eq*R_s)*s^2 + (R_s*b_eq + (3/2)*(P_p*lambda_m^2))*s;


% Coeficientes numéricos
coef_pid = sym2poly(p_pid);
coef_pid_max = sym2poly(p_pid_max);
coef_la = sym2poly(p_la);

% Raíces (polos)
polos_pid = roots(coef_pid);
polos_pid_max = roots(coef_pid_max);
polos_la = roots(coef_la);

polo_corriente = -5000;

% Configuración de la ventana
defaultPos = get(groot, 'defaultFigurePosition'); % [left, bottom, width, height]
newbottom = defaultPos(2) * 0.3;
newWidth = defaultPos(3) * 2;                           
newheight = defaultPos(4) * 1.7;

% Creación de la figura
figure('Position', [defaultPos(1) newbottom newWidth newheight]);

hold on;
grid on;
set(gca, 'FontSize', 12);
axis equal;

title('Comparación de la ubicación de polos');
xlabel('Parte real');
ylabel('Parte imaginaria');


% Graficar polos
scatter(real(polos_la), imag(polos_la), 100, 'rx', 'LineWidth', 2,'DisplayName', 'Lazo Abierto');
scatter(real(polo_corriente), 0, 100, 'kx', 'LineWidth', 2, 'DisplayName', 'Lazo Corriente');
scatter(real(polos_pid), imag(polos_pid), 100, 'bx', 'LineWidth', 2, 'DisplayName', 'PID (valores mín.)');
scatter(real(polos_pid_max), imag(polos_pid_max), 100, 'gx', 'LineWidth', 2, 'DisplayName', 'PID (valores máx.)');


legend('Location', 'northeast');
% ylim([-1500 1500])

% Guardar la figura en alta resolución (300 dpi) y formato PNG
exportgraphics(gcf, ...
    'C:/Users/Marti/Desktop/polos_comp.png', ...
    'Resolution', 300, ...       % Alta resolución (300 ppp)
    'BackgroundColor', 'white',...  % Fondo blanco (en lugar de transparente)
    'ContentType', 'auto');     % Tipo de contenido automático (vectorial si es posible)
