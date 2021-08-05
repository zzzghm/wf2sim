clear all
clc
close all
n = 0;
num_z=20;
num_cols =7;  
num_rows =8; 


for j = 0:num_cols-1 
for k = 0:num_rows-1
for depth =0:num_z-1 
  n = n+1;  
        eval(['I1 = (imread(''Phantom_' num2str(n) '_' num2str(j) '_' num2str(k) '_' num2str(depth) '.png''));'])
        sectioned=I1(:,1:2048);
        uniform=I1(:,2049:4096);
        temp_uniform=mat2tiles(uniform,[256,256]);
        temp_sectioned=mat2tiles(sectioned,[256,256]);
        [a,b]=size(temp_uniform);
        
 num=0;       
        for q=1:a
            for w=1:b
                num=num+1;
%                 thumb_section=[temp_sectioned{q,w}];
%                 thumb_uniform=[temp_uniform{q,w}];
                  thumb=[temp_sectioned{q,w} temp_uniform{q,w}];
                  eval(['(imwrite(thumb, ''I:\care\phantom_stacks\thumb\newPhantom_' num2str(j) '_' num2str(k) '_' num2str(depth) '_sub' num2str(num) '.png''));'])
            end
        end
          

end
%         thumb_stack_section=zeros(256,256,20);
%         thumb_stack_uniform=zeros(256,256,20);
%         thumb_stack_section(:,:,depth+1)=thumb_section;
%         thumb_stack_uniform(:,:,depth+1)=thumb_uniform;
%         thumb_stack_section=thumb_stack_section/(max(max(max(thumb_stack_section))));
%         thumb_stack_uniform=thumb_stack_uniform/(max(max(max(thumb_stack_uniform))));
%         thumb_stack=zeros(256,512,20);
%         thumb_stack(:,1:256,:)=thumb_stack_section;
%         thumb_stack(:,257:512,:)=thumb_stack_uniform;
%         
%         save(['phantom_3d_' num2str(num)],'thumb_stack');
%         t = Tiff(strcat('newPhantom_',num2str(num),'.tiff'),'w');
%         setTag(t,'Photometric',Tiff.Photometric.GREY);
%         setTag(t,'ImageLength',256);
%         setTag(t,'ImageWidth',512);
%         write(t,thumb_stack);
        %eval(['Tiff([thumb_stack,''H:\care\phantom_stacks\3d_thumb\Phantom_' num2str(n) '.tiff''],'w' );']) 
        
        clear I1 sectioned uniform temp_uniform temp_sectioned thumb thumb_stack  thumb_stack_section  thumb_stack_uniform
end
end


