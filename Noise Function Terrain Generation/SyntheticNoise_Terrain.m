%These functions allows you to test noise functions to generate artificial terrains using noise function executables.
%Source codes for the c++ files are included in the adjoining folder and were provided kindly by Travis Archer for open use.
%The codes create a bmp output which are then modified to create binned responses and landscape classes as needed

%Global Variables to add ascii headers for conversion to tiff
header_1 = 'ncols 500';  
header_2 = 'nrows 500';
header_3='xllcorner 278923';
header_4='yllcorner 4072345';
header_5='cellsize 10';
header_6='nodata_value -32768';

function Erosion(~)
for iP = 1:5;%% This is the number of landscapes to be created
    system(['Erosion.1.0.exe']); %run executable with content of fname as inputs
    test=imread('test.bmp');
    M=rgb2gray(test);
    [N,edges]= histcounts(M,9); %%Test this for equal binning: F = ceil(5*tiedrank(R)/length(R)); convert to double M2 = im2double(M)
    M2=M;
    M2(M>edges(9))=9;%%fractionation to include percentage landcover
    M2(M>edges(8) & M<=edges(9))=8;
    M2(M>edges(7) & M<=edges(8))=7;
    M2(M>edges(6) & M<=edges(7))=6;
    M2(M>edges(5) & M<=edges(6))=5;
    M2(M>edges(4) & M<=edges(5))=4;
    M2(M>edges(3) & M<=edges(4))=3;
    M2(M>edges(2) & M<=edges(3))=2;
    M2(M>edges(1) & M<=edges(2))=1;
    fid = fopen(sprintf('landscape%2d.asc', iP),'w+t');
if fid<0
    fprintf('error opening file \n');
    return;
end
%%arrange the output files
fprintf(fid,'%s\n',header_1);
fprintf(fid,'%s\n',header_2);
fprintf(fid,'%s\n',header_3);
fprintf(fid,'%s\n',header_4);
fprintf(fid,'%s\n',header_5);
fprintf(fid,'%s\n',header_6);
fprintf(fid,'%5.2f',M2);
fclose(fid);
end

function Erosion2(~)
for iP = 1:5;%% This is the number of landscapes to be created
    system(['Erosion.1.0.exe']); %run executable with content of fname as inputs
    test=imread('test.bmp');
    M=rgb2gray(test);
    M2=M;
    M2 = im2double(M);
    F = ceil(5*tiedrank(M2)/length(M2));
    fid = fopen(sprintf('landscape%2d.asc', iP),'w+t');
if fid<0
    fprintf('error opening file \n');
    return;
end
%%arrange the output files
fprintf(fid,'%s\n',header_1);
fprintf(fid,'%s\n',header_2);
fprintf(fid,'%s\n',header_3);
fprintf(fid,'%s\n',header_4);
fprintf(fid,'%s\n',header_5);
fprintf(fid,'%s\n',header_6);
fprintf(fid,'%5.2f',F);
fclose(fid);
end

function MidPointDisp(~)
for iP = 1:2;%% This is the number of landscapes to be created
    system(['midpointdisp.1.0.exe']); %run executable with content of fname as inputs
    test=imread('test.bmp');
    M=rgb2gray(test);
    [N,edges]= histcounts(M,9); %%Test this for equal binning: F = ceil(5*tiedrank(R)/length(R)); convert to double M2 = im2double(M)
    M2=M;
    M2(M>edges(9))=9;%%fractionation to include percentage landcover
    M2(M>edges(8) & M<=edges(9))=8;
    M2(M>edges(7) & M<=edges(8))=7;
    M2(M>edges(6) & M<=edges(7))=6;
    M2(M>edges(5) & M<=edges(6))=5;
    M2(M>edges(4) & M<=edges(5))=4;
    M2(M>edges(3) & M<=edges(4))=3;
    M2(M>edges(2) & M<=edges(3))=2;
    M2(M>edges(1) & M<=edges(2))=1;
    fid = fopen(sprintf('landscape%2d.asc', iP),'w+t');
if fid<0
    fprintf('error opening file \n');
    return;
end
%%arrange the output files
fprintf(fid,'%s\n',header_1);
fprintf(fid,'%s\n',header_2);
fprintf(fid,'%s\n',header_3);
fprintf(fid,'%s\n',header_4);
fprintf(fid,'%s\n',header_5);
fprintf(fid,'%s\n',header_6);
fprintf(fid,'%5.2f',M2);
fclose(fid);
end

function MidPointDisp2(~)
for iP = 1:2;%% This is the number of landscapes to be created
    system(['midpointdisp.1.0.exe']); %run executable with content of fname as inputs
    test=imread('test.bmp');
    M=rgb2gray(test);
    M2=M;
    M2 = im2double(M);
    F = ceil(5*tiedrank(M2)/length(M2));
    fid = fopen(sprintf('landscape%2d.asc', iP),'w+t');
if fid<0
    fprintf('error opening file \n');
    return;
