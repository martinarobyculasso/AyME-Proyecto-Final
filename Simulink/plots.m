
% Plots

% Parámetros
% parametros

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

% % Configuración de la ventana
% defaultPos = get(groot, 'defaultFigurePosition');       % [left, bottom, width, height]
% newWidth = defaultPos(3) * 2.5;                           
% newheight = defaultPos(4) * 0.5;
% 
% % Creación de la figura
% figure('Position', [defaultPos(1:2) newWidth newheight]);
% 
% % Data extraida del modelo
% ome_nl = out2.get('omega_m_nl');
% torque = out2.get("T_m_nl");
% 
% plot(ome_nl.Data, torque.Data, 'Color', bluee, 'LineWidth', 1.5);
% title('T_{m} (t) vs. \omega_m (t) (Modelo Global NL)');
% xlabel('\omega_m (t) [rad/s]');
% ylabel('T_{m} (t) [N.m]');
% legend('\omega_m LTI', '\omega_m NL','Location','bestoutside');
% 
% grid on;
% set(gca, 'FontSize', 12);
% axis tight;

%%

% Configuración de la ventana
defaultPos = get(groot, 'defaultFigurePosition'); % [left, bottom, width, height]
newbottom = defaultPos(2) * 0.3;
newWidth = defaultPos(3) * 2;                           
newheight = defaultPos(4) * 1.7;

% Creación de la figura
figure('Position', [defaultPos(1) newbottom newWidth newheight]);

% Data extraida del modelo
ome_nl = out2.get('omega_m_nl');
torque = out2.get("T_m_nl");

% Graficar datos inicialmente para establecer límites
plot(ome_nl.Data, torque.Data, 'Color', [0 0.4470 0.7410], 'LineWidth', 1.5);
hold on;

% Definir límites de los ejes
xlims = xlim;
ylims = ylim;

x_margin = 15;
y_margin = 0.05;

% Definir colores para cada cuadrante con transparencia
colors = {[1 0.8 0.8 0.3], [0.8 1 0.8 0.3], [0.8 0.8 1 0.3], [1 1 0.8 0.3]};

% Dibujar los cuatro cuadrantes
% Cuadrante I (x>0, y>0)
patch([0 0 max(xlims) max(xlims)], [0 max(ylims) max(ylims) 0], colors{1}(1:3), ...
    'EdgeColor', 'none', 'FaceAlpha', colors{1}(4));

% Cuadrante II (x<0, y>0)
patch([min(xlims) min(xlims) 0 0], [0 max(ylims) max(ylims) 0], colors{2}(1:3), ...
    'EdgeColor', 'none', 'FaceAlpha', colors{2}(4));

% Cuadrante III (x<0, y<0)
patch([min(xlims) min(xlims) 0 0], [min(ylims) 0 0 min(ylims)], colors{3}(1:3), ...
    'EdgeColor', 'none', 'FaceAlpha', colors{3}(4));

% Cuadrante IV (x>0, y<0)
patch([0 0 max(xlims) max(xlims)], [min(ylims) 0 0 min(ylims)], colors{4}(1:3), ...
    'EdgeColor', 'none', 'FaceAlpha', colors{4}(4));

% Configuración común para todos los textos
text_props = {
    'FontSize', 11, ...
    'FontWeight', 'bold', ...
    'Margin', 1, ...
    'BackgroundColor', [1 1 1 0.7], ...
    'EdgeColor', 'k', ...
    'LineWidth', 0.5, ...
    'Interpreter', 'none'  % ← Esto soluciona el problema
};

% Textos para cada cuadrante (usando celdas para múltiples líneas)
text(min(xlims)+x_margin, max(ylims)-y_margin, {'Cuadrante II', 'Frenado Regenerativo Inverso'}, ...
    'HorizontalAlignment', 'center', 'VerticalAlignment', 'top', text_props{:});

text(max(xlims)-x_margin, max(ylims)-y_margin, {'Cuadrante I', 'Motorización Directa'}, ...
    'HorizontalAlignment', 'center', 'VerticalAlignment', 'top', text_props{:});

text(min(xlims)+x_margin, min(ylims)+y_margin, {'Cuadrante III', 'Motorización Inversa'}, ...
    'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom', text_props{:});

text(max(xlims)-x_margin, min(ylims)+y_margin, {'Cuadrante IV', 'Frenado Regenerativo Directo'}, ...
    'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom', text_props{:});

% Volver a graficar los datos para que queden sobre los cuadrantes
plot(ome_nl.Data, torque.Data, 'Color', bluee, 'LineWidth', 1.5);

% Elementos adicionales del gráfico
xline(0, '--k', 'LineWidth', 1.5);
yline(0, '--k', 'LineWidth', 1.5);

% Puntos destacados
highlight_points = [
    0, 0;
    14.06, -0.05;
    405.81, 0.009;
    391.4, 0.06;
    420.08, -0.04
];

plot(highlight_points(:,1), highlight_points(:,2), 'ro', ...
    'MarkerSize', 8, 'LineWidth', 1.5);

% Etiquetas de ejes
xlabel('\omega_m (t) [rad/s]', 'FontSize', 12);
ylabel('T_{m} (t) [N.m]', 'FontSize', 12);

% Configuración final
grid on;
set(gca, 'FontSize', 12, 'Box', 'on');
axis tight;
hold off;


%%
% Guardar
% exportgraphics(gcf, 'C:/Users/Marti/Documents/GitHub/AyME-Proyecto-Final/Informe/Figuras/curva_parametrica.eps', 'ContentType', 'vector');
