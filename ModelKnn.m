function eti = ModelKnn(ima, X, labels, k)

% Y = labels;

%classificador Knn
distancies = zeros(60000,1);
im_veins = zeros(k);
etiquetes = zeros(k);

for i = 1:60000
        distancia = Distancia_euclide(ima, X(i,:));
        distancies(i) = distancia;
end

ordenat = sort(distancies);
for j = 1:k
    for t = 1:60000
        if ordenat(k) == distancies(t)
            im_veins(j) = t;
        end
    end
end
    
for i = 1:k
    etiquetes(i) = labels(im_veins(i));
end
    
eti = mode(etiquetes);
end
  
