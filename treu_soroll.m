function ret = treu_soroll(img, n)

if n == 1
    ret = wiener2(img, [2 2]);      % Mirar de canviar els valors
    
elseif n == 2
    ret = filter2(fspecial('average', 3), img);
%     ret = medfilt2(img)

else
    %treure l'altre tipus de soroll
    ret = img;

end