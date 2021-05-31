% Parts que necessitem per el nostre projecte:
%     - Carregar la imatge que volem processar.
%     - Convertir-la a gris i posteriorment a blanc i negre. Fer el negatiu
%     d'aquesta, per tal de tenir-ho com a les dades que hem importat.
%       Per fer el threshold fer servir la funció de Matlab graythresh, que
%       segueix el threshold optim 
%     - Tenir una funció que carregui les imatges en una matriu d'entrenament.
%     - Continuar....

close all
clear all

% carrega_train()

load('train.mat');

n = 1;      % Valor que determina quin tipus de soroll es "posarà" a les imatges

test = load('mnist_test.csv');
images_test = test(:,2:785);

r = 1;


if r == 1
    tic;
    etiquetes_r = ModelKnnHu(images_test, images, labels, 10);  % En comptes de 10 posar k
    toc;
    
    cont = 0;
    
    for p = 1:10000
        if etiquetes_ret(p) == test(p,1)
            cont = cont + 1;
        end
    end
    
    acc = (cont / 100) * 100;
    

elseif r == 2 
   etiquetes = zeros(10000,1);
   tic;
   for j = 1:100
       img = images_test(j,:);
       etiqueta = ModelKnn(img, images, labels, 10);    % En comptes de 10 posar k
       etiqueta = etiqueta(1);
       etiquetes(j) = etiqueta;
   end
   toc;
   cont = 0;
   
   for p = 1:100
      if etiquetes(p) == test(p,1)
            cont = cont + 1;
      end
   end
   
   acc = (cont / 100) * 100;
end

