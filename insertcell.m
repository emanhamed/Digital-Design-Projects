function c = insertcell(c,ins,idx)
if (idx<=numel(c))
c = [c(1:idx-1) {ins} c(idx:numel(c))];
else
c = [c {ins}];
end
end
