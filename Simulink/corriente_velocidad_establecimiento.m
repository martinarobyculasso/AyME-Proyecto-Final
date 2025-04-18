clc; 
out2 = sim('modelo_nl_control_nl_2cVI_sim');
omega_m_nl = out2.get('corriente_q_nl'); % cambiar lo que se quiera ver
t = omega_m_nl.Time;
velocidad = omega_m_nl.Data;

puntos = [0.1, 0.3, 0.5, 0.7, 0.9];
[~, idx] = arrayfun(@(tp) min(abs(t - tp)), puntos);
ventana = 0.1; % Aumenté la ventana para capturar transitorios largos

info_respuestas = struct();

for i = 1:length(puntos)
    % Define el segmento usando índices
    ventana_muestras = round(ventana / (t(2) - t(1)));
    idx_segmento = max(1, idx(i) - ventana_muestras) : min(length(t), idx(i) + ventana_muestras);
    
    t_segmento = t(idx_segmento);
    velocidad_segmento = velocidad(idx_segmento);
    
    y_inicial = velocidad_segmento(1);
    y_final = velocidad_segmento(end);
    
    if abs(y_final - y_inicial) < 1e-6
        respuesta_normalizada = zeros(size(velocidad_segmento));
    else
        respuesta_normalizada = (velocidad_segmento - y_inicial) / (y_final - y_inicial);
    end
    
    info = stepinfo(respuesta_normalizada, t_segmento, 'SettlingTimeThreshold', 0.05);
    
    info_respuestas(i).Tiempo = puntos(i);
    info_respuestas(i).AmplitudFinal = y_final;
    info_respuestas(i).RiseTime = info.RiseTime;
    info_respuestas(i).SettlingTime = info.SettlingTime;
    info_respuestas(i).Overshoot = info.Overshoot;

end

% Convertir a tabla
tabla_resultados = struct2table(info_respuestas);

% Mostrar la tabla con formato
disp(tabla_resultados);