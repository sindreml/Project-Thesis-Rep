%Simulator for å simulere søk og tracking
clf;
clear all;
%Defining problem parameters
problem_dimension = [20,20]; % [km]
cell_length = 1;
vessel_position = [10,10];
ice_berg_prop = 0.1;
initial_states = zeros(problem_dimension(1),problem_dimension(2),4);

%Get the reference ice_bergs and their coodinates
while true
   ice_bergs = get_ice_bergs(problem_dimension,cell_length,ice_berg_prop);
   if ~isempty(ice_bergs)
      break
   end
end

%Initiating map. Setting grid and axis
initiate_map(problem_dimension,cell_length);

%Ploting ice bergs and vessel
plot(ice_bergs(:,1),ice_bergs(:,2),'.b','MarkerSize',20);
plot(vessel_position(1),vessel_position(2),'*r','MarkerSize',20);
%patch([0 0.5 1 0],[0 0.5 0 0],'g'); %farger et polygon. kan bruke denne til å lage isfjellene midt i rutene


%Wind & current model
weather_data = zeros(problem_dimension(1),problem_dimension(2),2);
for i = 1: length(weather_data(:,1,1))
    for j=1: length(weather_data(1,:,1))
        if i > (problem_dimension(1) / 2) 
            if j > (problem_dimension(1) / 2)
                weather_data(i,j,1) = -0.3;
                weather_data(i,j,2) = -0.5;
            else
                weather_data(i,j,1) = 0.5;
                weather_data(i,j,2) = -0.5;
            end
        else 
             if j > (problem_dimension(1) / 2)
                weather_data(i,j,1) = -.5;
                weather_data(i,j,2) = 0;
            else
                weather_data(i,j,1) = 0;
                weather_data(i,j,2) = -.5;
             end
        end
    end
end

for i = 1: problem_dimension(1)
    for j=1: problem_dimension(2)
        quiver(i,j,weather_data(i,j,1),weather_data(i,j,2),'color','g','LineWidth',0.8,'MaxHeadSize',0.5);
        hold on; 
    end
end

%Test for å traversere pathen
uav_speed = 100; % m/s
%traverse_path(vessel_position,ice_bergs,uav_speed);

%simulation start. only one iteration now.

%update_weights.
weights = update_weights(problem_dimension,weather_data,vessel_position);

%fly path with highest weight
path = [];
for i =1: problem_dimension(2)
    for j =1: problem_dimension(1)
        if weights(i,j,3) > -5
          path = [path;i j]; 
        end
    end
end
traverse_path(vessel_position, path,uav_speed);