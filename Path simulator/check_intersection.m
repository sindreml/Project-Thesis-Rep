function [x_intersect,y_intersect] = check_intersection(vessel_position,grid_centre,direction,distance)
    direction = (direction / norm(direction))*2*distance;
    vessel_grid_x = [vessel_position(1)-0.5, vessel_position(1) - 0.5, vessel_position(1) + 0.5, vessel_position(1) + 0.5];
    vessel_grid_y = [vessel_position(2)-0.5, vessel_position(2) + 0.5, vessel_position(2) + 0.5, vessel_position(2) - 0.5];
    line_x = [grid_centre(1), grid_centre(1) + direction(1)];
    line_y = [grid_centre(2), grid_centre(2) + direction(2)];
    [x_intersect, y_intersect] = polyxpoly(line_x,line_y,vessel_grid_x,vessel_grid_y);
end
