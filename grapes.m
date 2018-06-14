I=imread('1.jpg');
[pts, radii]=imfindcircles(I,[5 30],'Sensitivity',0.9);
features = [];
labels=[];
count = 1;
for i=1:length(pts)
     pts(i,:)
     radii(i)
     try
       part = I(pts(i,2)-radii(i):pts(i,2)+radii(i),pts(i,1)-radii(i):pts(i,1)+radii(i),:);
       imshow(part);
       Y=input('Grape? (1 for Yes, 2 for No)');
       
       feature = extractFeatures(rgb2gray(I),pts(i,:));
       if(length(feature) > 100)
           fprintf('000'); 
            labels(count)=Y;
            count = count+1;
            features = [features;feature];
       end
     catch
         disp('Out of bounds, skipping...')
     end
end
options.MaxIter = 100000;
model = svmtrain(double(features),labels','Options',options);
I=imread('1.jpg');
[pts, radii]=imfindcircles(I,[10 30],'Sensitivity',0.9);
figure()
imshow(I);hold on
for i=1:length(pts)
    part = I(pts(i,2)-radii(i):pts(i,2)+radii(i),pts(i,1)-radii(i):pts(i,1)+radii(i),:);
       feature = extractFeatures(rgb2gray(I),pts(i,:));
       if(length(feature) > 100)   
           g = svmclassify(model,double(feature));    
           if g ==1
               plot(pts(i,1),pts(i,2),'*','Color','red')
           end 
       end
end
