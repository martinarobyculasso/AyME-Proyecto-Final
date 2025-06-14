
% Plots

% Simulación
% out1 = sim('lti_aumentado2');
% out2 = sim('modelo_nl_control_nl_2cVI_sim');
% out = sim('mod_torque_con_PID_Obs');

% Colores
redd ='#A2142F';
orangee = '#D95319';
bluee = '#0072BD';
greenn = '#77AC30';
purplee = '#7E2F8E';
yelloww = '#EDB120';
pinkk = '#ffafcc';
brownn = '#7f4f24';

% Data extraida del modelo
% 
ia = out.get('corriente_a_nl');
% ib = out.get('i_b');
% ic = out.get('i_c');

iq = out.get('corriente_q_nl');
id = out.get('corriente_d_nl');
i0 = out.get('corriente_0_nl');
% 
% va = out.get('v_a');
% vb = out.get('v_b');
% vc = out.get('v_c');
% 
% vam = out.get('va_mod');
% vbm = out.get('vb_mod');
% vcm = out.get('vc_mod');
% 
% vq = out.get('v_q');
% vd = out.get('v_d');
% v0 = out.get('v_0');
% 
% thetam = out.get('theta_m');
% thetam_consigna = out.get('theta_m_consigna');
% thetam_obs = out.get('theta_m_obs');
% % 
% omegam = out.get('omega_m');
% omegam_consigna = out.get('omega_m_consigna');
% omegam_obs = out.get('omega_m_obs');
% 
% a1 = out.get('accel_1');
% a2 = out.get('accel_2');
% 
% q = out.get('consigna_q');
% dq = out.get('consigna_dq');
% 
% comp = out.get('comp');
% 
% tm = out.get('torque_m');
% tq = out.get('torque_q');
% ts = out.get('T_s');

% error_theta_consigna = (thetam_consigna.Data - thetam.Data);
% error_theta_estimacion = thetam.Data - thetam_obs.Data;
% error_omega_consigna = omegam_consigna.Data - omegam.Data;
% error_omega_estimacion = omegam.Data - omegam_obs.Data;

% % DISCRETO -------------------------------------
% thetam = out.get('thetamd');
% thetam_consigna = out.get('consigna_t_d');
% thetam_obs = out.get('theta_obsd');
% 
% ts = out.get('tsd');
% 
% ia = out.get('iad');
% ib = out.get('ibd');
% ic = out.get('icd');
% 
% va = out.get('vad');
% vb = out.get('vbd');
% vc = out.get('vcd');

% COMP RES --------------
% iaC = out.get('ia');
% ibC = out.get('ib');
% icC = out.get('ic');
% TsC = out.get('Ts');
% thetaC = out.get('theta_m');
% TmC = out.get('Tm');

% ia = out.get('ia');
% ib = out.get('ib');
% ic = out.get('ic');
% Ts = out.get('Ts');
% theta = out.get('theta_m');
% Tm = out.get('Tm');

% n = min(length(ia.Data), length(iaC.Data));
% dif = ic.Data(1:n) - icC.Data(1:n);

 % w1 = out.get('omega_m_nl');
 % tm1 = out.get('T_m_nl');

% Gráfica

% Configuración de la ventana
defaultPos = get(groot, 'defaultFigurePosition');       % [left, bottom, width, height]
newWidth = defaultPos(3) * 2.5;     % 2.5    % 2                    
newheight = defaultPos(4) * 0.5;    % 0.5    % 1

% Creación de la figura
figure('Position', [defaultPos(1:2) newWidth newheight]);
plot(ia.Time,ia.Data, 'Color', redd, 'LineWidth', 1.5);
% hold on;
% plot(w2.Time,tm2.Data, 'Color', pinkk, 'LineWidth', 1.5);
% plot(w3.Time,tm3.Data, 'Color', brownn, 'LineWidth', 1.5);
title('i_{a} (t)');
% legend('v_{ds}^* = 0','v_{ds}^* > 0','v_{ds}^* < 0','Location','bestoutside');
ylabel('Corriente [A]');
xlabel('Tiempo [s]');
axis tight
% xlim([0.49 0.6]);
% ylim([-1 1]);
grid on;
set(gca, 'FontSize', 12);

