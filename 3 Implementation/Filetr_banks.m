%Filter banks
num_coeff = 13;
f_low = 300;
f_high = 22050; 
m_low = 1125*log(1+f_low/700);
m_high = 1125*log(1+f_high/700);
band_len = (m_high-m_low)/(num_coeff+1);
mel = linspace(m_low, m_high, num_coeff+2);
f_scale = 700*(exp(mel/1125)-1);
f_step = floor((513)*f_scale/fs);

HMatrix = zeros(num_coeff,221);
for k=1:221
    for m=1:num_coeff
        if(k<f_step(m))
            HMatrix(m,k)=0;
        elseif (f_step(m)<=k && k<=f_step(m+1))
            HMatrix(m,k)=(k-f_step(m))/(f_step(m+1)-f_step(m));
        elseif(f_step(m+1)<=k && k<=f_step(m+2))
             HMatrix(m,k)=(f_step(m+2)-k)/(f_step(m+2)-f_step(m+1));
        elseif (k>f_step(m+2))
             HMatrix(m,k)=0;
        end
    end
end
figure

plot(HMatrix')
xlabel('FFT point')
title('Complete Mel Filterbank')
r = HMatrix*Power_Spectrum;

figure
s = sum(r, 2);
m1 = (s-mean(s))/std(s);
stem(m1);
title('MFCC coefficients')