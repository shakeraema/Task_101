function retval = root_finding_bisection(input1, input2)
    % Defining the function
    f = @(x) x.^2 - 4;  % my octave doesn't support x^2

    % Defining the interval [a, b] where you expect the root to be
    a = 0;
    b = 6;

    % Setting the tolerance for convergence
    tolerance = 1e-6;

    % Initializing variables
    iterations = 0;
    root = 0;

    % Creating vectors to store data for plotting
    x_values = [];
    y_values = [];

    % Bisection algorithm
    while (b - a) / 2 > tolerance
        x = (a + b) / 2;
        if f(a) * f(x) < 0
            b = x;
        else
            a = x;
        end

        % Storing data for plotting
        iterations = iterations + 1;
        x_values = [x_values, iterations];
        y_values = [y_values, x];

        % Updating root estimate
        root = (a + b) / 2;
    end

    fprintf('Root found after %d iterations: %f\n', iterations, root);
    fprintf('y_values = [');
    for i = 1:length(y_values)
        fprintf('%f\n', y_values(i));
    end
    fprintf(']\n');

    % Plotting the function and roots for visualization
    x = linspace(min(y_values) - 1, max(y_values) + 1, 1000);
    y = f(x);

    figure;
    plot(x, y, 'LineWidth', 2);
    hold on;
    scatter(y_values, zeros(size(y_values)), 50, 'r','filled'); % Plot roots
    xlabel('x');
    ylabel('f(x)');
    title('Bisection Method: Finding Roots');
    legend('Function', 'Roots');
    grid on;
    hold off;

    retval = root;
endfunction
