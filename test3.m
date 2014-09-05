clc

pt = 21;
o = 1;
for n = 1:1:length(object_hist)                        %for number of video frames
    for m = 1:1:length(object_hist(n).objects)         %for number of objects in video frame
        label = object_hist(n).objects(m).label;
        if (pt == label)
            object_hist(n).objects(m)
            xpos(o) =  mean([object_hist(n).objects(m).bbox_x(1), object_hist(n).objects(m).bbox_x(2)]);
            ypos(o) =  mean([object_hist(n).objects(m).bbox_y(1), object_hist(n).objects(m).bbox_y(2)]); 
            o = o+1;
        end
    end
end

figure(2)
plot(xpos,ypos)
hold off
pause(1)
