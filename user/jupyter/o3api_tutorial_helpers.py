##############################################################
# Set of helper functions for the tutorial on O3as / o3api
##############################################################

def simple_plot(data, legend=False):
    """Function to produce a plot based on the retrieved JSON data
    
    :param data: input data
    :type data: list
    """
    
    # convert list of dictionaries into Pandas plot
    for curve in data:
        plt.plot(pd.to_datetime(curve['x']), curve['y'], label=curve['model'])

    # create legend if requested
    if legend:
        ax = plt.gca() # get axis instance
        ax_pos = ax.get_position() # get the axes position
        num_col = len(data) // 12
        num_col = num_col if (num_col % 12 == 0 and num_col > 0 ) else num_col + 1
        handles, labels = ax.get_legend_handles_labels()
        plt.legend(handles=handles,
                loc='upper center', 
                bbox_to_anchor=[0., ax_pos.y0-0.1, 0.99, 0.3],
                ncol=num_col, fancybox=True, fontsize='small',
                borderaxespad=0.)
    plt.show