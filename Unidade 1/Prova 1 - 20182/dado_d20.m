function R = dado_d20()

aleat = rand;
if aleat < 0.004
    R = 20;
else
    R = randi(20);
end
% R  = round(v);



end