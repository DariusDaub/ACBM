function [sys,x0,str,ts,simStateCompliance] = pendelSFunc(t,x,u,flag)
%pendanSFunc S-function for making pendulum animation.

switch flag,
  %%%%%%%%%%%%%%%%%%
  % Initialization %
  %%%%%%%%%%%%%%%%%%
  case 0,
    [sys,x0,str,ts,simStateCompliance]=mdlInitializeSizes();
 
  %%%%%%%%%%
  % Update %
  %%%%%%%%%%
  case 2,
    sys=mdlUpdate(t,x,u);

  %%%%%%%%%%%%%
  % Terminate %
  %%%%%%%%%%%%%
  case 9,
    sys=mdlTerminate();

  %%%%%%%%%%%%%%%%
  % Unused flags %
  %%%%%%%%%%%%%%%%
  case { 1, 3, 4},
    sys = [];
    
  %%%%%%%%%%%%%%%%%%%%
  % Unexpected flags %
  %%%%%%%%%%%%%%%%%%%%
  otherwise
    error(message('simdemos:general:UnhandledFlag', num2str( flag )));
end

%end pendanSFunc

%
%=============================================================================
% mdlInitializeSizes
% Return the sizes, initial conditions, and sample times for the S-function.
%=============================================================================
%
function [sys,x0,str,ts,simStateCompliance]=mdlInitializeSizes()

%
% call simsizes for a sizes structure, fill it in and convert it to a
% sizes array.
%
sizes = simsizes;
sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 0;
sizes.NumInputs      = 2;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;
sys = simsizes(sizes);


% initialize the initial conditions
x0  = [];

% str is always an empty matrix
str = [];


% initialize the array of sample times, for the pendulum example,
% the animation is updated every 0.1 seconds
ts  = [0.05 0];

% specify that the simState for this s-function is same as the default
simStateCompliance = 'DefaultSimState';

%end mdlInitializeSizes

%
%=============================================================================
% mdlUpdate
% Update the pendulum animation.
%=============================================================================
%
function sys=mdlUpdate(t,x,u) %#ok<INUSL>

%Call the plot Func
pendelPlot(u(1), u(2),1);

sys = [];

%end mdlUpdate

%
%=============================================================================
% mdlTerminate
%=============================================================================
%
function sys=mdlTerminate() 
close all;

%Call the plot Func
pendelPlot(0, 0,0);
sys = [];

%end mdlTerminate
