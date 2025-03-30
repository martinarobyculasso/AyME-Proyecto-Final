parametros;

A=[0 1 0
    0 -b_eq/J_eq (3*P_p*lambda_m)/(2*J_eq)
    0 -P_p*lambda_m/L_q -R_s/L_q
    ];

B = [0; 0; 1/L_q]; % Ajustá según tu sistema

C_pos = [1 0 0];    % Salida: posición
C_vel = [0 1 0];    % Salida: velocidad

%% Observabilidad desde la posición
O_pos = obsv(A, C_pos);
det_O_pos = det(O_pos);
rank_O_pos = rank(O_pos);

%% Observabilidad desde la velocidad
O_vel = obsv(A, C_vel);
det_O_vel = det(O_vel);
rank_O_vel = rank(O_vel);

%% Controlabilidad
Ctrb = ctrb(A, B);
rank_Ctrb = rank(Ctrb);

%% Mostrar resultados
fprintf("\n%s\n", repmat('=',1,40));
fprintf(" Análisis de Observabilidad\n");
fprintf("%s\n", repmat('=',1,40));

fprintf("\nDesde la posición:\n");
disp(round(O_pos, 4))
fprintf("Determinante: %.4e\n", det_O_pos);
fprintf("Rango: %d\n", rank_O_pos);

fprintf("\nDesde la velocidad:\n");
disp(round(O_vel, 4))
fprintf("Determinante: %.4e\n", det_O_vel);
fprintf("Rango: %d\n", rank_O_vel);

fprintf("\n%s\n", repmat('=',1,40));
fprintf(" Análisis de Controlabilidad\n");
fprintf("%s\n", repmat('=',1,40));
disp(round(Ctrb, 4))
fprintf("Rango: %d\n", rank_Ctrb);
fprintf("%s\n", repmat('=',1,40));