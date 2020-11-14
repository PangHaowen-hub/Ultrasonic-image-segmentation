%% 运行这个文件
clear; close all;
str = 'D:\master_course\Medical_Image_Processing\code\img\';
files = dir(strcat(str,'*.jpg'));
number_files = length(files);

for i=1:number_files
    path = [str,num2str(i),'.jpg']
    img = imread(path);
    bm3dfun(img, path);
    close all;
end