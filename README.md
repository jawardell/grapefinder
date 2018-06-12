## Classifying and Counting Grapes using the Support Vector Machine Algorithm and Feature Detection

We used MATLAB CV tools' `imfindcircles()` to find grapes in a database of grape photos. We classified grapes through a human-trained SVM algorithm which used image features as classifiers. 

### How the Script Works
The MATLAB script accepts one image from the database. We call `imfindcircles()` on the image and place the coordinates and radii of the circles into separate arrays respectively. We iterate over both arrays and crop out a 2r x 2r image (where r is the radius), centered at the grape's x-y center-position, and ask the human if the image is of a grape. We extract the feature vectors, or descriptors, of the grapes and place them in an array. We train the SVM with the features array. Once the algorithm has been trained, we call `imfindcircles()` with a larger radius range to catch new circles for classification. We initially called the function on circles with smaller radii to remove outliers and only ask the human to train non-outliers. We iterate through the newly found circles and call the `svmclassify()` function on each one. If the svm classifies the circle as a grape, we plot, on the original image, a visual marker at the coordinate and display the final result.
<br><a href="https://www.ri.cmu.edu/ri-people/stephen-t-nuske/"><img src="https://github.com/jawardell/grapefinder/blob/master/img_2.png"></a>
<br><img src="https://github.com/jawardell/grapefinder/blob/master/img_3.png"><br><br>
### How to Use
- You will need MATLAB and MATLAB CV toolbox installed and configured.
- You will need to have the environment variable setup if you plan to use the terminal or command prompt.
- Execute the `grapes.m` script either in the MATLAB IDE or in the command line using `matlab grapes.m`.

### How the Images were Collected
The images were taken by an [Autonomous Vehicle for Specialty Crops](https://www.ri.cmu.edu/casc/ "Autonomous Vehicle for Specialty Crops") designed and created by [George Kantor](http://frc.ri.cmu.edu/~kantor/George_Kantors_Home_Page/Home.html "GEORGE KANTOR") and his graduate students. 
<br><img src="https://github.com/jawardell/grapefinder/blob/master/img_1.png"><br><br>
### Resources
[SVM](https://en.wikipedia.org/wiki/Support_vector_machine "SVM")<br>
[feature detection](https://en.wikipedia.org/wiki/Feature_detection_(computer_vision) "feature detection")<br>
[Hough Transform](https://en.wikipedia.org/wiki/Hough_transform "Hough Transform")<br>

------------



This was a group research project completed at Carnagie Mellon University's [OurCS](http://www.cs.cmu.edu/ourcs/Team_Leaders_and_Projects.html "OurCS") 2017.
