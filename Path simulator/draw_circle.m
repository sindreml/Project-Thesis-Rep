function draw_circle(center,search_radius,sample_points,my_axis)
    theta_traj = 0:(2*pi)/(sample_points):2*pi;
    x = search_radius * cos(theta_traj) + center(1);
    y = search_radius * sin(theta_traj) + center(2);
    for i = 1:length(x)
        axis([my_axis(1,1),my_axis(1,2),my_axis(1,3),my_axis(1,4)]);
        plot(x(i),y(i),'.k','MarkerSize',1);
        hold on;
        drawnow
    end
end
