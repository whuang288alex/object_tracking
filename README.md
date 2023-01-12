# obejct_tracking

This is a vision system that is able to detect the movement of an object.We first determine an area of interest in image1, and search for the corresponding area in image2 by using template matching. To be more specific, template matching can be accomplish by MATLAB function "histcounts" by assuming that the intensity distribution of an object stays relatively the same. To save time, we only search for matching area in a defined search window.


