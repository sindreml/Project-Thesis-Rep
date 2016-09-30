function traverse_path(vessel_position, path,uav_speed)
    path = [vessel_position; path];   
    for i = 1:length(path(:,1))-1
        current_pos = path(i,:);
        destination = path(i+1,:);
        time = 1000* (sqrt((current_pos(1)-destination(1))^2 + (current_pos(2)-destination(2))^2)) / uav_speed ; %Multiply with 1000 since this is in km
        x = linspace(current_pos(1),destination(1),time);
        y = linspace(current_pos(2),destination(2),time);
        point_plot = [];
        for j = 1: length(x)
            delete(point_plot);
            point_plot = plot(x(j),y(j),'.r','MarkerSize',40);
            drawnow;
        end
        delete(point_plot);
    end
end
