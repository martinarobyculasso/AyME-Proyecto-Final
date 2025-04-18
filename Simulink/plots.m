
% Plots

% Simulación
out1 = sim('modelo_lti_aumentado_sim');
out2 = sim('modelo_nl_control_nl_2cVI_sim');

% Colores
redd ='#A2142F';
orangee = '#D95319';
bluee = '#0072BD';
greenn = '#77AC30';
purplee = '#7E2F8E';
yelloww = '#EDB120';
pinkk = '#ffafcc';
brownn = '#7f4f24';

% Gráfica

% Configuración de la ventana
defaultPos = get(groot, 'defaultFigurePosition');       % [left, bottom, width, height]
newWidth = defaultPos(3) * 2;                           
newheight = defaultPos(4) * 0.5;

% Creación de la figura
figure('Position', [defaultPos(1:2) newWidth newheight]);

% Data extraida del modelo
theta_m_nl = out2.get('theta_m_nl');
theta_m = out1.get('theta_m_plot');

plot(theta_m.Time, theta_m.Data, 'Color', yelloww, 'LineWidth', 1.5);
hold on;
plot(theta_m_nl.Time, theta_m_nl.Data, 'Color', purplee, 'LineStyle', '--','LineWidth', 1.5);

title('\theta_m (t)');
xlabel('Tiempo [s]');
ylabel('Posición [rad]');
legend('\theta_m LTI', '\theta_m NL', 'Location','best');

grid on;
set(gca, 'FontSize', 12);
axis tight;

% Guardar
exportgraphics(gcf, 'C:/Users/Marti/Documents/GitHub/AyME-Proyecto-Final/Informe/Figuras/comp_posiciones.pdf', 'ContentType', 'vector');