% Guardar la figura en alta resolución (300 dpi) y formato PNG
exportgraphics(gcf, ...
    'C:/Users/Marti/Desktop/ianl_new.png', ...
    'Resolution', 300, ...       % Alta resolución (300 ppp)
    'BackgroundColor', 'white',...  % Fondo blanco (en lugar de transparente)
    'ContentType', 'auto');     % Tipo de contenido automático (vectorial si es posible)

% plot(ia.Time,ia.Data, 'Color', bluee, 'LineWidth', 1.5);
% hold on;
% plot(ib.Time,ib.Data, 'Color', greenn, 'LineWidth', 1.5);
% plot(ic.Time,ic.Data, 'Color', orangee, 'LineWidth', 1.5);
% % yline(115,'r--','LineWidth', 1.5);
% title('i_{abc} (t)');
% legend('i_a','i_b','i_c','Location','northeast');
% ylabel('Corriente [A]');
% xlabel('Tiempo [s]');
% % xlim([0 0.14]);
% axis tight
% grid on
% plot(va.Time,va.Data, 'Color', bluee, 'LineWidth', 1.5);
% hold on;
% plot(vb.Time,vb.Data, 'Color', greenn, 'LineWidth', 1.5);
% plot(vc.Time,vc.Data, 'Color', orangee, 'LineWidth', 1.5);
% % title('Consignas de tensión que recibe el modulador');
% title('v_{abc}(t)')
% legend('v_a','v_b','v_c','Location','best');
% ylabel('Tensión [V]');
% xlabel('Tiempo [s]');
% grid on
% axis tight
% plot(ts.Time, ts.Data, 'Color',yelloww, 'LineWidth', 1.5);
% % title('Sensor de temperatura no ideal, \tau = 0,05 s');
% title('T°_s(t)')
% % legend('i_a','i_b','i_c','Location','southwest');
% ylabel('Temperatura [°C]');
% xlabel('Tiempo [s]');
% axis tight
% grid on;
% set(gca, 'FontSize', 12);

% plot(omegam_consigna.Time,omegam_consigna.Data, 'Color', orangee, 'LineWidth', 1.5);
% hold on;
% plot(omegam.Time,omegam.Data, 'Color', greenn, 'LineWidth', 1.5, 'LineStyle','--');
% plot(omegam_obs.Time,omegam_obs.Data, 'Color', purplee, 'LineWidth', 1.5,'LineStyle',':');
% title('\omega_m (t)');
% legend('\omega^*_{m}','\omega_{m}','\omega_{obs}','Location','best');
% ylabel('Velocidad [rad/s]');
% xlabel('Tiempo [s]');
% xlim([6.9998 7.015]);

% plot(thetam_consigna.Time,thetam_consigna.Data, 'Color', orangee, 'LineWidth', 1.5);
% hold on;
% plot(thetam.Time,thetam.Data, 'Color', greenn, 'LineWidth', 1.5, 'LineStyle','--');
% plot(thetam_obs.Time,thetam_obs.Data, 'Color', purplee, 'LineWidth', 1.5,'LineStyle',':');
% title('\theta_m (t)');
% legend('\theta^*_{m}','\theta_{m}','\theta_{obs}','Location','best');
% ylabel('Posición [rad]');
% xlabel('Tiempo [s]');
% % xlim([14.998 14.999]);
% % ylim([-0.3e-3 4e-3]);
% xlim([6.9998 7.015]);


