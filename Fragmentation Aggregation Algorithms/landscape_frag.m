function [U fr] = landscape_frag(n,z,P,t,tolr)
%n = size of the domain
%z = desired level of fragmentation (between 0 and 1)
%P = proportion of each region:
%P is a vector of length K; K is the number of different regions
%t = max computation time (in seconds)
%tolr = tolerance on fragmentation level
header_1 = 'ncols 90';  %%add ascii headers for conversion to tiff
header_2 = 'nrows 90';
header_3='xllcorner 840465';
header_4='yllcorner 1882485';
header_5='cellsize 30';
header_6='nodata_value -9999';
for iP = 1:5;%% This is the number of landscapes to be created
    K=length(P);
    P=P/sum(P);

    % global variables
    listes='';
        for i=1:length(P)
            listes=[listes ' L' num2str(i)];
        end
    eval(['global ' listes ' U']);

    %t = max allowed computation time. t has to be high in order to obtain highly
    %aggregated patterns

    %%%%%%%%%%%%%%%%%%%%
    %initialization

    % number of cells in each region
    for i=1:length(P)-1
        nx(i)=floor(n^2*P(i)); 
    end
    nx(end+1)=n^2-sum(nx);

    % matrix of size n^2
    U=K*ones(n); 
    % matrices which will contain the positions of the cells corresponding to the different regions
    for i=1:K
        eval(['L' num2str(i) '=[];']);
    end
    % matrix with the positions of unoccupied cells
    L=[]; for i=1:n for j=1:n L=[L ; i j]; end; end;

    % initialization of the matrix U: 
    for j=1:K-1
        for i=1:nx(j)
            a=ceil(length(L)*rand(1));
            U(L(a,1),L(a,2))=j;
            Z=eval(['L' num2str(j) ';']);
            eval(['L' num2str(j) '=[Z ; L(a,:) ];']);
            L=L([1:a-1 a+1:length(L)],:); % actualisation of the matrix of positions of unoccupied cells
        end
    end
    eval(['L' num2str(K) '=L;']); % remaining cells are of the type K


    %%%%%%%%%%%%%%%%%%%%%%
    % initialization of the parameter beta of the Gibbs model
            if frag(P,n,nx)<z
                b=-10; % too much aggregated initial landscape
              
            else
                b=10; % too much fragmented initial landscape
              
            end


    %%%%%%%%%%%%%%%%%%%%%%%
    % Metropolis-Hastings algorithm
    stop=0; cpt=0; 
    a=cputime;
    mcpt=1e2; % stopping criterion is tested when mod(cpt,mcpt)==0
    while stop==0
        cpt=cpt+1;
        % at each step, the proposal is to permute the positions of two cells
        % in two different regions
    
        % two regions are selected at random
        c1=ceil(K*rand(1)); c2=ceil(K*rand(1));  while c2==c1 c2=ceil(K*rand(1)); end
        Z1=eval(['L' num2str(c1)]); % coordinates of the cells in region 1
        Z2=eval(['L' num2str(c2)]); % coordonnees of the cells in region 2
    
        % two cell are selected at random in these regions
        a1=ceil(size(Z1,1)*rand(1)); i1=Z1(a1,1); j1=Z1(a1,2);
        a2=ceil(size(Z2,1)*rand(1)); i2=Z2(a2,1); j2=Z2(a2,2);
    
    
        %list of neighbors (periodic conditions):
        V1=[U(i1-1+n*(i1==1),j1) U(mod(i1,n)+1,j1) U(i1,j1-1+n*(j1==1)) U(i1,mod(j1,n)+1)];              
        V2=[U(i2-1+n*(i2==1),j2) U(mod(i2,n)+1,j2) U(i2,j2-1+n*(j2==1)) U(i2,mod(j2,n)+1)]; 
    
        % number of pairs of similar neighbors before permutation
        dEi=(sum(V1==U(i1,j1))+sum(V2==U(i2,j2))+0.0)/2;
        % number of pairs of similar neighbors after permutation
        dEf=(sum(V1==U(i2,j2))+sum(V2==U(i1,j1))+0.0)/2;
        % energy difference initial state-proposal
        dE=b*(dEi-dEf); 
        % acceptance-rejection
        w=rand(1); 
        if exp(-dE)>w
        % change is accepted
            tmp=U(i2,j2); U(i2,j2)=U(i1,j1); U(i1,j1)=tmp;
            tmp=Z2(a2,:); Z2(a2,:)=Z1(a1,:); Z1(a1,:)=tmp;
            eval(['L' num2str(c1) '=Z1;']);
            eval(['L' num2str(c2) '=Z2;']);
        end         
        %stopping criterion: computation time and aggregation level
        if mod(cpt,mcpt)==0
            fr=frag(P,n,nx);
            mcp=ceil(abs(fr-z)*5e3);
            if fr<z %too much aggregated
                b=-10;
            else
                b=10;
            end
            stop=((cputime-a)>t)||(abs(fr-z)<tolr);
        end  
    end
    fr=frag(P,n,nx); % fragmentation of the generated landscape
    fid = fopen(sprintf('landscape%2d.asc', iP),'w+t');
	fid2 = fopen(sprintf('fragmentation%2d.txt', iP),'w+t');
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
fprintf(fid,'%5.2f',U);
fprintf(fid2,'%5.2f',fr);
fclose(fid);
end