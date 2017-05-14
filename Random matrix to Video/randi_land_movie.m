for index = 1:100;%% This is the number of landscapes to be created
    M  = randi(3,10);%%%Choose matrix size
    %%convert matrix to image matrix
    imagesc(M);
    %%movie array created
    mov(index)= getframe;
end
movie(mov);
movie2avi(mov,'ls_randi.avi')