% sgtitle('Seguimiento de consigna de posición nula con perturbación, observador con acción integral');
% subplot(1,2,1);
% plot(thetam_consigna.Time, thetam_consigna.Data, 'Color', orangee, 'LineWidth', 1.5);
% hold on;
% plot(thetam.Time, thetam.Data, 'Color', greenn, 'LineWidth', 1.5, 'LineStyle','--');
% plot(thetam_obs.Time, thetam_obs.Data, 'Color', purplee, 'LineWidth', 1.5, 'LineStyle',':');
% ylabel('Posición [rad]');
% xlabel('Tiempo [s]');
% legend('\theta^*_{m}','\theta_{m}','\theta_{obs}','Location','best');
% grid on;
% set(gca, 'FontSize', 12);
% 
% subplot(1,2,2);
% plot(thetam_consigna.Time, thetam_consigna.Data, 'Color', orangee, 'LineWidth', 1.5);
% hold on;
% plot(thetam.Time, thetam.Data, 'Color', greenn, 'LineWidth', 1.5, 'LineStyle','--');
% plot(thetam_obs.Time, thetam_obs.Data, 'Color', purplee, 'LineWidth', 1.5, 'LineStyle',':');
% ylabel('Posición [rad]');
% xlabel('Tiempo [s]');
% legend('\theta^*_{m}','\theta_{m}','\theta_{obs}','Location','best');
% grid on;
% set(gca, 'FontSize', 12);
% % axis tight;
% % ylim([-0.002 0.002]);
% xlim([6.9998 7.05]);


% % Guardar la figura en alta resolución (300 dpi) y formato PNG
% exportgraphics(gcf, ...
%     'C:/Users/Marti/Desktop/obs_vel_mejorado.png', ...
%     'Resolution', 300, ...       % Alta resolución (300 ppp)
%     'BackgroundColor', 'white',...  % Fondo blanco (en lugar de transparente)
%     'ContentType', 'auto');     % Tipo de contenido automático (vectorial si es posible)

% plot(ia.Time,ia.Data, 'Color', bluee, 'LineWidth', 1.5);
% hold on;
% plot(ib.Time,ib.Data, 'Color', greenn, 'LineWidth', 1.5);
% plot(ic.Time,ic.Data, 'Color', orangee, 'LineWidth', 1.5);
% % yline(115,'r--','LineWidth', 1.5);
% title('i_{abc} (t)');
% legend('i_a','i_b','i_c','Location','northeast');
% ylabel('Corriente [A]');
% xlabel('Tiempo [s]');
% % xlim([0 0.14]);
% % axis tight
% grid on



% plot(vam.Time,vam.Data, 'Color', bluee, 'LineWidth', 1.5);
% hold on;
% plot(vbm.Time,vbm.Data, 'Color', greenn, 'LineWidth', 1.5);
% plot(vcm.Time,vcm.Data, 'Color', orangee, 'LineWidth', 1.5);
% title('Modulador de tensión no ideal, \omega_n = 6000 rad/s');
% legend('v_a','v_b','v_c','Location','best');
% ylabel('Tensión [V]');
% xlabel('Tiempo [s]');
% grid on
% 

% set(gca, 'FontSize', 12);

% plot(thetam_consigna.Time,thetam_consigna.Data, 'Color', orangee, 'LineWidth', 1.5);
% hold on;
% plot(thetam.Time,thetam.Data, 'Color', greenn, 'LineWidth', 1.5, 'LineStyle','--');
% plot(thetam_obs.Time,thetam_obs.Data, 'Color', purplee, 'LineWidth', 1.5,'LineStyle',':');
% title('\theta_m (t)');
% legend('\theta^*_{m}','\theta_{m}','\theta_{obs}','Location','northeast');
% ylabel('Posición [rad]');
% xlabel('Tiempo [s]');
% xlim([14.998 14.999]);
% ylim([-0.3e-3 4e-3]);
% % axis tight
% grid on

