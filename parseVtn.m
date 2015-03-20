function [newnames,newtypes] = parseVtn(filename)
newn = perl('new.pl',filename);
newt = perl('newtypes.pl',filename);
names = strsplit(newn,' '); names(numel(names)) = [];
types = strsplit(newt,' '); types(numel(types)) = [];
newnames = names;
newtypes = types;
tn = 0;
for i=1:numel(names)
if (not(isempty(strfind(names{i+tn},'['))))
    t = strsplit(names{i+tn},'[');
    thename = t{1};
    t = strsplit(t{2},']');
    t = strsplit(t{1},':');
    mini = min(t);
    maxi = max(t);
  
    for j=mini:maxi
        if (j==mini)
            newnames{i+tn} = [thename '[' num2str(j) ']'];
        else
        newnames = insertcell(newnames,[thename '[' num2str(j) ']'],i+tn);
        newtypes = insertcell(newtypes,types{i},i+tn);
        end
        tn = tn + 1;
    end
    tn = tn-1;
    names = newnames;
end
end
end