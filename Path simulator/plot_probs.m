function states_plot = plot_probs(states,states_plot)
for i = 1:length(states(:,1))
    for j = 1:length(states(1,:))
        try
            delete(states_plot(i,j));
            states_plot(i,j) = text(i,j,num2str(states(i,j)));
        catch
            states_plot(i,j) = text(i,j,num2str(states(i,j)));
        end
    end
end