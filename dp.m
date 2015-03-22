clc; clear;
mod = regexprep(perl('newmod.pl','booth.g.v'),' ','');
lr = importdata('lib.mat');
lrio = importdata('libio.mat');
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
 mm{z} = mm{z}(rtt(1)+1:end);
 tta = strsplit(a{z},'-'); tta = tta(1:end-1);
 ta1 = strfind(mm{z},'(');
 ta1 = ta1(1);
 ta2 = strfind(mm{z},')');
 ta2 = ta2(1);
 found = mm{z}(ta1+1:ta2-1);
 z = z + 1;
 end
 end
 end
end


%mod(a(1):(a(1)+numel(lr{1})));