end
%%arrange the output files
fprintf(fid,'%s\n',header_1);
fprintf(fid,'%s\n',header_2);
fprintf(fid,'%s\n',header_3);
fprintf(fid,'%s\n',header_4);
fprintf(fid,'%s\n',header_5);
fprintf(fid,'%s\n',header_6);
fprintf(fid,'%5.2f',F);
fclose(fid);
end

function PerlinNoise(~)
for iP = 1:2;%% This is the number of landscapes to be created
    system(['PerlinNoise1.0.exe']); %run executable with content of fname as inputs
    test=imread('test.bmp');
    M=rgb2gray(test);
    [N,edges]= histcounts(M,9); %%Test this for equal binning: F = ceil(5*tiedrank(R)/length(R)); convert to double M2 = im2double(M)
    M2=M;
    M2(M>edges(9))=9;%%fractionation to include percentage landcover
    M2(M>edges(8) & M<=edges(9))=8;
    M2(M>edges(7) & M<=edges(8))=7;
    M2(M>edges(6) & M<=edges(7))=6;
    M2(M>edges(5) & M<=edges(6))=5;
    M2(M>edges(4) & M<=edges(5))=4;
    M2(M>edges(3) & M<=edges(4))=3;
    M2(M>edges(2) & M<=edges(3))=2;
    M2(M>edges(1) & M<=edges(2))=1;
    fid = fopen(sprintf('landscape%2d.asc', iP),'w+t');
if fid<0
    fprintf('error opening file \n');
    return;
end
%%arrange the output files
fprintf(fid,'%s\n',header_1);
fprintf(fid,'%s\n',header_2);
fprintf(fid,'%s\n',header_3);
fprintf(fid,'%s\n',header_4);
fprintf(fid,'%s\n',header_5);
fprintf(fid,'%s\n',header_6);
fprintf(fid,'%5.2f',M2);
fclose(fid);
end

function PerlinNoise2(~)
for iP = 1:10;%% This is the number of landscapes to be created
    system(['PerlinNoise1.0.exe']); %run executable with content of fname as inputs
    test=imread('test.bmp');
    M=rgb2gray(test);
    M2=M;
    M2 = im2double(M);
    F = ceil(5*tiedrank(M2)/length(M2));
    fid = fopen(sprintf('landscape%2d.asc', iP),'w+t');
if fid<0
    fprintf('error opening file \n');
    return;
end
%%arrange the output files
fprintf(fid,'%s\n',header_1);
fprintf(fid,'%s\n',header_2);
fprintf(fid,'%s\n',header_3);
fprintf(fid,'%s\n',header_4);
fprintf(fid,'%s\n',header_5);
fprintf(fid,'%s\n',header_6);
fprintf(fid,'%5.2f',F);
fclose(fid);
end

function SimplexNoise(~)
for iP = 1:2;%% This is the number of landscapes to be created
    system(['simplexnoise.1.0.exe']); %run executable with content of fname as inputs
    test=imread('test.bmp');
    M=rgb2gray(test);
    [N,edges]= histcounts(M,9); %%Test this for equal binning: F = ceil(5*tiedrank(R)/length(R)); convert to double M2 = im2double(M)
    M2=M;
    M2(M>edges(9))=9;%%fractionation to include percentage landcover
    M2(M>edges(8) & M<=edges(9))=8;
    M2(M>edges(7) & M<=edges(8))=7;
    M2(M>edges(6) & M<=edges(7))=6;
    M2(M>edges(5) & M<=edges(6))=5;
    M2(M>edges(4) & M<=edges(5))=4;
    M2(M>edges(3) & M<=edges(4))=3;
    M2(M>edges(2) & M<=edges(3))=2;
    M2(M>edges(1) & M<=edges(2))=1;
    fid = fopen(sprintf('landscape%2d.asc', iP),'w+t');
if fid<0
    fprintf('error opening file \n');
    return;
end
%%arrange the output files
fprintf(fid,'%s\n',header_1);
fprintf(fid,'%s\n',header_2);
fprintf(fid,'%s\n',header_3);
fprintf(fid,'%s\n',header_4);
fprintf(fid,'%s\n',header_5);
fprintf(fid,'%s\n',header_6);
fprintf(fid,'%5.2f',M2);
fclose(fid);
end

function SimplexNoise2(~)
for iP = 1:2;%% This is the number of landscapes to be created
    system(['simplexnoise.1.0.exe']); %run executable with content of fname as inputs
    test=imread('test.bmp');
    M=rgb2gray(test);
    M2=M;
    M2 = im2double(M);
    F = ceil(5*tiedrank(M2)/length(M2));
    fid = fopen(sprintf('landscape%2d.asc', iP),'w+t');
if fid<0
    fprintf('error opening file \n');
    return;
end
%%arrange the output files
fprintf(fid,'%s\n',header_1);
fprintf(fid,'%s\n',header_2);
fprintf(fid,'%s\n',header_3);
fprintf(fid,'%s\n',header_4);
fprintf(fid,'%s\n',header_5);
fprintf(fid,'%s\n',header_6);
fprintf(fid,'%5.2f',F);
fclose(fid);
end

