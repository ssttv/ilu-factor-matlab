
%A =[9 0 0 3 1 0 1; 0 11 2 1 0 0 2; 0 1 10 2 0 0 0; 2 1 2 9 1 0 0; 1 0 0 1 12 0 1; 0 0 0 0 0 8 0; 2 2 0 0 3 0 8];
%A=[4,2,3,0;-1,4,0,0;3,0,4,2;0,1,5,0];
n = size (A, 1);
L = zeros(n);
U = zeros(n);


L(1,1) = 1;

for k = 1 : n 
    for j = 1 : k-1
        if A(k, j) == 0 
           L(k, j) = 0; 
        else
            sum1 = 0;
            for i = 1 : j-1
                sum1 = sum1 + L(k,i)*U(i,j);
            end    
                L(k, j) = 1/U(j, j)*(A(k, j) - sum1); 
        end
        L(k, k) = 1; 
    end
    for j = k : n 
        if A(k, j) == 0 
           U(k, j) = 0;
        else
            sum2 = 0;
            for i = 1 : k-1
                sum2 = sum2 + L(k, i)*U(i, j);
            end
            U(k, j) = A(k, j) - sum2;
        end
    end
end 
R = A - L*U;

disp('A:  ');
disp(A);
disp('L:  ');
disp(L);
disp('U: ');
disp(U);
disp('R: ');
disp(R);

