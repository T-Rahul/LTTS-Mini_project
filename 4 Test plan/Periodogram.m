%Periodogram
Y = abs(fft(new_sig, 512));
f_bin = 0:f_len-1;
f_hzs = f_bin*fs/f_len;
N_2 = ceil(f_len/2);
Power_Spectrum=(Y(1:N_2, :).*Y(1:N_2,:))/f_len;
figure
plot(Power_Spectrum)
title('Periodogram')
