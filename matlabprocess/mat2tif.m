% mat2tif
% 将高光谱mat文件，保存为tif
clc; clear; close all;
%% load the hyperspectral image
img = load ('D:\Hyperspectralmatlab\Datasets\IndianPines\Indian_pines_corrected.mat'); 
img = img.indian_pines_corrected;
% 获取数组维度信息
[row, col, bands] = size(img);
% double类型转unit8
img_8 = uint8(img(:,:,:)/10000*256);

% 保存为tif图像
t = Tiff('imageIndiaP.tif','w');
% 影像信息
tagstruct.ImageLength = size(img_8,1); 
tagstruct.ImageWidth = size(img_8,2);  

% 颜色空间解释方式
tagstruct.Photometric = 1;

% 每个像素的数值位数，这里转换为unit8，所以为8位
tagstruct.BitsPerSample = 8;
% 每个像素的波段个数，一般图像为1或3，但是对于遥感影像存在多个波段所以常常大于3
tagstruct.SamplesPerPixel = bands;
tagstruct.RowsPerStrip = 16;
tagstruct.PlanarConfiguration = Tiff.PlanarConfiguration.Chunky;
% 表示生成影像的软件
tagstruct.Software = 'MATLAB'; 
% 表示对数据类型的解释
tagstruct.SampleFormat = 1;
% 设置Tiff对象的tag
t.setTag(tagstruct);

% 以准备好头文件，开始写数据
t.write(img_8);
% 关闭影像
t.close;
