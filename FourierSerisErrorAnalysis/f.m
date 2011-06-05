function y = f(x)

if ((x >= -1) && (x < 0))
    y = x + 1;

elseif ((x >= 0) && (x < 1))
    y = 1 - x;
    
elseif (x >= 1)
    y = (x - 2) + 1;

elseif (x <= -1)
    y = 1 - (x + 2);

else
y = 999

end

end