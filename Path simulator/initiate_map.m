function initiate_map(problem_dimension,cell_length,simFigure)
hold on;
axis([-cell_length/2 problem_dimension(1)+1.5*cell_length -cell_length/2 problem_dimension(2)+1.5*cell_length]);
grid on
set(gca,'XTick',(cell_length/2):cell_length:problem_dimension(1)+1,'YTick',(cell_length/2):cell_length:problem_dimension(2)+1);
xlabel('East [km]');
ylabel('North [km]');
title('Simulation of search and track algorithm');
end
