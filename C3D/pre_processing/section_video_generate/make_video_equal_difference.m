clear
clc
% ԭʼĿ¼
root = [{'../example_data/IsoGD_phase_1/train/'},{'../example_data/IsoGD_phase_2/test/'}];
% Ŀ��Ŀ¼
dest = [{'../../data/train_RGB_section/'},{'../../data/test_RGB_section/'}];
dest2 = [{'../../data/train_depth_section/'},{'../../data/test_depth_section/'}];
% ������Ƶ��ַ
flow = [{'../example_data/train_flow_original/'},{'../example_data/test_flow_original/'}];

% �����Ƶ ����������Ŀ¼
for i = 1:length(root)
%for i = 1:2
    longmao = root(i);
    totoro = dest(i);
    totoro2 = dest2(i);
    yiran = flow(i);
    % �õ�һ��Ŀ¼ 001 002
    direct = dir(longmao{1});
    for j = 3:length(direct)
        disp(['folder ',num2str(j-2)])
    %for j = 3:5
        if direct(j).isdir == 1 
            directs = [longmao{1},direct(j).name];                      % ��ȡһ��Ŀ¼����
            % directs
            direct2 = dir(directs);                                     % �õ���Ƶ��ַ����
            % ����Ŀ¼��M_0001.avi
            for k = 3:length(direct2)
                video = [directs,'/',direct2(k).name];        % ��ȡ��Ƶ�����ַ
                video_name = direct2(k).name;
                if video_name(1) == 'M'
                    dest_floder = [totoro{1},direct(j).name];               % Ŀ���ַĿ¼
                else
                    dest_floder = [totoro2{1},direct(j).name];               % Ŀ���ַĿ¼
                end
                if ~exist(dest_floder,'dir') 
                    mkdir(dest_floder)                                  % �������ڣ��ڵ�ǰĿ¼�в���һ��Ŀ¼
                end
                Mobj = VideoReader(video);                              % ��ȡ��Ƶ
                numFrames = Mobj.NumberOfFrames;
                rate = Mobj.FrameRate;
                Mvideo = read(Mobj);
                fVideoPath = [yiran{1},direct(j).name,'/F',direct2(k).name(2:end)];  % ����õ�������Ƶ��ַ
                
                [samp] = section_uniform_random_sampling(fVideoPath,32);
                %д��Ƶ
                wMObj = VideoWriter([dest_floder,'/',direct2(k).name]);
                wMObj.FrameRate = rate;
                open(wMObj);
                for len = 1:length(samp)
                    Mimg = Mvideo(:,:,:,samp(len));
                    writeVideo(wMObj,Mimg);
                end
                wDObj = VideoWriter([dest_floder,'/',direct2(k).name]);
                
                close(wMObj);
                fclose all;
                
            end
        end
    end
end


