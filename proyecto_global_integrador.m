%% Valores sistema mecánico
% Carga mecánica, tren de transmisión y subsistema mecánico de la máquina
% eléctrica.

% Carga mecánica
J_l = 0.2520; %kg*m²
delta_Jl = 0.1260; %Variación para valor máximo o valor mínimo de inercia
b_l = 0; %N*m/(rad/s)
delta_bl = 0.0630; %Variación para valor máximo o mínimo de viscosidad
T_l = 0; %N*m (función escalón)
delta_Tl = 1.57; %Variación para valor máximo o mínimo de torque de carga

% Arreglo con los rangos de los parámetros
Jl_range = [J_l-delta_Jl  J_l  J_l+delta_Jl];
bl_range = [b_l-delta_bl  b_l  b_l+delta_bl];


% Tren de transmisión

r = 314.3008; %Relación de transmisión
n_q = 21; %rpm
qd_nom = 2.2; %rad/s
T_qnom = 7.26; %N*m
T_qmax = 29.42; %N*m

%Subsistema mecánico de la máquina eléctrica

J_m = 3.1e-6; %kg*m²
b_m = 1.5e-5; %N*m/(rad/s)

%Parámetros equivalentes

J_eq = J_m + J_l/r^2;
b_eq = b_m + b_l/r^2;

% Arreglo con los rangos de los parámetros equivalentes
Jeq_range = J_m + Jl_range/r^2;
beq_range = b_m + bl_range/r^2;

%% Subsistema electromecánico

P_p = 3; %Pares(6 polos) - Pares de polos
lambda_m = 0.01546; %Wb*t ó V/(rad/s) - Flujo magnético equivalente de imanes concatenado por espiras del bobinado de estator
L_q = 5.8e-3; %H - Inductancia de estator eje en cuadratura
L_d = 6.6e-3; %H - Inductancia de estator eje directo
L_ls = 0.8e-3; %H - Inductancia de dispersión de estator
R_s = 1.02; %ohm - Resistencia de estator a 40°C
%R_s = 1.32; %ohm - Resistencia de estator a 115°C
%R_s = R_sREF * (1 + alpha_Cu * (T_s - T_sREF))
R_s_range = [1.02 1.32];

%% Subsistema térmico

alpha_Cu = 3.9e-3; %1/°C
C_ts = 1.091; %W/(°C/s) - Capacitancia térmica de estator (almacenamiento interno)
R_tsamb = 55; %55°C/W - Resistencia térmica estator-ambiente (disipación al ambiente)

%% Especificaciones de operación

w_mnom = 691.15; %rad/s - Velocidad nominal del rotor
V_slnom = 24; %Vca - Tensión nominal de línea
V_sfnom = V_slnom / (3^0.5); %Tensión nominal de fase
I_snom = 0.4; %Aca - Corriente nominal (régimen continuo)
I_smax = 2.0; %Aca - Corriente máxima (corta duración, aceleración)
T_smax = 115; %°C - Temperatura máxima de bobinado estator
T_ambmax = 40; %°C - Temperatura ambiente máxima


%% Modulador de torque

Rp_q = 29; %Ohm
Rp_d = 33; %Ohm
Rp_0 = 4; %Ohm


%% Controlador PID

n = 2.5;
w_pos = 800; % rad/s

b_a = J_eq * n * w_pos; % N*m/(rad/s)
k_sa = J_eq * n * w_pos^2; % N*m/rad
k_sia = J_eq * w_pos^3; % N*m(rad*s)