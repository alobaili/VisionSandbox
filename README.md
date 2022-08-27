In this project I explored the capabilities of computer vision technologies in iOS.

I discovered there exists a framework called Vision that exposes the 
AI models already built in to iOS that contain many features such as 
face detection and image clasification.
These are the same models Apple themselves use for features like 
Siri's smart suggestions and advanced search in the Photos app.

I collected random images from YouTube videos about workshops to see 
if the Vision framework can help me answer these two questions:
1. Does the image contain a clearly visible vehicle?
1. Are there any faces in the image and what are their locations?
It turned out Vision can answer both questions with good accuracy.

Here’s a screenshot of my sample app where I tested the Vision framework:

<img src="https://user-images.githubusercontent.com/27203112/187046973-303beb0a-3644-4264-9eca-3c454b578288.png" height="700"/>

What this means is that we don’t actually need to embed a custom AI 
model in this case and just utilize the models already provided 
inside iOS.

Their face detection model uses object detection architecture to look 
for faces in the image and return the bounding box of the face 
location. I used it to draw a red rectangle on the face.

Their image classification model uses multi-lable classification model
than can put the image under multiple classes depending on the image 
contents, each class contains a confidence value betweet 0 and 1. I 
specifically target the “vehicle” class and if the confidence value is 
greater than 0.3, I assume the the image contains a clearly visible vehicle.
