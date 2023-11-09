function retval = Task_104(input1, input2)
    % Define the function and its derivative
    f = @(x) x.^2 - 4;
    df = @(x) 2*x;

    % Initial guess for the root
    x = input1;  %Inputs are like (2,2),(1,2.5),(3,13/6),(4,2.5),(5,2.9) etc.

    % Set the tolerance for convergence
    tolerance = 1e-6;

    % Initialize variables
    iterations = 0;
    root = x;

    % Create vectors to store data for plotting
    x_values = [];
    y_values = [];

    % Newton-Raphson algorithm
    while abs(f(root)) > tolerance
        % Calculate the tangent line
        tangent = df(root) * (input2 - root) + f(root); % As we know input2= input1 -(f(input1)/df(input1))

        % Update root estimate
        root = root - f(root) / df(root);

        % Store data for plotting
        iterations = iterations + 1;
        x_values = [x_values, iterations];
        y_values = [y_values, root];

        % Plot the function and tangent line for each iteration
        x = linspace(min(y_values) - 1, max(y_values) + 1, 1000);
        y = f(x);

        figure;
        plot(x, y, 'LineWidth', 2); %plot the function
        hold on;
        scatter(y_values, f(y_values), 50, 'k', 'filled'); % Plot roots
        plot([input2, root], [f(input2), tangent], '--','LineWidth', 2); % Plot tangent line
        xlabel('x');
        ylabel('f(x)');
        title(['Newton-Raphson Method: Iteration ', num2str(iterations)]);
        legend('Function', 'Roots', 'Tangent Line');
        grid on;
        hold off;
    end

    fprintf('Root found after %d iterations: %f\n', iterations, root);
    fprintf('Roots Matrix:\n');
    disp(y_values);

    retval = root;
endfunction
