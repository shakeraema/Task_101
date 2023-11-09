function retval = Task_103(input1, input2)

  % Defining the function
    f = @(x) x.^3 - x.^2 - 2;

    % Define the interval [a, b] where you expect the root to be
     a = 1;
     b = 2;
  % Setting the tolerance for convergence
    tolerance = 1e-5;
    % Taking matrix for storing value
    M = [];

  while (b - a ) / 2 > tolerance
      c = (a * f(b) - b * f(a)) / (f(b) - f(a));
      M =[M; c];
      if f (c) == 0
        break;
      elseif f(a) * f(c) < 0
        b = c;
      else f(b) * f(c) < 0
        a = c;
      end
    end
    % Update the root
    root = M(end);


  % Plotting the function and roots
  x = linspace (1, 2, 50);
  y = f(x);
  figure;
  plot (x, y, 'LineWidth',2);
  hold on;
  scatter(M, f(M), 40, 'r', 'filled'); % Plot roots
  xlabel('x');
  ylabel('f(x)');
  title('False-Position Method: Finding Roots');
  legend('Function', 'Roots');
  grid on;
  hold off;


  retval = root;
endfunction
