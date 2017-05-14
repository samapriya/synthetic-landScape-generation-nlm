for index = 1:50;%% This is the number of landscapes to be created
    M  = rand(24,24);%%%Choose matrix size
    M(M>0.75)=3;%%fractionation to include percentage landcover
    M(M>0.5 & M<=0.75)=2;
    M(M>0 & M<=0.5)=1;
    %%convert matrix to image matrix
    imagesc(M);
    %%movie array created
    mov(index)= getframe;
end
movie(mov);
movie2avi(mov,'landscape.avi')
