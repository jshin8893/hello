%% Van der Pol Oscillator
% This example shows how to model the second-order Van der Pol (VDP)
% differential equation in Simulink®. In dynamics, the VDP oscillator is
% non-conservative and has nonlinear damping. At high amplitudes, the
% oscillator dissipates energy. At low amplitudes, the oscillator generates
% energy. The oscillator is given by this second-order differential
% equation:
%  
% $$\frac{d^2 x}{dt^2} - \mu\left( 1- x^2 \right) \frac{dx}{dt} + x = 0$$
%
% where:
% 
% * x is position as a function of time.
% * $$\mu$$ is damping.        
% 
% To express the second-order differential equation in state-space format, 
% define $${x}_1 = x$$. This state-space representation is included in the
% model as $${x}_1$$ and $${x}_2$$.
%
% $${x}_1^{'}={x}_2$$
%
% $${x}_2^{'}=-{x}_1 + \mu\left( 1- {{x}_1}^2 \right){x}_2$$
% 
% where :
% 
% * $${x}_1^{'} = \frac{dx}{dt}$$
%
% * $${x}_2^{'} = \frac{d^2 x}{dt^2}$$
%
% The VDP oscillator is used in physical and biological sciences, including
% electric circuits.

% Copyright 2024 The MathWorks, Inc.

%%
open_system('vdp');
%% Simulate with Mu = 1
% When $$\mu = 1$$, the VDP oscillator has nonlinear damping.  
set_param('vdp/Mu','Gain','1')
sim('vdp');
open_system('vdp/Scope');

%% Simulate with Mu = 0
% When $$\mu = 0$$, the VDP oscillator has no damping. Energy is conserved in
% this simple harmonic oscillator. The equation becomes:
%
% $$\frac{d^2 x}{dt^2} + x = 0$$
%
set_param('vdp/Mu','Gain','0')
sim('vdp');
open_system('vdp/Scope');