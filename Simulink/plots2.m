% Colores
redd ='#A2142F';
orangee = '#D95319';
bluee = '#0072BD';
greenn = '#77AC30';
purplee = '#7E2F8E';
yelloww = '#EDB120';
pinkk = '#ffafcc';
brownn = '#7f4f24';

thetam = out.get('theta_m');
thetam_consigna = out.get('theta_m_consigna');
thetam_obs = out.get('theta_m_obs');

% Gráfica

% Configuración de la ventana
defaultPos = get(groot, 'defaultFigurePosition');       % [left, bottom, width, height]
newWidth = defaultPos(3) * 2;     % 2.5    % 2                    
newheight = defaultPos(4) * 1;    % 0.5    % 1

% Creación de la figura
figure('Position', [defaultPos(1:2) newWidth newheight]);

sgtitle('Estimación de posición con perturbación, m_l máxima');
subplot(1,2,1);
plot(thetam.Time, thetam.Data, 'Color', greenn, 'LineWidth', 1.5, 'LineStyle','--');
hold on;
plot(thetam_obs.Time, thetam_obs.Data, 'Color', purplee, 'LineWidth', 1.5, 'LineStyle',':');
ylabel('Posición [rad]');
xlabel('Tiempo [s]');
legend('\theta_{m}','\theta_{obs}','Location','northeast');
grid on;
ylim([-0.002 0.002]);
set(gca, 'FontSize', 12);

subplot(1,2,2);
plot(thetam.Time, thetam.Data, 'Color', greenn, 'LineWidth', 1.5, 'LineStyle','--');
hold on;
plot(thetam_obs.Time, thetam_obs.Data, 'Color', purplee, 'LineWidth', 1.5, 'LineStyle',':');
ylabel('Posición [rad]');
xlabel('Tiempo [s]');
legend('\theta_{m}','\theta_{obs}','Location','northeast');
grid on;
set(gca, 'FontSize', 12);
% axis tight;
ylim([-0.002 0.002]);
xlim([6.9998 7.05]);

% Guardar la figura en alta resolución (300 dpi) y formato PNG
exportgraphics(gcf, ...
    'C:/Users/Marti/Desktop/popop.png', ...
    'Resolution', 300, ...       % Alta resolución (300 ppp)
    'BackgroundColor', 'white',...  % Fondo blanco (en lugar de transparente)
    'ContentType', 'auto');     % Tipo de contenido automático (vectorial si es posible)