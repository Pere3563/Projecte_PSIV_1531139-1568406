function [] = carrega_train()
    data = load('mnist_train.csv');
    
    labels = data(:,1);
    len = length(labels);
    
    images = data(:,2:785);
    
    save('train.mat');

end