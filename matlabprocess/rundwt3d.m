clc;
clear;

load('indian/Indian_pines_corrected.mat');
load('indian/Indian_pines_gt.mat')

Data = indian_pines_corrected;
% Data = dwt3d_feature(Data); 
%Data = double(Data);
%indian_pines_corrected(1,1,:)
%Data(1,1,:)

%  [LoD,HiD,LoR,HiR] = wfilters('haar'); 
%  LoD
%  HiD
% subplot(2,2,1)
% stem(LoD)
% title('Decomposition Lowpass Filter')
% subplot(2,2,2)
% stem(HiD)
% title('Decomposition Highpass Filter')
% subplot(2,2,3)
% stem(LoR)
% title('Reconstruction Lowpass Filter')
% subplot(2,2,4)
% stem(HiR)
% title('Reconstruction Highpass Filter')


tic
X = Data;
sX = size(X)
if length(sX)<3 , sX(3) = 1; end

[Lo,Hi,LR,HR] = wfilters('haar');

lf = length(Lo);
lx = sX(2);
if lx<lf+1
    nbAdd = lf-lx+1;
    Add = zeros(sX(1),nbAdd,sX(3));
    X = [Add , X , Add];
end
X1 = X(:,lf-1:-1:1,:); 
X2 = X(:,end:-1:end-lf+2,:);
X = [X(:,lf-1:-1:1,:) , X , X(:,end:-1:end-lf+2,:)];
size(X1)
size(X)
size(Lo)
Lo
L = convn(X,Lo,'same');
H = convn(X,Hi,'same');
size(H)
clear X;
lenL = size(L,2);
first = lf; last = lenL-lf+1;
L = L(:,first:last,:); H = H(:,first:last,:);
perm=[];
if ~isempty(perm)
    L = permute(L,perm);
    H = permute(H,perm);
end

X = Data;
permVect = [1,3,2];
X = permute(X,permVect);
toc

disp(['运行时间: ',num2str(toc)]);

% DataCube=double(Data);
% [m, n, b] = size(DataCube);
% feats=dwt3_2(DataCube,'haar');
% feats=feats.dec;
% % 二级分解
% d1=dwt3_2(feats{1,1,1},'haar');
% d1=d1.dec;
% d1=cat(3,d1{:});
% d1 = single(d1); % LJ
% feats=cat(3,feats{:});
% feats=feats(:,:,size(DataCube,3)+1:end);
% feats = single(feats); % LJ
% feats=cat(3,d1,feats);
% clear d1 DataCube;
% feats=abs(feats);
% filter_mask=1/9*ones(3,3);
% for i=1:size(feats,3)
%     feats(:,:,i)=conv2( feats(:,:,i),filter_mask,'same');
% end
% feats=reshape(feats,[m*n, b*15]);
% feats1 = feats(1:round(end/2),:); % LJ to reduce computational burden
% feats2 = feats(round(end/2)+1:end,:); % LJ
% clear feats; %LJ
% feats1 = mapstd(feats1);  % LJ
% feats2 = mapstd(feats2); % LJ
% feats = cat(1,feats1, feats2);
% feats=reshape(feats,[m,n,b*15]);


