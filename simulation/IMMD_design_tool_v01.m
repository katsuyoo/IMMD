%% IMMD DESIGN TOOL
%% M. U�ur
%% 2017
%%
% In this file, design of the IMMD system will be conducted. 
% Analytical design methods will be used with the aid of simulations.
% The relations between the blocks will be considered.
% The design is for the prototype on BAP Project.

%% SPECIFICATIONS
% Permanent Magnet Brushless DC Motor (PM-BLDC)
% Cooling: Forced air cooling
% Motor efficiency aim = 98 % 
% Power stage efficiency aim = 98 % 
% Average winding temperature rise: 130 C
% Hot spot temperature rise: 160 C
% Semiconductor temperature rise: 100 C
% Maximum winding temperature: 200 C


%% Fundamental blocks:
% Rotor
% Stator
% Inverter
% DC Link
% Rectifier
% Controller
% Heat sink

%% General Inputs
Pout_total = 8e3; % Watts
module = 4;
Nrated = 1500; % rpm
Trated = Pout_total/rated_speed; % Nm
Pout_module = Pout_total/module; % Watts
% Inverter configuration: 0 for H-bridge, 1 for 3-phase bridge
inverter_config = 0;
% winding configuration: 0 for distributed, 1 for concentrated
winding_config = 1;


%% Stator Parameters
slot_s = 48;
phase_s = 3;
pole_s = 8;
q_s = slot_s/phase_s/pole_s;
% slot per module
y_s = slot_s/module;
layer_s = 2;
zQ = 10; % number of turns per coil side

% Number of turns per phase per module
Nphm = layer_s*pole_s*zQ*q_s/2;

Do_s = 0.15; % m
Di_s = 0.1; % m
L_s = 0.1; % m

Surface_s = pi*Di_s*L_s; % m^2
Circum_s = pi*Di_s; % m
Volume_i = Di_s^2*L_s*pi/4; % m^3

pitch = 2/3;
pitch_angle = pitch*pi; % electrical radians
slot_angle = (pole_s/2)*2*pi/slot_s; % electrical radians
slot_pitch =Circum_s/slot_s; % m

% pitch factor
kp1 = sin(pitch_angle/2);

% distribution factor
kd1 = sin(q_s*slot_angle/2)/(q_s*sin(slot_angle/2));

% winding factor
kw1 = kp1*kd1;

% fill factor

% flux density and flux
Bgap = 0.7; % Tesla

flux_pp = 4*(Di_s/2)*L_s*Bgap/pole_s; % Weber


%% Rotor Parameters
pole_r = 8;
Do_r = 100; % mm
Di_r = 30; % mm

motor_eff = 0.9;

%% Inverter Parameters
ffund = 100; % Hz
pf = 0.87;
Vll = 400; % Volts
Nsync = 120*ffund/pole_s; % rpm
wsync = Nsync*2*pi/60; % rad/s
fsw = 100e3; % Hz
Pout_inv_module = Pout_module/motor_eff;
Iline = Pout_inv_module/(Vll*sqrt(2)); % Amps

% induced_voltage_per_module_per_phase
Erms = 4.44*ffund*flux_pp*kw1*Nphm; % Volts


%% DC Link parameters



%% Rectifier parameters




%% NOT USED RIGHT NOW

%% An example motor from Kollmorgen

% Datasheet parameters
% KBM(S)-45X02-X - B
rotor_pole = 10;
Prated = 7200; % W
Tstall_cont = 43.5; % Nm
Tstall_peak = 171; % Nm
Icont = 14.9; % Arms
Nrated = 2350; % rpm
Kt = 2.98; % Nm/Arms
Kb = 180; % Vrms/krpm
Rlinetoline = 0.76; %Ohms
Lm = 12; % mH
Vt_ll = 480; % V

% Back emf at rated speed (line-to-line)
Ea_ll = Kb*Nrated*1e-3; % V
Ea = Ea_ll/sqrt(3); % V
% Terminal voltage
Vt = Vt_ll/sqrt(3);
% Phase resistance
Ra = Rlinetoline/2; % Ohms
% Drive frequency

%%
% Datasheet parameters
% KBM(S)-88X00-X - B
rotor_pole = 46;
Prated = 5460; % W
Tstall_cont = 102; % Nm
Tstall_peak = 197; % Nm
Icont = 34; % Arms
Nrated = 1000; % rpm
Kt = 3.04; % Nm/Arms
Kb = 184; % Vrms/krpm
Rlinetoline = 0.165; %Ohms
Lm = 1.6; % mH
Vt_ll = 240; % V

% Back emf at rated speed (line-to-line)
Ea_ll = Kb*Nrated*1e-3; % V
Ea = Ea_ll/sqrt(3); % V
% Terminal voltage
Vt = Vt_ll/sqrt(3);
% Phase resistance
Ra = Rlinetoline/2; % Ohms

stator_slot = 36;
phase = 3;

% Drive frequency


