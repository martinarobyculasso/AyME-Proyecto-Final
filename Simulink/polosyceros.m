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
% % Definir los valores de T para los que se calcularán los polos
% T_values = 20:10.5:115; % Los valores de T van de 20 a 115 con un paso de 5°C
% p_real=zeros(3,length(T_values));
% p_im=zeros(3,length(T_values));
% 
% % Bucle para calcular los polos para cada valor de T
% for i = 1:length(T_values)
%     T = T_values(i);
% 
%     % Calcular R_s para el valor de T
%     R_ss = R_s_ref * (1 + alpha_Cu * (T - T_s_ref));
% 
%     % Cálculo de los coeficientes a, b, c
%     a = J_eq * L_q;
%     b = b_eq* L_q + J_eq * R_ss;
%     c = b_eq * R_ss + 1.5 * (P_p * lambda_m)^2;
% 
%     % Numerador y denominador
%     num = -(1 / r) * [L_q R_ss];
%     den = [a b c];
%     den = conv([1 0], den); 
% 
%     % Crear la función de transferencia
%     G = tf(num, den);
% 
%     % Calcular los polos
%     poles = pole(G);
%     p_real(:,i)=real(poles);
%     p_im(:,i)=imag(poles);
% end
% % Graficar los polos en el plano complejo
% % Configuración de la ventana
% defaultPos = get(groot, 'defaultFigurePosition'); % [left, bottom, width, height]
% newbottom = defaultPos(2) * 0.3;
% newWidth = defaultPos(3) * 1.7;                           
% newheight = defaultPos(4) * 1.7;
% 
% % Creación de la figura
% figure('Position', [defaultPos(1) newbottom newWidth newheight]);
% hold on;
% 
% 
% % Colores para cada valor de T
% colors = jet(size(p_real, 2));  % Utiliza un color diferente para cada temperatura
% 
% % Graficar los polos para cada valor de T
% for i = 1:size(p_real, 2)
%     % Obtener la parte real e imaginaria para la columna i
%     real_part = p_real(:, i);
%     imag_part = p_im(:, i);
% 
%     % Graficar los polos
%      plot(real_part, imag_part, 'x', 'Color', colors(i,:), 'MarkerSize', 10, 'LineWidth', 2, 'DisplayName', ['T = ', num2str(10.5 * (i - 1) + 20), '°C']);
% 
% end
% 
% % Añadir etiquetas y leyenda
% xlabel('Parte Real');
% ylabel('Parte Imaginaria');
% title('Polos del sistema LTI para diferentes valores de T_{s}^{\circ}');
% legend('show');
% grid on;
% set(gca, 'FontSize', 12);
% hold off;

%%
% Definir los valores de T
T_min = 20;
T_max = 115;
T_values = linspace(T_min, T_max, 6); % 6 puntos entre T_min y T_max
% colors = jet(length(T_values));

% Configurar figura
figure('Position', [100 100 800 600]);
hold on;

% Crear celdas para almacenar sistemas
systems = cell(1, length(T_values));

% Calcular todas las funciones de transferencia
for i = 1:length(T_values)
    T = T_values(i);
    R_ss = R_s_ref * (1 + alpha_Cu * (T - T_s_ref));
    
    a = J_eq * L_q;
    b = b_eq* L_q + J_eq * R_ss;
    c = b_eq * R_ss + 1.5 * (P_p * lambda_m)^2;
    
    num = -(1/r) * [L_q R_ss];
    den = conv([1 0], [a b c]);
    
    systems{i} = tf(num, den);
end

% Graficar todos los sistemas juntos
pzmap(systems{:});

% Personalizar el gráfico
ax = gca;
h = findobj(ax, 'Type', 'Line');

% Configuración de marcadores
markerSize = 12;
lineWidth = 2;

% Prepara la leyenda
legendEntries = cell(1, length(T_values));

% Asignar colores y tamaños (maneja correctamente el número de objetos)
colorIndex = 1;
for i = 1:length(h)
    % Solo modificar líneas que representan polos/ceros (no ejes u otros)
    if ~isempty(h(i).XData)
        set(h(i), 'MarkerSize', markerSize, 'LineWidth', lineWidth);
        
        % Avanzar el color cada 4 objetos (3 polos + 1 cero por sistema)
        if mod(i, 4) == 0
            colorIndex = colorIndex + 1;
        end
    end
end

wn_target = 174.10; % o el valor que quieras

% Solo el semiplano izquierdo: ángulos de pi/2 a 3*pi/2
theta = linspace(pi/2, 3*pi/2, 300);
x_circle = wn_target * cos(theta);  % cos entre pi/2 y 3pi/2 da valores negativos
y_circle = wn_target * sin(theta);

% Dibujar la curva
plot(x_circle, y_circle, 'k--');

% Crear entradas de leyenda
for i = 1:length(T_values)
    legendEntries{i} = sprintf('T = %.1f°C', T_values(i));
end

% Configuraciones finales
title('Mapa de polos y ceros del sistema LTI para diferentes valores de T_{s}^{\circ}');
xlabel('Parte Real');
ylabel('Parte Imaginaria');
legend(legendEntries, 'Location', 'best');
grid on;
set(gca, 'FontSize', 12);
xlim([-250, 0]);  % Ajustá los límites según tus polos

hold off;

% % Guardar la figura en alta resolución (300 dpi) y formato PNG
% exportgraphics(gcf, ...
%     'C:/Users/Marti/Documents/GitHub/AyME-Proyecto-Final/Informe/Figuras/polos_temp.png', ...
%     'Resolution', 300, ...       % Alta resolución (300 ppp)
%     'BackgroundColor', 'white',...  % Fondo blanco (en lugar de transparente)
%     'ContentType', 'auto');     % Tipo de contenido automático (vectorial si es posible)
% 



