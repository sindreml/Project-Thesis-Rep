function ice_bergs = get_ice_bergs(grid_dimension,cell_length,ice_berg_prop)    
    states = zeros(grid_dimension(1),grid_dimension(2));
    for idx = 1:numel(states)
        x = rand;
        if x <= ice_berg_prop
            states(idx) = 2;
        else
            states(idx) = 1;
        end   
    end
    ice_bergs = [];
    for i=1:length(states(:,1))
        for j=1:length(states(1,:))
            if states(i,j) == 2
                ice_bergs = [ice_bergs;i j];
            end
        end
    end
end
