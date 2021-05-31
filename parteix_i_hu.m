function Hu_junt = parteix_i_hu(img)
stats= regionprops(img, "all");

% temp = stats.BoundingBox(2);
% xmin = floor(temp);
% temp = stats.BoundingBox(2)
% xmax = xmin+temp+1;
% temp = stats.BoundingBox(1);
% ymin = floor(temp);
% temp = stats.BoundingBox(3);
% ymax = ymin+temp+1;
% temp = img(xmin:xmax,ymin:ymax);

esq = bwmorph(img,'thin',Inf);
[m n] = size(esq);

x = floor(m/2);
y = floor(n/2);    

img1 = esq(1:x, 1:y);
img2 = esq(x:m, 1:y);
img3 = esq(1:x, y:n);
img4 = esq(x:m, y:n);

hu_principal = Hu_invariants(esq);
hu1 = Hu_invariants(img1);
hu2 = Hu_invariants(img2);
hu3 = Hu_invariants(img3);
hu4 = Hu_invariants(img4);

Hu_junt = cat(2, hu_principal, hu1, hu2, hu3, hu4);

end