function bm3dfun(a, path)

figure(1);
subplot(131);imshow(a,[]);title("原图");

% a=rgb2gray(a);
a=mat2gray(a); %图像矩阵的归一化
b=fftshift(fft2(a));
c=abs(b);
d=abs(ifft2(ifftshift(b)));
I0=d;
% 'gw', 'g0', 'g1', 'g2'效果好, 'g3', 'g4', 'g1w', 'g2w'效果好, 'g3w', 'g4w'
noise_type =  'g2';
noise_var = 0.02; % Noise variance
seed = 0; % seed for pseudorandom noise realization
% Generate noise with given PSD
[~, PSD, ~] = getExperimentNoise(noise_type, noise_var, seed, size(I0));
y=BM3D(I0,PSD);
subplot(132);imshow(y);title("BM3D");
imwrite(y, 'bm3d.jpg')

y=histeq(y); % 直方图均衡化
subplot(133);imshow(y);title("直方图均衡化");
imwrite(y, 'bm3d_histeq.jpg')
pause(2)  %等待2秒显示bm3d效果，可删除
close all;
level(y, path);

end

