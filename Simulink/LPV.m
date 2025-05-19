% Modelo LPV

% Matriz A 
A = zeros(6);
A(1,2) = 1;

A(2,2) = -b_eq/J_eq;
A(2,3) = (3/2)*P_p*(L_d - L_q)*I_dso/J_eq;
A(2,4) = (3/2)*P_p*(L_d - L_q)*I_qso/J_eq;

A(3,2) = -P_p*(lambda_m + L_d*I_dso)/L_q;
A(3,3) = -R_s/L_q;
A(3,4) = -L_d*P_p*Omega_m/L_q;
A(3,6) = -R_s_ref*alpha_Cu*I_qso/L_q;

A(4,2) = L_q*P_p*I_qso/L_d;
A(4,3) = L_q*P_p*Omega_m/L_d;
A(4,4) = -R_s/L_d;
A(4,6) = -R_s_ref*alpha_Cu*I_dso/L_q;

A(5,5) = -R_s/L_ls;
A(5,6) = -R_s_ref*alpha_Cu*I_0so/L_q;

A(6,3) = 3*R_s*I_qso/C_ts;
A(6,4) = 3*R_s*I_dso/C_ts;
A(6,5) = 6*R_s*I_0so/C_ts;
A(6,6) = (3/2)*R_s_ref*alpha_Cu*(I_qso^2 + I_dso^2 + 2*I_0so^2)/C_ts - 1/(C_ts*R_ts_amb);
A
