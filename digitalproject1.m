clear; clc;
[names,types] = parseVtn('booth.g.v');

%following code creates and topologically sorts DAG, then graphs it
%DG = sparse(vertices1,vertices2,true,numel(newn),numel(newt)); 
%order = graphtopoorder(DG);
%DG = DG(order,order);
%view(biograph(DG));
