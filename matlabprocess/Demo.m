% Demo of 3DDWT-SVM-GC
% tic;
clear;clc;

currentFolder = pwd;
addpath(genpath(currentFolder))

%load data
% load('indian/Indian_pines_corrected.mat');
% load('indian/Indian_pines_gt.mat')
load('KSC/KSC.mat')
load('KSC/KSC_gt.mat')
% load('paviau\PaviaU.mat')
% load('paviau\PaviaU_gt.mat')
% load('Salinas\Salinas_corrected.mat')
% load('Salinas\Salinas_gt.mat')
% load('Botswana\Botswana.mat')
% load('Botswana\Botswana_gt.mat')


% Data = indian_pines_corrected;
% tic
% Data = dwt3d_feature(Data); 
% toc
% disp(['运行时间: ',num2str(toc)]);
% Data = double(Data);
% Label = indian_pines_gt;

% Data = paviaU;
% tic
% Data = dwt3d_feature(Data); 
% toc
% disp(['运行时间: ',num2str(toc)]);
% Data = double(Data);
% Label = paviaU_gt;

Data = KSC;
tic
Data = dwt3d_feature(Data); 
toc
disp(['运行时间: ',num2str(toc)]);
Data = double(Data);
% Label = paviaU_gt;


% Data = salinasA_corrected;
% Data = dwt3d_feature(Data); 
% Data = double(Data);
% Label = salinasA_gt;

% Data = salinas_corrected;
% Data = dwt3d_feature(Data); 
% Data = double(Data);
% Label = salinas_gt;

% Data = Botswana;
% Data = dwt3d_feature(Data); 
% Data = double(Data);
% Label = Botswana_gt;


% clear indian_pines_corrected indian_pines_gt;
% clear KSC KSC_gt;
% clear PaviaU paviaU_gt



