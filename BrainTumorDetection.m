close all
clear
clc

I = imread('E:\habib\study\study\study\image processing\Brain-Tumor-Detection-using-Image-Processing-master\1.jpg');
% I = imresize(I, [200, 200]);
figure, imshow(I);
title('MRI Image');

I = im2bw(I, .6);
figure, imshow(I);
title('Binary Image');

se = strel('disk', 20);
Ie = imerode(I, se);
Iobr = imreconstruct(Ie, I);
Iobrd = imdilate(Iobr, se);
%Iobrcbr = imreconstruct(imcomplement(Iobrd), imcomplement(Iobr));
Iobrcbr = imreconstruct((Iobrd), (Iobr));
%Iobrcbr = imcomplement(Iobrcbr);

% bw = im2bw(Iobrcbr);
figure, imshow(Iobrcbr);
title('Tumor');