% plot(omegam_consigna.Time,omegam_consigna.Data, 'Color', orangee, 'LineWidth', 1.5);
% hold on;
% plot(omegam.Time,omegam.Data, 'Color', greenn, 'LineWidth', 1.5, 'LineStyle','--');
% plot(omegam_obs.Time,omegam_obs.Data, 'Color', purplee, 'LineWidth', 1.5,'LineStyle',':');
% title('\omega_m (t)');
% legend('\omega^*_{m}','\omega_{m}','\omega_{obs}','Location','northeast');
% ylabel('Velocidad [rad/s]');
% xlabel('Tiempo [s]');
% % xlim([14.98 15.1]);
% % ylim([-100 800]);
% % axis tight
% grid on

% sgtitle('Nueva consigna de posición para el eje mecánico');
% subplot(1,2,1);
% plot(thetam_consigna.Time, thetam_consigna.Data, 'Color', orangee, 'LineWidth', 1.5);
% % hold on
% % plot(comp.Time, comp.Data, 'Color', orangee, 'LineWidth', 1.5, 'LineStyle','--');
% % title('Consigna de velocidad articular, \omega_l*(t)');
% ylabel('Posición [rad]');
% xlabel('Tiempo [s]');
% % legend('\theta_{m}','\theta_{obs}','Location','best');
% grid on;
% set(gca, 'FontSize', 12);
% % axis tight;
% % ylim([-0.002 0.002]);
% 
% subplot(1,2,2);
% plot(thetam_consigna.Time, thetam_consigna.Data, 'Color', orangee, 'LineWidth', 1.5);
% hold on
% plot(comp.Time, comp.Data, 'Color', orangee, 'LineWidth', 1.5, 'LineStyle','--');
% % title('Consigna de velocidad para el eje mecánico, \omega_m*(t)');
% ylabel('Posición [rad]');
% xlabel('Tiempo [s]');
% legend('Nuevo perfil','Perfil anterior','Location','best');
% grid on;
% set(gca, 'FontSize', 12);
% xlim([4.8 5.15]);
% ylim([710 760]);

% sgtitle('Seguimiento de consigna de posición nula con perturbación, observador con acción integral');
% subplot(1,2,1);
% plot(thetam_consigna.Time, thetam_consigna.Data, 'Color', orangee, 'LineWidth', 1.5);
% hold on;
% plot(thetam.Time, thetam.Data, 'Color', greenn, 'LineWidth', 1.5, 'LineStyle','--');
% plot(thetam_obs.Time, thetam_obs.Data, 'Color', purplee, 'LineWidth', 1.5, 'LineStyle',':');
% ylabel('Posición [rad]');
% xlabel('Tiempo [s]');
% legend('\theta^*_{m}','\theta_{m}','\theta_{obs}','Location','best');
% grid on;
% set(gca, 'FontSize', 12);
% % ylim([-0.002 0.002]);
% 
% subplot(1,2,2);
% plot(thetam_consigna.Time, thetam_consigna.Data, 'Color', orangee, 'LineWidth', 1.5);
% hold on;
% plot(thetam.Time, thetam.Data, 'Color', greenn, 'LineWidth', 1.5, 'LineStyle','--');
% plot(thetam_obs.Time, thetam_obs.Data, 'Color', purplee, 'LineWidth', 1.5, 'LineStyle',':');
% ylabel('Posición [rad]');
% xlabel('Tiempo [s]');
% legend('\theta^*_{m}','\theta_{m}','\theta_{obs}','Location','best');
% grid on;
% set(gca, 'FontSize', 12);
% % axis tight;
% % ylim([-0.002 0.002]);
% xlim([6.9998 7.05]);