function CellNoise(~)
for iP = 1:2;%% This is the number of landscapes to be created
    system(['CellNoise.1.0.exe']); %run executable with content of fname as inputs
    test=imread('test.bmp');
    M=rgb2gray(test);
    [N,edges]= histcounts(M,9); %%Test this for equal binning: F = ceil(5*tiedrank(R)/length(R)); convert to double M2 = im2double(M)
    M2=M;
    M2(M>edges(9))=9;%%fractionation to include percentage landcover
    M2(M>edges(8) & M<=edges(9))=8;
    M2(M>edges(7) & M<=edges(8))=7;
    M2(M>edges(6) & M<=edges(7))=6;
    M2(M>edges(5) & M<=edges(6))=5;
    M2(M>edges(4) & M<=edges(5))=4;
    M2(M>edges(3) & M<=edges(4))=3;
    M2(M>edges(2) & M<=edges(3))=2;
    M2(M>edges(1) & M<=edges(2))=1;
    fid = fopen(sprintf('landscape%2d.asc', iP),'w+t');
if fid<0
    fprintf('error opening file \n');
    return;
end
%%arrange the output files
fprintf(fid,'%s\n',header_1);
fprintf(fid,'%s\n',header_2);
fprintf(fid,'%s\n',header_3);
fprintf(fid,'%s\n',header_4);
fprintf(fid,'%s\n',header_5);
fprintf(fid,'%s\n',header_6);
fprintf(fid,'%5.2f',M2);
fclose(fid);
end

function CellNoise2(~)
for iP = 1:2;%% This is the number of landscapes to be created
    system(['CellNoise.1.0.exe']); %run executable with content of fname as inputs
    test=imread('test.bmp');
    M=rgb2gray(test);
    M2=M;
    M2 = im2double(M);
    F = ceil(5*tiedrank(M2)/length(M2));
    fid = fopen(sprintf('landscape%2d.asc', iP),'w+t');
if fid<0
    fprintf('error opening file \n');
    return;
end
%%arrange the output files
fprintf(fid,'%s\n',header_1);
fprintf(fid,'%s\n',header_2);
fprintf(fid,'%s\n',header_3);
fprintf(fid,'%s\n',header_4);
fprintf(fid,'%s\n',header_5);
fprintf(fid,'%s\n',header_6);
fprintf(fid,'%5.2f',F);
fclose(fid);
end

function DiamondSquare(~)
for iP = 1:2;%% This is the number of landscapes to be created
    system(['DiamondSquare.1.0.exe']); %run executable with content of fname as inputs
    test=imread('test.bmp');
    test2=imresize(test,[500 500]);
    M=rgb2gray(test2);
    [N,edges]= histcounts(M,9); %%Test this for equal binning: F = ceil(5*tiedrank(R)/length(R)); convert to double M2 = im2double(M)
    M2=M;
    M2(M>edges(9))=9;%%fractionation to include percentage landcover
    M2(M>edges(8) & M<=edges(9))=8;
    M2(M>edges(7) & M<=edges(8))=7;
    M2(M>edges(6) & M<=edges(7))=6;
    M2(M>edges(5) & M<=edges(6))=5;
    M2(M>edges(4) & M<=edges(5))=4;
    M2(M>edges(3) & M<=edges(4))=3;
    M2(M>edges(2) & M<=edges(3))=2;
    M2(M>edges(1) & M<=edges(2))=1;
    fid = fopen(sprintf('landscape%2d.asc', iP),'w+t');
if fid<0
    fprintf('error opening file \n');
    return;
end
%%arrange the output files
fprintf(fid,'%s\n',header_1);
fprintf(fid,'%s\n',header_2);
fprintf(fid,'%s\n',header_3);
fprintf(fid,'%s\n',header_4);
fprintf(fid,'%s\n',header_5);
fprintf(fid,'%s\n',header_6);
fprintf(fid,'%5.2f',M2);
fclose(fid);
end

function DiamondSquare2(~)
for iP = 1:2;%% This is the number of landscapes to be created
    system(['DiamondSquare.1.0.exe']); %run executable with content of fname as inputs
    test=imread('test.bmp');
    test2=imresize(test,[500 500]);
    M=rgb2gray(test2);
    M2=M;
    M2 = im2double(M);
    F = ceil(5*tiedrank(M2)/length(M2));
    fid = fopen(sprintf('landscape%2d.asc', iP),'w+t');
if fid<0
    fprintf('error opening file \n');
    return;
end
%%arrange the output files
fprintf(fid,'%s\n',header_1);
fprintf(fid,'%s\n',header_2);
fprintf(fid,'%s\n',header_3);
fprintf(fid,'%s\n',header_4);
fprintf(fid,'%s\n',header_5);
fprintf(fid,'%s\n',header_6);
fprintf(fid,'%5.2f',F);
fclose(fid);
end