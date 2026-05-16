function [i] = resistor(u,temp)

if length(temp) > 1
    disp('a temperatura deve ser um escalar')
    disp('a temperatura deve ser um escalar')
    disp('a temperatura deve ser um escalar')
    disp('a temperatura deve ser um escalar')
    disp('a temperatura deve ser um escalar')
    disp('a temperatura deve ser um escalar')
    disp('a temperatura deve ser um escalar')
else
    r = -0.05*temp.^2 + 2*temp + 1000;
    i = u./r; 
    i = i + 0.1*max(i)*(rand(size(i)) - 0.5);
end

end