% plot(thetam_consigna.Time, thetam_consigna.Data, 'Color', orangee, 'LineWidth', 1.5);
% hold on;
% plot(thetam.Time, thetam.Data, 'Color', greenn, 'LineWidth', 1.5, 'LineStyle','--');
% plot(thetam_obs.Time, thetam_obs.Data, 'Color', purplee, 'LineWidth', 1.5, 'LineStyle',':');
% % title('Seguimiento de consigna de posición nula con perturbación, observador con acción integral');
% ylabel('Posición [rad]');
% xlabel('Tiempo [s]');
% legend('\theta^*_{m}','\theta_{m}','\theta_{obs}','Location','best');
% grid on;
% set(gca, 'FontSize', 12);
% % axis tight;
% ylim([-13e-4 0.2e-3]);
% xlim([6.9998 7.015]);




%%
% % Gráfica
% 
% % Configuración de la ventana
% defaultPos = get(groot, 'defaultFigurePosition');       % [left, bottom, width, height]
% newWidth = defaultPos(3) * 2.5;                           
% newheight = defaultPos(4) * 0.5;
% 
% % Creación de la figura
% figure('Position', [defaultPos(1:2) newWidth newheight]);
% 
% plot(v0.Time, v0.Data, 'Color', brownn, 'LineWidth', 1.5);
% 
% 
% title('v_{0s} (t)');
% ylabel('Tensión [V]');
% xlabel('Tiempo [s]');
% % legend('i_{ds} LTI', 'i_{ds} NL','Location','bestoutside');
% 
% grid on;
% set(gca, 'FontSize', 12);
% axis tight;
% 
% 
% % Guardar la figura en alta resolución (300 dpi) y formato PNG
% exportgraphics(gcf, ...
%     'C:/Users/Marti/Documents/GitHub/AyME-Proyecto-Final/Informe/Figuras/v0s_nl2.png', ...
%     'Resolution', 300, ...       % Alta resolución (300 ppp)
%     'BackgroundColor', 'white',...  % Fondo blanco (en lugar de transparente)
%     'ContentType', 'auto');     % Tipo de contenido automático (vectorial si es posible)
%%

