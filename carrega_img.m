function negative_image = carrega_img(img)
    imgray = rgb2gray(img);
    bin_im = imbinarize(imgray, graythresh(imgray));  
    
%   Aquesta binarització no utilitza un threshold per a qualsevol imatge, 
%   sinó que depèn d'aquesta mateixa, fent que sigui més òptim per a cada
%   imatge a processar
    
    negative_img = imcomplement(im);        
%   Aquí estem fent la imatge negativa, per tenir el fondo en negre i la 
%   imatge en blanc, que és com es tenen les dades del train


end