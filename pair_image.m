clear all
clc
close all
n = 0;
num_z=20;
num_cols =7;  
num_rows =8; 

% CalSlide=imread('470laser_9_13_19_20X_3645.tif');
% CalSlide=(double(CalSlide));
% CalSlide  = CalSlide./65536;
F3 = double(ones(2048));
u1 = 1025:-65:1;
u1 = sort(u1);
u1(end) = [];
u2 = 1025:65:2048;
u2(1) = [];
u = [u1 u2];
for i = 1:length(u)
    F3(:,(u(i)-5):(u(i)+5))=0;
end


for j = 0:num_cols-1 
for k = 0:num_rows-1
for depth =0:num_z-1 
  n = n+1;  
        eval(['I1 = double(imread(''Phantom_1_' num2str(j) '_' num2str(k) '_' num2str(depth) '_1.tif''));'])
        eval(['I2 = double(imread(''Phantom_1_' num2str(j) '_' num2str(k) '_' num2str(depth) '_2.tif''));'])
        eval(['I3 = double(imread(''Phantom_1_' num2str(j) '_' num2str(k) '_' num2str(depth) '_3.tif''));'])
        eval(['sectioned = double(imread(''Phantom_1_' num2str(j) '_' num2str(k) '_' num2str(depth) '.tif''));'])
     

        I1 = I1./(mean(mean(I1)));
        I2 = I2./(mean(mean(I2)));
        I3 = I3./(mean(mean(I3)));

        uniform = (I1 + I2 + I3);
        uniform = rescale(uniform);
        uM = max(max(uniform));
        uniform = uniform/uM;
        
        sectioned = (sqrt(((I1-I2).^2 + (I1-I3).^2 + (I2-I3).^2)));
        uS = max(max(sectioned));
        mS = mean(mean(sectioned));
        sectioned = sectioned/(max(sectioned(:)));
        
        I = abs(ifft2(fftshift(fftshift(fft2(sectioned)).*F3)));
        I = I/max(max(I));
        %mean_sectioned = sectioned
   % sectioned = sectioned./CalSlide;
    %sectioned = sectioned./(mean(sectioned)); 
 % sectioned = rescale(sectioned); %don't use rescale 
     %divide sectioned by sectioned mean 
      
     %sectioned = im2uint16(sectioned/700); %10X 
        uniform=im2uint8(uniform);
        sectioned = im2uint8(sectioned);
        I=im2uint8(I);
        pair=[I uniform];
%         I1 = rescale(I1);
%         I2 = rescale(I2);
%         I3 =rescale(I3);

      %    eval(['imwrite(uniform,''20X_uniform_' num2str(n) '.tif'');']) 
          eval(['imwrite(pair,''I:\care\phantom2\Phantom_' num2str(n) '_' num2str(j) '_' num2str(k) '_' num2str(depth) '.png'');']) 

           clear I1 I2 I3 uniform sectioned I

end
end
end

% total = num_cols*num_rows; 
% for i = total 
%     sectioned
%     sectioned = im2uint16(sectioned);
%     eval(['imwrite(sectioned,''10X_sectioned_' num2str(n) '.tif'');'])
%     
% end
% 
