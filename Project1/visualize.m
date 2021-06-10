function visualize(handle,class,k,x1,x2,pitch)

hold on;
[regx,regy]=meshgrid(min(x1):pitch:max(x1),min(x2):pitch:max(x2));

for i=2:numel(regx)
    pmid = [regx(i)-pitch/2,regy(i)-pitch/2];
    type = knn_classfier(pmid,class,k);
    if type==1
        hx=regx(i):pitch:regx(i)+pitch;
        y1=(regy(i)-pitch)*ones(size(hx));
        y2=(regy(i)+pitch)*ones(size(hx));
        %plot(hx, y1, 'r', 'LineWidth', 2);
        %plot(hx, y2, 'b', 'LineWidth', 2);
        hx2 = [hx, fliplr(hx)];
        inBetween = [y1, fliplr(y2)];
        h=fill(hx2, inBetween, 'r','LineStyle','none');
        set(h,'facealpha',.1)
        hold on;


    else
         hx=regx(i):pitch:regx(i)+pitch;
        y1=(regy(i)-pitch)*ones(size(hx));
        y2=(regy(i)+pitch)*ones(size(hx));
        %plot(hx, y1, 'r', 'LineWidth', 2);
        %plot(hx, y2, 'b', 'LineWidth', 2);
        hx2 = [hx, fliplr(hx)];
        inBetween = [y1, fliplr(y2)];
        h=fill(hx2, inBetween, 'b','LineStyle','none');
        set(h,'facealpha',.1)
        hold on;

    end
end
title(['Decision regions for k = ',num2str(k)])
