function draw_objects(object_list)
    for i = 1:length(object_list(:,1))
        object = object_list(i,:);
        set(gca,'Color',[0.8 1 1]);
    %    axis([my_axis(1,1),my_axis(1,2),my_axis(1,3),my_axis(1,4)])
        plot(object(1),object(2),'.r','MarkerSize',50)
        hold on;
    end
end
