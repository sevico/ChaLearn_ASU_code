function MSR_img = retinex(img)
I= img;

Ir=I(:,:,1); 
Ig=I(:,:,2); 
Ib=I(:,:,3); 

%%%%%%%%%%�趨�������%%%%%% 
G = 100; 
b = -30; 
alpha = 125; 
beta = 46; 
Ir_double=double(Ir); 
Ig_double=double(Ig); 
Ib_double=double(Ib); 

%%%%%%%%%%�趨��˹����%%%%%% 
sigma_1=15;   %������˹�� 
sigma_2=80; 
sigma_3=250; 
[x y]=meshgrid((-(size(Ir,2)-1)/2):(size(Ir,2)/2),(-(size(Ir,1)-1)/2):(size(Ir,1)/2));   
gauss_1=exp(-(x.^2+y.^2)/(2*sigma_1*sigma_1));  %�����˹���� 
Gauss_1=gauss_1/sum(gauss_1(:));  %��һ������ 
gauss_2=exp(-(x.^2+y.^2)/(2*sigma_2*sigma_2)); 
Gauss_2=gauss_2/sum(gauss_2(:)); 
gauss_3=exp(-(x.^2+y.^2)/(2*sigma_3*sigma_3)); 
Gauss_3=gauss_3/sum(gauss_3(:)); 
 
%%%%%%%%%%��R��������%%%%%%% 
% MSR���� 
Ir_log=log(Ir_double+1);  %��ͼ��ת���������� 
f_Ir=fft2(Ir_double);  %��ͼ����и���Ҷ�任,ת����Ƶ���� 

%sigam=15�Ĵ����� 
fgauss=fft2(Gauss_1,size(Ir,1),size(Ir,2)); 
fgauss=fftshift(fgauss);  %��Ƶ�������Ƶ���� 
Rr=ifft2(fgauss.*f_Ir);  %�������任�ؿ����� 
min1=min(min(Rr)); 
Rr_log= log(Rr - min1+1); 
Rr1=Ir_log-Rr_log;  

%sigam=80 
fgauss=fft2(Gauss_2,size(Ir,1),size(Ir,2)); 
fgauss=fftshift(fgauss); 
Rr= ifft2(fgauss.*f_Ir); 
min1=min(min(Rr)); 
Rr_log= log(Rr - min1+1); 
Rr2=Ir_log-Rr_log;  

 %sigam=250 
fgauss=fft2(Gauss_3,size(Ir,1),size(Ir,2)); 
fgauss=fftshift(fgauss); 
Rr= ifft2(fgauss.*f_Ir); 
min1=min(min(Rr)); 
Rr_log= log(Rr - min1+1); 
Rr3=Ir_log-Rr_log; 

Rr=0.33*Rr1+0.34*Rr2+0.33*Rr3;   %��Ȩ��� 
MSR1 = Rr;
SSR1 = Rr2;
%����CR 
CRr = beta*(log(alpha*Ir_double+1)-log(Ir_double+Ig_double+Ib_double+1)); 

%SSR:
min1 = min(min(SSR1)); 
max1 = max(max(SSR1)); 
SSR1 = uint8(255*(SSR1-min1)/(max1-min1)); 

%MSR
min1 = min(min(MSR1)); 
max1 = max(max(MSR1)); 
MSR1 = uint8(255*(MSR1-min1)/(max1-min1)); 

%MSRCR 
Rr = G*(CRr.*Rr+b); 
min1 = min(min(Rr)); 
max1 = max(max(Rr)); 
Rr_final = uint8(255*(Rr-min1)/(max1-min1)); 
 

%%%%%%%%%%��g��������%%%%%%% 
Ig_double=double(Ig); 
Ig_log=log(Ig_double+1);  %��ͼ��ת���������� 
f_Ig=fft2(Ig_double);  %��ͼ����и���Ҷ�任,ת����Ƶ���� 

