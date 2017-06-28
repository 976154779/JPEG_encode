%图像压缩处理  
I=imread('H:\lena.bmp');						    %读取图像  
I1=im2double(I);							          %图像存储类型转换   
T=dctmtx(8);							        	    %离散余弦变换矩阵   
dct=@(x)T*x*T';							            %设置函数句柄
B=blkproc(I1,[8 8],dct);					    	%对源图像进行DCT变换   
mask=[  1 1 1 1 0 0 0 0
        1 1 1 0 0 0 0 0
        1 1 0 0 0 0 0 0
        1 0 0 0 0 0 0 0
        0 0 0 0 0 0 0 0
        0 0 0 0 0 0 0 0
        0 0 0 0 0 0 0 0
        0 0 0 0 0 0 0 0];						    %掩膜   
B2=blkproc(B,[8 8],@(x)mask.*x);				%图像块处理
invdct=@(x)T'*x*T;
I2=blkproc(B2,[8 8],invdct);						%进行DCT反变换 ，得到压缩后的图像  
subplot(1,2,1)  
imshow(I1)									            %显示原始图像  
title('原始图像')  
subplot(1,2,2)  
imshow(I2)									            %显示压缩后的图像  
title('压缩后的图像')  
imwrite(I2,'H:\lena.jpg')							  %保存压缩后的图像
