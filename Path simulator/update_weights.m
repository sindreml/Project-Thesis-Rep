function weights = update_weights(problem_dimension,weather_data,vessel_position)
    weights = zeros(problem_dimension(1),problem_dimension(2),4);
    for i = 1:problem_dimension(1)
        for j = 1:problem_dimension(2)
            grid_centre = [i j];
            distance = sqrt((vessel_position(1)-grid_centre(1))^2 + (vessel_position(1)-grid_centre(2))^2);
            direction = [weather_data(i,j,1) weather_data(i,j,2)];
            [x_intersect,y_intersect] = check_intersection(vessel_position,grid_centre,direction,distance);
            if ~isempty(x_intersect)
               if length(y_intersect) > 1
                   distance_intersection_point = sqrt((x_intersect(1)-x_intersect(2))^2 + (y_intersect(1)-y_intersect(2))^2); %max distance is 1 here.
                   direction_weight = 0.5 + distance_intersection_point;
               else
                  direction_weight = 0.5;
                  % distance_weight = distance
               end
            else
                direction_weight = 0;
            end
            weights(i,j,3) = 2*direction_weight - distance; %Forvirrende når man ser på grid
            %Functionality for the weights of the known ice_bergs has to be
            %added here as well   
        end
    end 
end