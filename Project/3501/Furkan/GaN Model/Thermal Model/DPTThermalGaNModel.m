%% Initial Configurations
clear all;
%% Device Parameters
Temp = 25; % Junction Temp in Celcius
Cgd = 1.748e-12;
Cgs = 160e-12;
Cds = 65.7e-12;

Ls = 62e-12;
Ld = 450e-12;
Lg = 0.65e-9;
Lss = 0.43e-9;

Rg = 1.5;
Rs = 3.6 * 0.238 * 0.82 * (1 - (-0.0135*(Temp - 25))) / 295;% + 1e-4;
Rd = (3.6/8) * (0.95*0.82*(1 - (-0.0135*(Temp - 25))) * 18.2 / 295);% + 1e-4;
Rss = 1e-3;

Rt = (0.9*0.95*0.82*18.2/295 + 3.6*0.238*0.82/295);
%% Circuit Parasitics
Ldc = 1.5e-9;
Lground = 5e-9;

%% Gate Driver
Lgex = 3e-9;
Ron = 10;
Roff = 1;
PulseAmplitude = 9;
fsw = 2000e3;
VpulseMax = 6;
VpulseMin = 0;
RiseTime = 9e-9;
FallTime = 16e-9;
%% Source parameters
Vdc = 100;
% Quantities in below are in percent
Dtop = 30; % duty cycle of top
Dbot = 30; % duty cycle of bot
DelayTop = 0;
DelayBot = 50;

%% Load parameters
LoadCurrent = 7.5;
Lload = 35e-3;
InitialCurrent = LoadCurrent;
%% Run Simulink
SampleTime = 5e-13;
model = 'DPTThermalGaNModelSLX';
load_system(model);
set_param(model, 'StopTime','0.55e-6')
sim(model);