function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
%deriv = ((X*theta - y)'*X)';
%theta = theta - alpha*deriv;
    % ============================================================
  theta_old = theta;

    % number of features.
    p = size(X, 2);
    p = size(theta,1);

    % simultaneous update theta using theta_prev.
    for j = 1:p

        % % calculate dJ/d(theta_j)
        % % initial version
        % deriv = 0;
        % for i = 1:m
          % deriv = deriv + (theta_prev'*X(i, :)'-y(i))*X(i, j);
        % end
        % deriv = deriv/m;

        % calculate dJ/d(theta_j)
        % vectorized version
        % (exactly the same with multivariate version)
        deriv = ((X*theta_old - y)'*X(:, j))/m;

        % update theta_j
        theta(j) = theta_old(j)-(alpha*deriv);
    end
    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end

end
