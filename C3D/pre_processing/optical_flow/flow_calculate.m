function [flowimg] = flow_calculate(Mvideo)

       [~,~,~,numFrames]=size(Mvideo);
                im1 = Mvideo(:,:,:,1);
               flows = zeros(240,320,3,numFrames-1);
               flowimg = zeros(240,320,3,numFrames-1);
               maxdiffs=zeros(1,numFrames-1);

               for len = 2:numFrames
                   im2 = Mvideo(:,:,:,len);
                   flow = mex_OF(double(im1),double(im2));

                    scale = 16;
                    mag = sqrt(flow(:,:,1).^2+flow(:,:,2).^2)*scale+128;
                    mag = min(mag, 255); 
                    flow = flow*scale+128;
                    flow = min(flow,255);
                    flow = max(flow,0);

                    [x,y,z] = size(flow);
                    flow_image = zeros(x,y,3);
                    flow_image(:,:,1:2) = flow;
                    flow_image(:,:,3) = mag;


        %             writeVideo(wFObj,flow_image./255);
%                     figure,imshow(flow_image./255)
                    flowimg(:,:,:,len-1)=flow_image./255;
                    flows(:,:,:,len-1)=abs(double(flow_image)/255-0.5);
%                     figure,imshow(flows(:,:,:,len-1))
                    maxdiffs(len-1) = max(max(max(flows(:,:,:,len-1))))/128;                                                
                    im1 = im2;

               end
end