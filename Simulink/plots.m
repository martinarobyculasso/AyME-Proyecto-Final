
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
% ia = out.get('corriente_a_nl');
% ib = out.get('i_b');
% ic = out.get('i_c');

% iq = out.get('corriente_q_nl');
% id = out.get('corriente_d_nl');
% i0 = out.get('corriente_0_nl');
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
thetam = out.get('thetamd');
thetam_consigna = out.get('consigna_t_d');
thetam_obs = out.get('theta_obsd');
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

% t = [0  0.1   4.9   5  10 10.1   14.9  15  20];            
% y = [0; 1.25; 1.25; 0; 0; -1.25; -1.25; 0;  0];   
% yy = y*120;
% 
% t2 = [0  0    5     5   10  10    15    15  20];  
% y2 = [0; 1.25; 1.25; 0; 0; -1.25; -1.25; 0;  0];
% yy2 =  y2*120;

% Gráfica

% Configuración de la ventana
defaultPos = get(groot, 'defaultFigurePosition');       % [left, bottom, width, height]
newWidth = defaultPos(3) * 1;     % 2.5    % 2                    
newheight = defaultPos(4) * 1;    % 0.5    % 1

% % Creación de la figura
figure('Position', [defaultPos(1:2) newWidth newheight]);
% plot(t,yy, 'Color', orangee, 'LineWidth', 1.5);
% hold on;
% plot(t2,yy2, 'Color', orangee, 'LineWidth', 1.5, 'LineStyle','--');
% % plot(w2.Time,tm2.Data, 'Color', pinkk, 'LineWidth', 1.5);
% % plot(w3.Time,tm3.Data, 'Color', brownn, 'LineWidth', 1.5);
% title('\omega_{m}^* (t)');
% legend('Nuevo perfil','Perfil anterior','Location','best');
% ylabel('Velocidad [rad/s]');
% xlabel('Tiempo [s]');
% % axis tight
% xlim([-0.1 5.1]);
% ylim([-1 160]);
% % xticks([0:0.1:0.1, 4.9:0.1:5]);
% % xtickangle(90);  % o el ángulo que prefieras (en grados)
% grid on;
% set(gca, 'FontSize', 12);

% sgtitle('Nueva consigna de posición para el eje mecánico');
% subplot(1,2,1);
% plot(thetam_consigna.Time, thetam_consigna.Data, 'Color', orangee, 'LineWidth', 1.5);
% hold on
% plot(comp.Time, comp.Data, 'Color', orangee, 'LineWidth', 1.5, 'LineStyle','--');
% title('Consigna de velocidad articular, \omega_l*(t)');
% ylabel('Posición [rad]');
% xlabel('Tiempo [s]');
% legend('\theta_{m}','\theta_{obs}','Location','best');
% grid on;
% set(gca, 'FontSize', 12);
% axis tight;
% ylim([-0.002 0.002]);
% 
% subplot(1,2,2);
% plot(thetam_consigna.Time, thetam_consigna.Data, 'Color', orangee, 'LineWidth', 1.5);
% hold on
% plot(comp.Time, comp.Data, 'Color', orangee, 'LineWidth', 1.5, 'LineStyle','--');
% title('Consigna de velocidad para el eje mecánico, \omega_m*(t)');
% ylabel('Posición [rad]');
% xlabel('Tiempo [s]');
% legend('Nuevo perfil','Perfil anterior','Location','best');

% xlim([4.8 5.15]);
% ylim([710 745]);

val = 14.9984 + sampling;

stairs(thetam_consigna.Time,thetam_consigna.Data, 'Color', orangee, 'LineWidth', 1.5);
hold on;
plot(thetam.Time,thetam.Data, 'Color', greenn, 'LineWidth', 1.5, 'LineStyle','--');
stairs(thetam_obs.Time,thetam_obs.Data, 'Color', purplee, 'LineWidth', 1.5,'LineStyle',':');
% xline(14.9984);
% xline(val);
title('\theta_m (t)');
legend('\theta^*_{m}','\theta_{m}','\theta_{obs}','Location','best');
ylabel('Posición [rad]');
xlabel('Tiempo [s]');
grid on;
set(gca, 'FontSize', 12);
axis tight;
xlim([14.998 14.999]);
ylim([-0.3e-3 4e-3]);
% xlim([6.9998 7.015]);

% % Guardar la figura en alta resolución (300 dpi) y formato PNG
% exportgraphics(gcf, ...
%     'C:/Users/Marti/Desktop/cdiscreto_pos_cerca.png', ...
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
