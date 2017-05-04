function dcdt = model(t, c, a, b)
%MODEL calculates next point of traectory for given model, params and step; 
%   t = time, c = vector of coordinates of current point; a, b = params of the model
dcdt = zeros(2,1);
dcdt(1) = a + (c(1)^2)*c(2) - (b+1)*c(1);
dcdt(2) = b*c(1) - (c(1)^2)*c(2);
end

