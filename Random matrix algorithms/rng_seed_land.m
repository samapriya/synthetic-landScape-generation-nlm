function random_seed_land(seed,generator)
header_1 = 'ncols 50';  %%add ascii headers for conversion to tiff
header_2 = 'nrows 50';
header_3='xllcorner 278923';
header_4='yllcorner 4072345';
header_5='cellsize 1';
header_6='nodata_value -32768';
for iP = 1:2;%% This is the number of landscapes to be created
    rng(seed, generator)
	M  = rand(50,50);%%%Your data.
    M(M>0.75)=3;%%fractionation to include percentage landcover
    M(M>0.5 & M<=0.75)=2;
    M(M>0 & M<=0.5)=1;
    fid = fopen(sprintf('landscape%2d.txt', iP),'w+t');
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
fprintf(fid,'%5.2f',M);
fclose(fid);
end