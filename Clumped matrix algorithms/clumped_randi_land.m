function clumped_randi_land(~)
header_1 = 'ncols 26';  %%add ascii headers for conversion to tiff
header_2 = 'nrows 26';
header_3='xllcorner 278923';
header_4='yllcorner 4072345';
header_5='cellsize 10';
header_6='nodata_value -32768';
for iP = 1:100;%% This is the number of landscapes to be created
    A = randi(3,26);%%%Your data.
    desired_clump = 15;
    [C,R]=meshgrid(1:size(A,1), (1:size(A,2))'); %'# row and column numbers for each element
    seed = ceil(rand(1)*numel(A));
    A(seed) = 1; % initialize a clump
    clump_size = 10;
while clump_size < desired_clump
    CI = A==2; % logical index of current clump
    CR = reshape(R(CI),1,1,[]); % 1x1xN index of row values of current clump
    CC = reshape(C(CI),1,1,[]); % 1x1xN index of col values of current clump
    ADJ = sum(bsxfun(@(x,y)abs(x-y),R,CR)<=1 & bsxfun(@(x,y)abs(x-y),C,CC)<=1, 3)>0;%has been modified to remove & ~A
    % ADJ is the indices of the elements adjacent to the current clump
    B=A; % for display purposes only
    B(ADJ)=2;
    disp(B)
    disp(' ')
    POS = find(ADJ); % linear indices of the adjacent elements
    IND = ceil(rand(1)*numel(POS)); % random index into POS vector
    A(POS(IND))=1; % grow the clump
    clump_size = clump_size+1;
    pcolor(A);
    fid = fopen(sprintf('landscape%2d.asc', iP),'w+t');
if fid<0
    fprintf('error opening file \n');
    return;
end
end
%%arrange the output files
fprintf(fid,'%s\n',header_1);
fprintf(fid,'%s\n',header_2);
fprintf(fid,'%s\n',header_3);
fprintf(fid,'%s\n',header_4);
fprintf(fid,'%s\n',header_5);
fprintf(fid,'%s\n',header_6);
fprintf(fid,'%5.2f',A);
fclose(fid);
end