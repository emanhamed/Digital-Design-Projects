function [toporder,jsondata] = digitalproject1(file)
[v1,v2,n,f] = parseVtn([file '.g.v']);
%following code creates and topologically sorts DAG, then graphs it
DG = sparse(v1,v2,true,n,n); 
toporder = graphtopoorder(DG);
bg = biograph(DG,f);
view(bg);
disp(toporder);
disp('Topological Sort ^');
%l1 = bg.nodes(1).position(2);
%level{d} = bg.nodes(1);
dolayout(bg);
for i=1:numel(bg.Nodes)
    somenum(i) = bg.nodes(i).position(2);
    ids{i,1} = bg.nodes(i).id;
end
x = fliplr(unique(somenum));

for i=1:numel(x)
    for j=1:numel(somenum)
    if (somenum(j)==x(i))
        ids{j,2} = ['Logical level ' num2str(i)];
    end
    end
end
jsondata = savejson(['module:' file],ids);
end
