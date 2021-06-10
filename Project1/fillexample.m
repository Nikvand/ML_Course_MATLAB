hx=1:0.1:2;
y1=1*ones(size(hx));
y2=2*ones(size(hx));

%plot(hx, y1, 'r', 'LineWidth', 2);
%plot(hx, y2, 'b', 'LineWidth', 2);
hx2 = [hx, fliplr(hx)];
inBetween = [y1, fliplr(y2)];
h=fill(hx2, inBetween, 'g');
set(h,'facealpha',.1)
hold on;

