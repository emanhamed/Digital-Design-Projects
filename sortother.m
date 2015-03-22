function c = sortother(x,c)

n = length(x);
while (n > 0)
    % Iterate through x
    nnew = 0;
    for i = 2:n
        % Swap elements in wrong order
        if (x(i) < x(i - 1))
            x = swap(x,i,i - 1);
            c = swapc(c,i,i - 1);
            nnew = i;
        end
    end
    n = nnew;
end


function x = swap(x,i,j)
% Swap x(i) and x(j)
% Note: In practice, x xhould be passed by reference

val = x(i);
x(i) = x(j);
x(j) = val;

function c = swapc(c,i,j)
% Swap x(i) and x(j)
% Note: In practice, x xhould be passed by reference

val1 = c(i);
c(i) = c(j);
c(j) = val1;
