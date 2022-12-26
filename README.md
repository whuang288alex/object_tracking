# obejct_tracking

This is a vision system that is able to detect the movement of an object. Below are some results of the system.

![output_video](https://user-images.githubusercontent.com/91099638/209491420-30834e51-15fb-48f7-8653-a6a2ce169b5d.gif)
![output_video (1)](https://user-images.githubusercontent.com/91099638/209491431-c40659b0-42c2-45c3-b044-00e73573d1b3.gif)

We first determine an area of interest in image1, and search for the corresponding area in image2 by using template matching. To be more specific, template matching can be accomplish by MATLAB function "histcounts" by assuming that the intensity distribution of an object stays relatively the same. To save time, we only search for matching area in a defined search window.
