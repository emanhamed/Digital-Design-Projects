function [vec1,vec2,number,fullname] = parseVtn(filename)
newn = perl('new.pl',filename);
newt = perl('newtypes.pl',filename);
mod = regexprep(perl('newmod.pl',filename),' ','');
lr = importdata('lib.mat');
lrio = importdata('libio.mat');
names = strsplit(newn,' '); names(numel(names)) = [];
types = strsplit(newt,' '); types(numel(types)) = [];
newnames = names;
newtypes = types;
tn = 0; uni = 1; vm = 1;
for i=1:numel(names)
    newnums(uni) = uni;
    uni = uni+1;
end
for i=1:numel(names)
if (not(isempty(strfind(names{i+tn},'['))))
    t = strsplit(names{i+tn},'[');
    thename = t{1};
    t = strsplit(t{2},']');
    t = strsplit(t{1},':');
    for k=1:numel(t)
        t{k} = str2double(t{k});
    end
    mini = min([t{:}]);
    maxi = max([t{:}]);
  
    for j=mini:maxi
        if (j==mini)
            newnames{i+tn} = [thename '[' num2str(j) ']'];
        else
        newnames = insertcell(newnames,[thename '[' num2str(j) ']'],i+tn);
        newtypes = insertcell(newtypes,types{i},i+tn);
        newnums = insertarr(newnums,uni,i+tn);
        uni = uni+1;
        end
        tn = tn + 1;
    end
    tn = tn-1;
    names = newnames;
end
end

n = numel(lr);
z = 1;

for i=1:n
 tx = strfind(mod,lr{i});
 if ((not(isempty(tx))))
 for j=1:numel(tx)
 if (not((strcmp(lr{i}(1:2),'OR')) && (strcmp(mod(tx(j)-1),'N')||strcmp(mod(tx(j)-1),'X'))))
 a{z} = lrio{i};
 c{z} = tx(j);
 b{z} = lr{i};
 mmt = mod((c{z}+numel(lr{i})):end);
 rt = strfind(mmt,');');
 rt = rt(1);
 mm{z} = mmt(1:rt+1);
 rtt = strfind(mm{z},'(');
 d{z} = mm{z}(1:rtt(1)-1);
 othernums(z) = uni;
 uni = uni + 1;
 mm{z} = mm{z}(rtt(1)+1:end);
 

 z = z + 1;
 end
 end
 end
end

for i=1:numel(a)
 tta = strsplit(a{i},'-'); tta = tta(1:end-1);
 for k=1:numel(tta)
 ta1 = strfind(mm{i},'(');
 ta1 = ta1(1);
 ta2 = strfind(mm{i},')');
 ta2 = ta2(1);
 found = mm{i}(ta1+1:ta2-1);
 mm{i} = mm{i}(ta2+1:end);
 for j=1:numel(newnames)
 if (strcmp(found,newnames{j}))
     if (strcmp(tta{k},'1'))
         vec1(vm) = newnums(j);
         vec2(vm) = othernums(i);
     else
         vec2(vm) = newnums(j);
         vec1(vm) = othernums(i);
     end
     vm = vm+1;
 end
 end
 end
end
for i=1:numel(d)
    d{i} = [d{i} '(' b{i} ')'];
end
number = numel(d) + numel(newnames);
fullname = [newnames d];
fullnum = [newnums othernums];
fullname = sortother(fullnum,fullname);
end