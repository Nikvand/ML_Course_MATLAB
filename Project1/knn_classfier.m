function [type,d] = knn_classfier(p1,class,k)
if nargin<2
    assert("error need more than one arguments");
end
if nargin==2
    k=4;
end
d = zeros(1,numel(class));
label = zeros(1,numel(class));
for i=1:1:numel(class)
    x=class{i};
    d(i) = sqrt((p1(1)-x(1))^2+(p1(2)-x(2))^2);
    label(i) = x(3);
end
[~,indx] = sort(d);
votes = label(indx(1:k));
typeOne = numel(votes(votes==1));
typeTwo = numel(votes(votes==0));
if(typeOne>typeTwo)
    type = 1;
else
    type = 0;
end
return;
