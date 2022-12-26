function result = computeFlow(img1, img2, search_radius, template_radius, grid_MN)
    % Check images have the same dimensions, and resize if necessary
    if find(size(img2) ~= size(img1))
        img2 = imresize(img2, size(img1));
    end
    % Get number of rows and cols for output grid
    M = grid_MN(1);
    N = grid_MN(2);

    [H, W] = size(img1);

    grid_y = round(linspace(template_radius+1, H-template_radius, M));
    grid_x = round(linspace(template_radius+1, W-template_radius, N));
   
    U = zeros(M, N);   
    V = zeros(M, N);    
    
    % compute flow for each grid patch
    for i = 1:M
        for j = 1:N
    
            col = grid_x(j);
            row = grid_y(i);
            
            % get the template area and search area
            template = img1(max(1, row - template_radius):min(H, row + template_radius),max(1, col - template_radius):min(W, col + template_radius));
            search_area = img2(max(1, row - search_radius):min(H, row + search_radius),max(1, col - search_radius):min(W, col + search_radius));
                
            % calculate the correlation map and find ints peak
            corr_map = normxcorr2(template, search_area);
            [max_val, max_ind] = max(corr_map(:));

            % Convert the index into row and col
            [max_ind_row, max_ind_col] = ind2sub(size(corr_map), max_ind);
            
            % calculate the vector
            U(i, j) = max_ind_col - (template_radius + search_radius);
            V(i, j) = max_ind_row - (template_radius + search_radius);
        end
    end
    
    % Any post-processing or denoising needed on the flow
    
    % plot the flow vectors
    fig = figure();
    imshow(img1);
    hold on; quiver(grid_x, grid_y, U, V, 2, 'y', 'LineWidth', 1.3);
    % From https://www.mathworks.com/matlabcentral/answers/96446-how-do-i-convert-a-figure-directly-into-an-image-matrix-in-matlab-7-6-r2008a
    frame = getframe(gcf);
    result = frame2im(frame);
    hold off;
    close(fig);
end