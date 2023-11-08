% Taking input for matrix A from the command-line
rows_A = input("Enter the number of rows for matrix A: ");
cols_A = input("Enter the number of columns for matrix A: ");

disp("Enter elements for matrix A:");

A = zeros(rows_A, cols_A); % Initializing matrix A with zeros

for i = 1:rows_A
    for j = 1:cols_A
        A(i, j) = input("Enter element: ");
    endfor
endfor

% Taking input for matrix B from the command-line
rows_B = input("Enter the number of rows for matrix B: ");
cols_B = input("Enter the number of columns for matrix B: ");

disp("Enter elements for matrix B:");

B = zeros(rows_B, cols_B); % Initializing matrix B with zeros

for i = 1:rows_B
    for j = 1:cols_B
        B(i, j) = input("Enter element: ");
    endfor
endfor

% Finding and displaying the maximum value in matrix A
max_value_A = max(A(:));
disp(["Maximum value in matrix A: ", num2str(max_value_A)]);

% Multiplying matrices A and B and handling the case where multiplication is not possible
if cols_A == rows_B
    result_matrix = A * B;
    disp("Resultant matrix after multiplication:");
    disp(result_matrix);
else
    disp("Multiplication is not possible. Number of columns in A must be equal to number of rows in B.");
end
% There is no user defined function
