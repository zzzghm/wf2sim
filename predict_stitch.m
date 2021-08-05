overlap=128;
pixel=127;

for a=5:10
    for b=5:10
        
        I=zeros(2048,2048,3);
        I=uint8(I);
        
        for m=1:15
            for n=1:15
                eval(['mul = (imread(''/home/hzhuge/Documents/prostate margin/panel4_overlap_result_256/Panel4_' num2str(a) '_' num2str(b) '_sub' num2str(m) '_' num2str(n)  '.png''));']);
                over=mul(64:191,64:191,:);
                startx=overlap*(m-1)+1;
                starty=overlap*(n-1)+1;
                I(startx:(pixel+startx),starty:(pixel+starty),:)=over;
            end
        end
        eval(['(imwrite(I, ''/home/hzhuge/Documents/prostate margin/panel4_stitch_256/Panel4_' num2str(a) '_' num2str(b) '.png''));']);
    end
end

% 
% 
% block=256;
% num=21;
% base_m=80;
% base_n=70;
% row=block*num;
% col=block*num;
% height_5x = 63; 
% width_5x = 63; 
% height_10x = 127; 
% width_10x = 127; 
% height_20x = 255; 
% width_20x = 255; 
% 
% I=zeros(row,col,3);
% I=uint8(I);
% 
% for m=base_m:base_m+num-1
%     for n=base_n:base_n+num-1
% %         eval(['mul = (imread(''5x_' num2str(m) '_' num2str(n)  '.png''));']);  
% %         eval(['mul = (imread(''10x_' num2str(m) '_' num2str(n)  '.png''));']);
% %          eval(['mul = (imread(''20x_' num2str(m) '_' num2str(n)  '.png''));']);
% %        eval(['mul = (imread(''pair5&10_' num2str(m) '_' num2str(n)  '.png''));']);
%         eval(['mul = (imread(''pair5&20_' num2str(m) '_' num2str(n)  '.png''));']);
%         starty=block*(n-base_n)+1;
%         startx=block*(m-base_m)+1;
% %         I(starty:(height_5x+starty), startx:(width_5x+startx),:)=mul;
% %        I(starty:(height_10x+starty), startx:(width_10x+startx),:)=mul;
%         I(starty:(height_20x+starty), startx:(width_20x+startx),:)=mul;
%     end
% end
% %imwrite(I, '/home/hzhuge/Downloads/patches_code/stitch/test10/10x_predict/10x_fused.png');
% imwrite(I, '20x_fused.png');