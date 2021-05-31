function dist = Distancia_euclide(fila1, fila2)
    distancia = 0;
    for i = 1:784
        distancia = (fila1(i) - fila2(i))^2 + distancia;
    end
    
     dist = sqrt(distancia);
 
end
