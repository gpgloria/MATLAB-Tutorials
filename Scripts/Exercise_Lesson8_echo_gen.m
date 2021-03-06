clear all; close all; clc;
% load gong
% sound(y , Fs)

% Load splat which adds y and Fs to the workspace
load splat
% Call echo_gen to create the new audio data
output = echo_gen(y, Fs, 0.25, 0.6);
% The time between points is 1/Fs;
dt = 1/Fs;
% Plot the original sound
plot(0:dt:dt*(length(y)-1), y)
% Plot the new data to see visualize the echo
figure
plot(0:dt:dt*(length(output)-1), output)

sound (output, Fs) % Uncomment in MATLAB to listen to the new sound data

% function output = echo_gen(input, fs, delay, amp)
% [r,c] = size(input);
% extraEchoTime = round(delay*fs);
% echoSignal = zeros(r+extraEchoTime,1);
% addEchoSignal = echoSignal ;
% for i=1:r
%     echoSignal(extraEchoTime+i,1) = input(i,1)*amp ;
%     addEchoSignal(i) = input(i);
% end
% addEchoSignal = addEchoSignal + echoSignal ;
% range = abs(addEchoSignal) ;
% maxrange = max(range);
% if maxrange>1
%     addEchoSignal = addEchoSignal/maxrange;
% end
% output = addEchoSignal ;
% end
function output = echo_gen(s, Fs, delay, amp)
    % Find the time between points using Fs
    dt = 1/Fs;
    % Calculate the number of points for the given delay
    N = round(delay/dt);
    % Pad the original signal with zeros to make room for the echo
    s1 = [s; zeros(N, 1)];
    % Create an echo signal that starts with 0's
    s2 = [zeros(N, 1); s.*amp];
    % Add the echo to the original signal
    output = s1 + s2;
    % the abs of all values must be < 1. Rescale if necessary
    if max(abs(output)) > 1
        output = output./max(abs(output));
    end
    
    % Note: This only works with column vectors - can you make the
    % function more robust so that it works with column or row vectors?
end