% % Configuración de la ventana
% defaultPos = get(groot, 'defaultFigurePosition'); % [left, bottom, width, height]
% newbottom = defaultPos(2) * 0.3;
% newWidth = defaultPos(3) * 2;                           
% newheight = defaultPos(4) * 1.7;
% 
% % Creación de la figura
% figure('Position', [defaultPos(1) newbottom newWidth newheight]);
% 
% % Data extraida del modelo
% ome_nl = out2.get('omega_m_nl');
% torque = out2.get("T_m_nl");
% 
% % Graficar datos inicialmente para establecer límites
% plot(ome_nl.Data, torque.Data, 'Color', [0 0.4470 0.7410], 'LineWidth', 1.5);
% hold on;
% 
% % Definir límites de los ejes
% xlims = xlim;
% ylims = ylim;
% 
% x_margin = 15;
% y_margin = 0.05;
% 
% % Definir colores para cada cuadrante con transparencia
% colors = {[1 0.8 0.8 0.3], [0.8 1 0.8 0.3], [0.8 0.8 1 0.3], [1 1 0.8 0.3]};
% 
% % Dibujar los cuatro cuadrantes
% % Cuadrante I (x>0, y>0)
% patch([0 0 max(xlims) max(xlims)], [0 max(ylims) max(ylims) 0], colors{1}(1:3), ...
%     'EdgeColor', 'none', 'FaceAlpha', colors{1}(4));
% 
% % Cuadrante II (x<0, y>0)
% patch([min(xlims) min(xlims) 0 0], [0 max(ylims) max(ylims) 0], colors{2}(1:3), ...
%     'EdgeColor', 'none', 'FaceAlpha', colors{2}(4));
% 
% % Cuadrante III (x<0, y<0)
% patch([min(xlims) min(xlims) 0 0], [min(ylims) 0 0 min(ylims)], colors{3}(1:3), ...
%     'EdgeColor', 'none', 'FaceAlpha', colors{3}(4));
% 
% % Cuadrante IV (x>0, y<0)
% patch([0 0 max(xlims) max(xlims)], [min(ylims) 0 0 min(ylims)], colors{4}(1:3), ...
%     'EdgeColor', 'none', 'FaceAlpha', colors{4}(4));
% 
% % Configuración común para todos los textos
% text_props = {
%     'FontSize', 11, ...
%     'FontWeight', 'bold', ...
%     'Margin', 1, ...
%     'BackgroundColor', [1 1 1 0.7], ...
%     'EdgeColor', 'k', ...
%     'LineWidth', 0.5, ...
%     'Interpreter', 'none'  % ← Esto soluciona el problema
% };
% 
% % Textos para cada cuadrante (usando celdas para múltiples líneas)
% text(min(xlims)+x_margin, max(ylims)-y_margin, {'Cuadrante II', 'Frenado Regenerativo Inverso'}, ...
%     'HorizontalAlignment', 'center', 'VerticalAlignment', 'top', text_props{:});
% 
% text(max(xlims)-x_margin, max(ylims)-y_margin, {'Cuadrante I', 'Motorización Directa'}, ...
%     'HorizontalAlignment', 'center', 'VerticalAlignment', 'top', text_props{:});
% 
% text(min(xlims)+x_margin, min(ylims)+y_margin, {'Cuadrante III', 'Motorización Inversa'}, ...
%     'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom', text_props{:});
% 
% text(max(xlims)-x_margin, min(ylims)+y_margin, {'Cuadrante IV', 'Frenado Regenerativo Directo'}, ...
%     'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom', text_props{:});
% 
% % Volver a graficar los datos para que queden sobre los cuadrantes
% plot(ome_nl.Data, torque.Data, 'Color', bluee, 'LineWidth', 1.5);
% 
% % Elementos adicionales del gráfico
% xline(0, '--k', 'LineWidth', 1.5);
% yline(0, '--k', 'LineWidth', 1.5);
% 
% % Puntos destacados
% highlight_points = [
%     0, 0;
%     404.9, 0.01;
%     393.3, 0.06;
%     420.1, -0.05;
%     13.8, -0.05
% ];
% 
% point_labels = {
%     't=0.0 / t=0.1';
%     't=0.3';
%     't=0.5';
%     't=0.7';
%     't=0.9';
% };
% 
% % Graficar y etiquetar puntos
% plot(highlight_points(:,1), highlight_points(:,2), 'ro', ...
%     'MarkerSize', 8, 'LineWidth', 1.5);
% 
% % Añadir etiquetas de texto a cada punto
% for i = 1:size(highlight_points, 1)
%     text(highlight_points(i,1), highlight_points(i,2), point_labels{i}, ...
%         'FontSize', 11, ...
%         'FontWeight', 'bold', ...
%         'VerticalAlignment', 'bottom', ...
%         'HorizontalAlignment', 'right', ...
%         'Margin', 2);
% end
% 
% title('Curva paramétrica torque electromagnético vs. velocidad angular');
% % Etiquetas de ejes
% xlabel('\omega_m (t) [rad/s]', 'FontSize', 12);
% ylabel('T_{m} (t) [N.m]', 'FontSize', 12);
% 
% % Configuración final
% grid on;
% set(gca, 'FontSize', 12, 'Box', 'on');
% axis tight;
% hold off;
% 
% 
% %%
% % Guardar la figura en alta resolución (300 dpi) y formato PNG
% exportgraphics(gcf, ...
%     'C:/Users/Marti/Documents/GitHub/AyME-Proyecto-Final/Informe/Figuras/curva_parametrica.png', ...
%     'Resolution', 300, ...       % Alta resolución (300 ppp)
%     'BackgroundColor', 'white',...  % Fondo blanco (en lugar de transparente)
%     'ContentType', 'auto');     % Tipo de contenido automático (vectorial si es posible)