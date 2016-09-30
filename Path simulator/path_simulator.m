% Simulates the path taken by the UAV. 
start_position = [0 0];
sample_points = 100;
sample_time = 0.01;
search_radius = 1;
object_list = [start_position ; -2 3;-4 -1;-1 -3;3 -3; 5 -1;-5 -7; 5 5; -5 10];
axis = get_axis(object_list,search_radius);
plot(randn(100,1));
%set(gca,'Color',color);
draw_objects(object_list,axis);
pause(0.5);
for k = 1:length(object_list(:,1))-1
    start_position = object_list(k,:);
    destination = object_list(k+1,:);
    current_position = start_position;
    draw_line(start_position,destination,sample_points,axis);
    center = destination;
    draw_circle(center,search_radius,sample_points,axis);
end

 
