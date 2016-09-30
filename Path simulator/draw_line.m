function draw_line(start_pos,destination,sample_points)
    x = linspace(start_pos(1),destination(1),sample_points);
    y = linspace(start_pos(2),destination(2),sample_points);
    for i = 1:length(x)
      % axis([my_axis(1,1),my_axis(1,2),my_axis(1,3),my_axis(1,4)]);
       plot(x(i),y(i),'.k','MarkerSize',1);
       hold on;
       drawnow
    end
end

