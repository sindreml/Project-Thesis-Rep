function axis = get_axis(object_list,search_radius)
    min_x = inf;
    max_x = -inf;
    min_y = inf;
    max_y = -inf;
    for i = 1:length(object_list(:,1))
        current_object = object_list(i,:);
        if current_object(1) > max_x 
            max_x = current_object(1);
        end
        if current_object(1) < min_x 
            min_x = current_object(1);
        end
        if current_object(2) > max_y 
            max_y = current_object(2);
         end
        if current_object(2) < min_y 
           min_y = current_object(2);
        end
    end
    axis = [min_x-search_radius,max_x+search_radius,min_y-search_radius,max_y+search_radius];
end