fgauss=fft2(Gauss_1,size(Ig,1),size(Ig,2)); 
fgauss=fftshift(fgauss);  %��Ƶ�������Ƶ���� 
Rg= ifft2(fgauss.*f_Ig);  %�������任�ؿ����� 
min2=min(min(Rg)); 
Rg_log= log(Rg-min2+1); 
Rg1=Ig_log-Rg_log;  %sigam=15�Ĵ����� 

fgauss=fft2(Gauss_2,size(Ig,1),size(Ig,2)); 
fgauss=fftshift(fgauss); 
Rg= ifft2(fgauss.*f_Ig); 
min2=min(min(Rg)); 
Rg_log= log(Rg-min2+1); 
Rg2=Ig_log-Rg_log;  %sigam=80 


fgauss=fft2(Gauss_3,size(Ig,1),size(Ig,2)); 
fgauss=fftshift(fgauss); 
Rg= ifft2(fgauss.*f_Ig); 
min2=min(min(Rg)); 
Rg_log= log(Rg-min2+1); 
Rg3=Ig_log-Rg_log;  %sigam=250 

Rg=0.33*Rg1+0.34*Rg2+0.33*Rg3;   %��Ȩ��� 
SSR2 = Rg2;
MSR2 = Rg;
%����CR 
CRg = beta*(log(alpha*Ig_double+1)-log(Ir_double+Ig_double+Ib_double+1)); 

%SSR:
min2 = min(min(SSR2)); 
max2 = max(max(SSR2)); 
SSR2 = uint8(255*(SSR2-min2)/(max2-min2)); 

%MSR
min2 = min(min(MSR2)); 
max2 = max(max(MSR2)); 
MSR2 = uint8(255*(MSR2-min2)/(max2-min2)); 


 
%%%%%%%%%%��B��������ͬR����%%%%%%% 
Ib_double=double(Ib); 
Ib_log=log(Ib_double+1); 
f_Ib=fft2(Ib_double); 

fgauss=fft2(Gauss_1,size(Ib,1),size(Ib,2)); 
fgauss=fftshift(fgauss); 
Rb= ifft2(fgauss.*f_Ib); 
min3=min(min(Rb)); 
Rb_log= log(Rb-min3+1); 
Rb1=Ib_log-Rb_log; 

fgauss=fft2(Gauss_2,size(Ib,1),size(Ib,2)); 
fgauss=fftshift(fgauss); 
Rb= ifft2(fgauss.*f_Ib); 
min3=min(min(Rb)); 
Rb_log= log(Rb-min3+1); 
Rb2=Ib_log-Rb_log; 


fgauss=fft2(Gauss_3,size(Ib,1),size(Ib,2)); 
fgauss=fftshift(fgauss); 
Rb= ifft2(fgauss.*f_Ib); 
min3=min(min(Rb)); 
Rb_log= log(Rb-min3+1); 
Rb3=Ib_log-Rb_log; 

Rb=0.33*Rb1+0.34*Rb2+0.33*Rb3; 

%����CR 
CRb = beta*(log(alpha*Ib_double+1)-log(Ir_double+Ig_double+Ib_double+1)); 
SSR3 = Rb2;
MSR3 = Rb;
%SSR:
min3 = min(min(SSR3)); 
max3 = max(max(SSR3)); 
SSR3 = uint8(255*(SSR3-min3)/(max3-min3));

%MSR
min3 = min(min(MSR3)); 
max3 = max(max(MSR3)); 
MSR3 = uint8(255*(MSR3-min3)/(max3-min3));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ssr = cat(3,SSR1,SSR2,SSR3);
msr = cat(3,MSR1,MSR2,MSR3);
% msrcr=cat(3,Rr_final,Rg_final,Rb_final);  %����ͨ��ͼ��ϲ� 

% subplot(2,2,1);imshow(I);title('ԭͼ')  %��ʾԭʼͼ�� 
% subplot(2,2,2);imshow(ssr);title('SSR')
% subplot(2,2,3);imshow(msr);title('MSR')
% subplot(2,2,4);imshow(msrcr);title('MSRCR')  %��ʾ������ͼ�� 
MSR_img = msr;