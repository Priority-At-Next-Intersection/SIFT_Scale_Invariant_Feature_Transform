function [N]=Sift(N,files,total,fileDir,Index)

for temp1=1:(total+1)
    N{temp1}=zeros(1,700);
end

%����ѡ��ͼƬ��
[features,~,~,~] = detect_features(imread([fileDir,files(Index).name]));
row=size(features,1);    %ͳ��ѡ��ͼƬ��������
col=size(features,2);
for i=1:row            
    for j=1:col
        k=round(features(i,j));
        N{total+1}(k+5)=N{total+1}(k+5)+1;
    end
end

%��������ͼƬ,�ֱ�������������飺
for ii=1:total
   [features,~,~,~] = detect_features(imread([fileDir,files(ii).name]));
   row=size(features,1);   
   col=size(features,2);

    for i=1:row
        for j=1:col
            k=round(abs(features(i,j)));%k������Ǵ˸��ӵĻҶȼ�
            N{ii}(k+5)=N{ii}(k+5)+1;
        end
    end
end

end