function [bestP,epochs,accuracy] = pointA()
    clc;
    clear all;
    close all;

    %Inicializar as variaveis
    IMG_RES = [25 25];
    figurasBW = zeros(IMG_RES(1) * IMG_RES(2), 30);
    counter=1;
    nImages=5;
    figurasTarget = zeros(6,30);
    
    %% Ler e redimensionar as imagens e preparar os targets
    %circle
    for i=0:nImages-1
        img = imread(sprintf('images\\start\\circle\\circle-start-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        figurasBW(:, counter+i) = reshape(binarizedImg, 1, []);
        figurasTarget(1,counter+i) =  1;
    end
    counter=counter+nImages;
    %kite
    for i=0:nImages-1
        img = imread(sprintf('images\\start\\kite\\kite-start-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        figurasBW(:, counter+i) = reshape(binarizedImg, 1, []);
        figurasTarget(2,counter+i) =  1;
    end
    counter=counter+nImages;
    %parallelogram
    for i=0:nImages-1
        img = imread(sprintf('images\\start\\parallelogram\\parallelogram-start-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        figurasBW(:, counter+i) = reshape(binarizedImg, 1, []);
        figurasTarget(3,counter+i) =  1;
    end
    counter=counter+nImages;
    %square
    for i=0:nImages-1
        img = imread(sprintf('images\\start\\square\\square-start-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        figurasBW(:, counter+i) = reshape(binarizedImg, 1, []);
        figurasTarget(4,counter+i) =  1;
    end
    counter=counter+nImages;
    %trapezoid
    for i=0:nImages-1
        img = imread(sprintf('images\\start\\trapezoid\\trapezoid-start-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        figurasBW(:, counter+i) = reshape(binarizedImg, 1, []);
        figurasTarget(5,counter+i) =  1;
    end
    counter=counter+nImages;
    %triangle
    for i=0:nImages-1
        img = imread(sprintf('images\\start\\triangle\\triangle-start-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        figurasBW(:, counter+i) = reshape(binarizedImg, 1, []);
        figurasTarget(6,counter+i) =  1;
    end

    %% Preparar e treinar rede
    net = feedforwardnet([10]);
    net.trainFcn = 'trainbfg';
    net.layers{1}.transferFcn = 'tansig';
    net.layers{2}.transferFcn = 'purelin';
    net.divideFcn = 'dividerand';
    net.divideParam.trainRatio = 1;
    net.divideParam.valRatio = 0;
    net.divideParam.testRatio = 0;
    [net,tr] = train(net, figurasBW, figurasTarget);

    %% Simular e analisar resultados
    out = sim(net, figurasBW);
    r = 0;
    for i=1:size(out,2)
        [a b] = max(out(:,i));
        [c d] = max(figurasTarget(:,i));
        if b == d
          r = r+1;
        end
    end
    
    accuracy = r/size(out,2);
    fprintf('\nPrecisao total de treino %f\n', accuracy)
    fprintf('Epoch: %d\n',tr.num_epochs)
    fprintf('Stop: %s\n',tr.stop)
    fprintf('Perf: \n')
    tr.best_perf
    bestP=tr.best_perf;
    epochs=tr.num_epochs;
    stop=tr.stop;

end