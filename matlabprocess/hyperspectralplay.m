close all
clc
% hcube = hypercube('BurnALI_subset.dat','BurnALI_subset.hdr')
% hcube = hypercube('0000/sequoia_param.dat')
hcube = hypercube('indian_pines.hdr')
ndviImg = ndvi(hcube);
% rgbImg = colorize(hcube,'Method','RGB','ContrastStretching',true);
% fig = figure('Position',[0 0 1200 600]);
% axes1 = axes('Parent',fig,'Position',[0 0.1 0.4 0.8]);
% imshow(rgbImg,'Parent',axes1)
% title('RGB Image of Data Cube')
% axes2 = axes('Parent',fig,'Position',[0.45 0.1 0.4 0.8]);
% imagesc(ndviImg,'Parent',axes2)
% colorbar
% title('NDVI Image')
threshold = 0.2;
bw = ndviImg > threshold;
% overlayImg = imoverlay(rgbImg,bw,[0 1 0]);
% figure
% imagesc(overlayImg)
% title('Vegetation Region Overlaid on RGB Image')
numVeg = find(bw == 1);
imgSize = size(hcube.DataCube,1)*size(hcube.DataCube,2);
vegetationCover = length(numVeg)/imgSize