%Frame blocking and also applying hamming window to each frame
f_dur = 0.01;
f_len = f_dur*fs;
N = length(x);
num_frames = floor(N/f_len);

new_sig = zeros(f_len, num_frames);
count = 0;
% sum = 0;
frame_m = zeros(f_len, num_frames);
for k = 1:num_frames
    %extracting a frame of speech
    frame_m(:, k) = x((k-1)*f_len + 1 : f_len*k);
    
    
    %identifying non silent by finding frames with max amplitude
    %max_value = max(frame);
    if(max(frame_m(:, k)) > 0.003)
        %this frame is not silent
        count = count + 1;
        new_sig((count-1)*f_len + 1 : f_len*count) = frame_m(:, k).*hamming(f_len);
        
    end
end