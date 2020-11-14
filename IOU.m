% �������ܣ���������ͼ���IOU
% lable_img�������ͼ��A��ֻ����0��255����ֵ��ͼ��
% res_img:�����ͼ��B��Ҳͬ��ֻ����0��255����ֵ��ͼ��
% ����ֵ��iou����ͼ���iou��yl��������
function [iou,yl] = IOU(lable_img, res_img)
[rows, cols] = size(lable_img);

% ���������
%total_area = rows * cols;

% ͳ��lable_img��res_img��255����ֵ�ĸ���
lable_area = 0; % ��ǳ��������
res_area = 0;   % �ָ������������
intersection_area = 0; % �ཻ��������
combine_area = 0;      % �����������ϵ����

% ��ʼ��������ֵ����
for i = 1: 1: rows
    for j = 1: 1: cols
        if lable_img(i, j)==255 && res_img(i, j)==255
            intersection_area = intersection_area + 1;
            lable_area = lable_area + 1;
            res_area = res_area + 1;
        elseif lable_img(i, j)==255 && res_img(i, j)~=255
            lable_area = lable_area + 1;
        elseif lable_img(i, j)~=255 && res_img(i, j)==255
            res_area = res_area + 1;
        end
    end
end
combine_area = combine_area + lable_area + res_area - intersection_area;

% �õ�IOU
iou = double(intersection_area) / double(combine_area);
fprintf('IOU: %f\n', iou);
% �õ�dice
dice = 2*double(intersection_area) /( double(lable_area)+double(res_area));
fprintf('DICE: %f\n', dice);


end