function [samp] = section_uniform_random_sampling(fVideoPath,benchmark)
    %可以修改的值
    backgroundThreshold = 1;                                                % 背景杂声阈值
    subsectionStandard = 16;                                                % 分段标准
    firstWeight = 1;                                                      % 第一段权值
    lastWeight = 0.8;                                                       % 最后一段权值

    % 读取光流视频 及视频帧数
    fObj = VideoReader(fVideoPath);
    fNumFrames = fObj.NumberOfFrames;
    fVideo = read(fObj);
    fHeight = fObj.Height;
    fWidth = fObj.Width;
    
    flows = zeros(fHeight,fWidth,3);
    fFlows = zeros(1,fNumFrames);
    % 计算光流差 放入fFlows
    for len = 1:fNumFrames
        flow_image = fVideo(:,:,:,len);                                     % 每一帧光流图像
        flows(:,:,:)=abs(flow_image-128);                                   % 减去128 原始值
        out_num = sum(flows(:)>backgroundThreshold);                        % 计算大于1的光流值个数（1可作为阈值调整） 
        sum_fFlow(len) = int32(sum(sum(sum(flows(:,:,:))))/10000);                                               
        fFlows(len) = int32(sum(sum(sum(flows(:,:,:))))/out_num);                                                        % 计算平均光流值
    end
%     fNumFrames = 15;
%     benchmark = 32;
%     fFlows = [1:fNumFrames];
    % 根据计算结果 用分段均值随机的方式进行分割
    % 等于benchmark 则直接填充
    if fNumFrames == benchmark
        samp = 1:32;
        return ;
    end
    % 小于benchmark 则进行扩充   ??好像有bug（暂时没有发现之前写的bug是啥）
    if fNumFrames < benchmark
        samp = [];   
        times = floor(benchmark/fNumFrames);                                % 重复的次数
        residual = mod(benchmark,fNumFrames);                               % 剩余附加帧数
        temp = sort(fFlows,'descend');                                      % 倒叙排列取较大变化的帧数
        if residual ~= 0                                                    % 按照光流变化顺序 添加附加帧
            for i = 1:residual
                thr = temp(i);
                samp = [samp,find(fFlows==thr,1)];                           % 得到大于的下标
            end
        end
        for i=1:fNumFrames                                                  % 按照变数增加
            for j=1:times
                samp = [samp,i];
            end
        end
        samp = sort(samp);
        return ;
    end
     % 大于benchmark 进行分段均匀随机采样
    if fNumFrames > benchmark
        
        sectionNum = ceil(fNumFrames/subsectionStandard);                   % 分段数 此处进行向上取整 这样最后一段分得帧数少 同时使得16帧最少分三段
        %sectionNum = floor(fNumFrames/subsectionStandard);                  % 分段数 此处进行向下取整 使得最后一段很长但是会进行加权
        eachSectionNum = floor(fNumFrames/sectionNum);                      % 每段的帧数  ？？此处也有疑问 这样分比较平均
        %eachSectionNum = subsectionStandard;                                % 按照分段标准分段 进一步减少最后分段的帧数
        if sectionNum == 1                                                  % 如果只有一段 直接进行均匀随机
            samp = zeros(1,benchmark);
            ratio = fNumFrames/benchmark;                                   % 计算比例
            for i=1:benchmark
                iTmp = min(round(i*ratio),fNumFrames);                      % 获得均值位置
                samp(i) =max(iTmp + round(-1 + 2*rand(1)),1);               % [-1,1]之间进行随机扰动 防止取到0
            end
            samp = sort(samp);
            return ;
        else                                                                % 有很多段
            sumSectionFlow = zeros(sectionNum,5);                           % 1:光流总值 2:启示位置 3:结束位置 4:总帧数 5:计算得到该段应分得的帧数
            % 计算前几段光流总和等信息
            for i = 1:sectionNum-1
                sumSectionFlow(i,1) = sum(fFlows((i-1)*eachSectionNum+1:i*eachSectionNum));
                sumSectionFlow(i,2) = (i-1)*eachSectionNum+1;
                sumSectionFlow(i,3) = i*eachSectionNum;
                sumSectionFlow(i,4) = eachSectionNum;
            end
            % 计算最后一段光流总和等信息
            sumSectionFlow(sectionNum,1) = sum(fFlows((sectionNum-1)*eachSectionNum+1:fNumFrames));
            sumSectionFlow(sectionNum,2) = (sectionNum-1)*eachSectionNum+1;
            sumSectionFlow(sectionNum,3) = fNumFrames;
            sumSectionFlow(sectionNum,4) = fNumFrames - (sectionNum-1)*eachSectionNum;
            
            sumSectionFlow(1,1) =  floor(sumSectionFlow(1,1)*firstWeight);  % 第一段加权
            sumSectionFlow(sectionNum,1) =  floor(sumSectionFlow(sectionNum,1)*lastWeight); % 最后一段加权
            sumFlow = sum(sumSectionFlow(:,1));                                % 计算总的光流值
            sumSectionFlow = sortrows(sumSectionFlow,1);                    % 段光流总和正序排列，与后面floor结合 使得变化大的有可能分得多（也就1帧的差别）
            fLast = benchmark;
            for i = 1:sectionNum                                            % 计算每段应分得的帧数
                %sumSectionFlow(i,5) = min(sumSectionFlow(i,4),floor(fLast*sumSectionFlow(i,1)/sumFlow)); % 此处可以考虑是否用round
                sumSectionFlow(i,5) = floor(fLast*sumSectionFlow(i,1)/sumFlow); %这样可以保证32帧
                fLast = fLast - sumSectionFlow(i,5);
                sumFlow = sumFlow - sumSectionFlow(i,1);
            end
            %在每段内进行均匀随机采样
            samp = [];   
            for i = 1:sectionNum
                ratio = sumSectionFlow(i,4)/sumSectionFlow(i,5);
                for j = 1:sumSectionFlow(i,5)
                    iTmp = min(round(j*ratio),sumSectionFlow(i,4))+ sumSectionFlow(i,2) - 1;         % 获得均值位置
                    %samp =[samp,max(iTmp + round(-1 + 2*rand(1)),1)];       % [-1,1]之间进行随机扰动 防止取到0
                    samp =[samp,max(iTmp,1)];                               % 不随机
                end
            end
            samp = sort(samp);
            % size(samp)
        end
    end
end