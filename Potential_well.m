function [v] = H(X)
v = -5*(heaviside(X-4)-heaviside(X-6));
end

