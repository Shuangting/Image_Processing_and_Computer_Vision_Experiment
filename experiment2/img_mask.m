%���庯������ģ��ɨ��,a,b,c,d,e,f,g,h�ֱ�����mask���Ͽ�ʼ˳ʱ����ת�ĸ�ֵ,i��������ֵ
function [A]=img_mask(a,b,c,d,e,f,g,h,center,width,height,img)
A=zeros(width,height);
for i=2:width+1
    for j=2:height+1
        A(i-1,j-1)=a*img(i-1,j-1)+b*img(i,j-1)+c*img(i+1,j-1)+d*img(i+1,j)+e*img(i+1,j+1)+f*img(i,j+1)+g*img(i-1,j+1)+h*img(i-1,j)+center*img(i,j);
    end
end
end