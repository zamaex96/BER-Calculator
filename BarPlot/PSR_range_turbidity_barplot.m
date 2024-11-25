% Script to calculate percentage of 1s in CSV files
% Specify the directory containing CSV files
input_directory = 'C:\BU Lab Assets\Local Disk\Em Docs\Research Work\Post_course\Multi-Hop UWOC\Plots\LoggedData -RAW\SesnorDataLog';

% Verify directory exists
if ~exist(input_directory, 'dir')
    error('Directory does not exist: %s', input_directory);
end

% Get list of CSV files in the directory
csv_files = dir(fullfile(input_directory, '*.csv'));

% Check if any CSV files found
if isempty(csv_files)
    error('No CSV files found in the specified directory');
end

% Initialize results storage
results = struct('filename', {}, 'total_values', {}, 'ones_count', {}, 'ones_percentage', {});

% Initialize arrays for plotting
filenames = {};
ones_percentages = [];

% Loop through each CSV file
for i = 1:length(csv_files)
    % Full file path
    full_file_path = fullfile(csv_files(i).folder, csv_files(i).name);
    
    % Debugging: Print full file path
    fprintf('Processing file: %s\n', full_file_path);
    
    try
        % Try multiple methods to read the file
        % Method 1: readtable (often more reliable)
        data_table = readtable(full_file_path);
        
        % Check if table is empty
        if istable(data_table) && ~isempty(data_table)
            % Convert table to numeric array
            data = table2array(data_table);
        else
            warning('Empty table for file: %s', csv_files(i).name);
            continue;
        end
        
        % Ensure numeric data
        if ~isnumeric(data)
            warning('Non-numeric data in file: %s', csv_files(i).name);
            continue;
        end
        
        % Calculate total number of values
        total_values = numel(data);
        
        % Count number of 1s (strict equality)
        ones_count = nnz(data == 1);
        
        % Calculate percentage of 1s
        ones_percentage = (ones_count / total_values) * 100;
        
         % Store results for plotting (remove .csv extension)
        filenames{end+1} = extractBefore(csv_files(i).name, '.csv');
        ones_percentages(end+1) = ones_percentage;
        
        % Store results
        results(i).filename = csv_files(i).name;
        results(i).total_values = total_values;
        results(i).ones_count = ones_count;
        results(i).ones_percentage = ones_percentage;
        
        % Display results for each file
        fprintf('File: %s\n', csv_files(i).name);
        fprintf('Total Values: %d\n', total_values);
        fprintf('Number of 1s: %d\n', ones_count);
        fprintf('Percentage of 1s: %.2f%%\n\n', ones_percentage);
        
    catch ME
        % Detailed error handling
        fprintf('Error processing file %s:\n', csv_files(i).name);
        fprintf('Error Message: %s\n', ME.message);
        fprintf('Error Identifier: %s\n', ME.identifier);
        
        % Print stack trace for debugging
        for j = 1:length(ME.stack)
            fprintf('File: %s\n', ME.stack(j).file);
            fprintf('Name: %s\n', ME.stack(j).name);
            fprintf('Line: %d\n', ME.stack(j).line);
        end
    end
end

% Optional: Create a summary table
if ~isempty(results)
    % Remove empty entries
    results = results(~cellfun('isempty', {results.filename}));
    
    summary_table = struct2table(results);
    disp('Summary of Results:');
    disp(summary_table);
    
    % Optional: Save results to a CSV file
    writetable(summary_table, fullfile(input_directory, 'psr_summary.csv'));
    fprintf('Summary saved to: %s\n', fullfile(input_directory, 'psr_summary.csv'));
end

% Create Bar Plot
if ~isempty(filenames)
      % Sort percentages in descending order
    [sorted_percentages, sorted_indices] = sort(ones_percentages, 'descend');
    sorted_filenames = filenames(sorted_indices);

    % Create figure
    figure('Position', [100, 100, 1200, 600]);
    
    % Create bar plot
    b = bar(sorted_percentages);

    % Color customization
   b.FaceColor = 'flat';
  % b.CData = jet(length(filenames));  % Use jet colormap

% Different color schemes
% b.CData = cool(length(sorted_filenames));
 b.CData = hsv(length(sorted_filenames));
% b.CData = parula(length(sorted_filenames));

% Adjust bar width
   b.BarWidth = 0.6;
    
    % Customize plot
    %title('Percentage of 1s in CSV Files', 'FontSize', 16);
    xlabel('Parameter', 'FontSize', 14);
    ylabel('PSR (%)', 'FontSize', 14);
    ylim([0 110]);
    % Rotate x-axis labels
    set(gca, 'XTick', 1:length(sorted_filenames), 'XTickLabel', sorted_filenames);
    xtickangle(45);
    
    % Add value labels on top of each bar
    for i = 1:length(sorted_percentages)
        text(i, sorted_percentages(i), num2str(sorted_percentages(i), '%.2f%%'), ...
            'HorizontalAlignment', 'center', ...
            'VerticalAlignment', 'bottom');
    end
    
    % Adjust layout
    grid on;
    box on;
    
    % Adjust figure for better visibility
    set(gcf, 'Color', 'white');
    
    % Optional: Save the plot
    saveas(gcf, fullfile(input_directory, 'psr_percentage_bar_plot.png'));
    fprintf('Plot saved to: %s\n', fullfile(input_directory, 'psr_percentage_bar_plot.png'));
end