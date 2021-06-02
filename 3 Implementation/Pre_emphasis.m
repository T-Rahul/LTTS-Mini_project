%Pre emphasis
[data, fs] = audioread('Ra2.m4a');
% st = input('Start time =');
% et = input('End time =');
% r = st*fs+1:et*fs;
t = 0:1/fs:(length(data)-1)/fs;
figure
subplot(2, 1, 1)
plot(t,data)
xlabel('time (s)');
title('Audio Signals')
hold on

preemp = [1 -0.95];
x = filter(preemp, 1, data);
plot(t,x, 'm')
xlabel('time (s)');
% title('Pre Emphasized signal', 'm')
subplot(2, 1, 2)
plot(abs(fft(data)))
xlabel('frequency (Hz)')
title('In Frequency domain')
hold on
plot(abs(fft(x)), 'm')