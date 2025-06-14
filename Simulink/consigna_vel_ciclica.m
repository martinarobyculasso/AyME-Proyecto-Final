
% Ciclo base
t_base = [0  0.1   4.9   5  10 10.1   14.9  15  20];              
y_base = [0; 1.25; 1.25; 0; 0; -1.25; -1.25; 0;  0]; 

% Parámetros
T_total = 600;        % Duración total
T_cycle = 20;         % Duración de un ciclo
n_cycles = floor(T_total / T_cycle);  % Cantidad de repeticiones

% Inicialización de vectores
t_full = [];
y_full = [];

% Construcción del timeseries repetido
for i = 0:(n_cycles-1)
    t_full = [t_full, t_base + i*T_cycle];
    y_full = [y_full; y_base];
end

% Crear objeto timeseries
duc = timeseries(y_full, t_full');
