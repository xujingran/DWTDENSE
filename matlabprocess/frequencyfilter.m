f = imread('king.png');
j = fft2(f);
k = fftshift(j);
L = log(1+abs(k));
subplot(121),imshow(f);
subplot(122),imshow(L,[]);
% I=rgb2gray(f);
% I=im2double(I);
% F=fft2(I);
% F=fftshift(F);
% F=abs(F);
% T=log(F+1);
% figure;
% imshow(T,[]);

%[c, s] = wavefast(f,1, 'sym4');
%figure;
%wavedisplay(c,s,-6);

% f = double(f);
% N = 3;
% [c,s] = wavedec2(f,N,'db1');
% a1 = wrcoef2('a',c,s,'db1',1);
% a2 = wrcoef2('a',c,s,'db1',2);
% a3 = wrcoef2('a',c,s,'db1',3);
