function bm3dfun(a, path)

figure(1);
subplot(131);imshow(a,[]);title("ԭͼ");

% a=rgb2gray(a);
a=mat2gray(a); %ͼ�����Ĺ�һ��
b=fftshift(fft2(a));
c=abs(b);
d=abs(ifft2(ifftshift(b)));
I0=d;
% 'gw', 'g0', 'g1', 'g2'Ч����, 'g3', 'g4', 'g1w', 'g2w'Ч����, 'g3w', 'g4w'
noise_type =  'g2';
noise_var = 0.02; % Noise variance
seed = 0; % seed for pseudorandom noise realization
% Generate noise with given PSD
[~, PSD, ~] = getExperimentNoise(noise_type, noise_var, seed, size(I0));
y=BM3D(I0,PSD);
subplot(132);imshow(y);title("BM3D");
imwrite(y, 'bm3d.jpg')

y=histeq(y); % ֱ��ͼ���⻯
subplot(133);imshow(y);title("ֱ��ͼ���⻯");
imwrite(y, 'bm3d_histeq.jpg')
pause(2)  %�ȴ�2����ʾbm3dЧ������ɾ��
close all;
level(y, path);

end

