function final = Hu_inv_mom(img)
im = double(img);
[x y] = size(im);

[xx yy] = meshgrid(1:y, 1:x);

xx = xx(:);
yy = yy(:);
im = im(:);

if (sum(im) == 0)
    ret.s00 = eps;

else
    ret.s00 = sum(im);

end

ret.s01 = sum(yy .* im);
ret.s10 = sum(xx .* im);
ret.s11 = sum(xx .* yy .* im);
ret.s12 = sum(xx .* yy.^2 .* im);
ret.s02 = sum(yy.^2 .* im);
ret.s20 = sum(xx.^2 .* im);
ret.s21 = sum(xx.^2 .* yy .* im);
ret.s03 = sum(yy.^3 .* im);
ret.s30 = sum(xx.^3 .* im);


xtemp = ret.s10 / ret.s00;
ytemp = ret.s01 / ret.s00;

temp_e.s11 = (ret.s11 - ytemp * ret.s10) / ret.s00^2;
temp_e.s20 = (ret.s20 - xtemp * ret.s10) / ret.s00^2;
temp_e.s02 = (ret.s02 - ytemp * ret.s01) / ret.s00^2;
temp_e.s30 = (ret.s30 - 3 * xtemp * ret.s20 + 2 * xtemp^2 * ret.s10) / ret.s00^2.5;
temp_e.s03 = (ret.s03 - 3 * ytemp * ret.s02 + 2 * ytemp^2 * ret.s01) / ret.s00^2.5;
temp_e.s21 = (ret.s21 - 2 * xtemp * ret.s11 - ytemp * ret.s20 + 2 * xtemp^2 * ret.s01) / ret.s00^2.5;
temp_e.s12 = (ret.s12 - 2 * ytemp * ret.s11 - ytemp * ret.s02 + 2 * ytemp^2 * ret.s10) / ret.s00^2.5;



final(1) = temp_e.s20 + temp_e.s02;
final(2) = (temp_e.s20 - temp_e.s02)^2 + 4 * temp_e.s11^2;
final(2) = (temp_e.s20 - temp_e.s02)^2 + 4 * temp_e.s11^2;
final(3) = (temp_e.s30 - 3*temp_e.s12)^2 + (3*temp_e.s21 - temp_e.s03)^2;
final(4) = (temp_e.s30 + temp_e.s12)^2 + (temp_e.s21 + temp_e.s03)^2;
final(5) = (temp_e.s30 - 3*temp_e.s12) * (temp_e.s30 + temp_e.s12) * ( (temp_e.s30 + temp_e.s12)^2 - 3*(temp_e.s21 + temp_e.s03)^2 ) + (3*temp_e.s21 - temp_e.s03) * (temp_e.s21 + temp_e.s03) *  ( 3*(temp_e.s30 + temp_e.s12)^2 - (temp_e.s21 + temp_e.s03)^2 );
final(6) = (temp_e.s20 - temp_e.s02) * ( (temp_e.s30 + temp_e.s12)^2 - (temp_e.s21 + temp_e.s03)^2 ) + 4 * temp_e.s11 * (temp_e.s30 + temp_e.s12) * (temp_e.s21 + temp_e.s03);
final(7) = (3*temp_e.s21 - temp_e.s03) * (temp_e.s30 + temp_e.s12) * ( (temp_e.s30 + temp_e.s12)^2 - 3*(temp_e.s21 + temp_e.s03)^2 ) +  (3*temp_e.s12 - temp_e.s30) * (temp_e.s21 + temp_e.s03) * ( 3*(temp_e.s30 + temp_e.s12)^2 - (temp_e.s21 + temp_e.s03)^2 );

end