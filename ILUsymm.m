%A_s should be symmetrical
%A_s=[4,2,-1,2;-1,3,0,2;-1,1,-1,-1;0,-1,-1,3];

n = size (A_s, 1);
L_s = zeros(n);
D_s = zeros(n);

L_s(1,1) = 1;

%k=1;
%j=1;

for k = 1 : n 
    for j = 1 : k-1
        if A_s(k, j) == 0 
           L_s(k, j) = 0; 
        else
            sum1 = 0;
            for i = 1 : j-1
                sum1 = sum1 +D_s(i,i)*L_s(i,k)*L_s(j,k);
            end    
                L_s(k, j) = 1/D_s(j,j)*(A_s(k, j) - sum1); 
        end
        L_s(k, k) = 1; 
    end
    sum2 = 0;
    for i = 1 : k-1
        sum2 = sum2 + L_s(k, i)*L_s(k, i)*D_s(i,i);
    end
    D_s(k,k) = A_s(k, k) - sum2;
end

R_s = A_s - L_s*D_s*L_s';

disp('A (symmetrical): ');
disp(A_s);
disp('L: ');
disp(L_s);
disp('D: ');
disp(D_s);
disp('R: ');
disp(R_s);
