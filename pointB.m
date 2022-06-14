function [bestP,epochs,accuracy] = pointB()
    clc;
    clear all;
    close all;

    %Inicializar as variaveis
    IMG_RES = [25 25];
    letrasBW = zeros(IMG_RES(1) * IMG_RES(2), 30);
    counter=1;
    nImages=50;
    letrasTarget = zeros(6,50*6);
    
    %% Ler e redimensionar as imagens e preparar os targets
    %circle
    for i=0:nImages-1
        img = imread(sprintf('images\\train\\circle\\circle-train-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        letrasBW(:, counter+i) = reshape(binarizedImg, 1, []);
        letrasTarget(1,counter+i) =  1;
    end
    counter=counter+nImages;
    %kite (5-9)
    for i=0:nImages-1
        img = imread(sprintf('images\\train\\kite\\kite-train-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        letrasBW(:, counter+i) = reshape(binarizedImg, 1, []);
        letrasTarget(2,counter+i) =  1;
    end
    counter=counter+nImages;
    %parallelogram
    for i=0:nImages-1
        img = imread(sprintf('images\\train\\parallelogram\\parallelogram-train-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        letrasBW(:, counter+i) = reshape(binarizedImg, 1, []);
        letrasTarget(3,counter+i) =  1;
    end
    counter=counter+nImages;
    %square
    for i=0:nImages-1
        img = imread(sprintf('images\\train\\square\\square-train-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        letrasBW(:, counter+i) = reshape(binarizedImg, 1, []);
        letrasTarget(4,counter+i) =  1;
    end
    counter=counter+nImages;
    %trapezoid
    for i=0:nImages-1
        img = imread(sprintf('images\\train\\trapezoid\\trapezoid-train-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        letrasBW(:, counter+i) = reshape(binarizedImg, 1, []);
        letrasTarget(5,counter+i) =  1;
    end
    counter=counter+nImages;
    %triangle
    for i=0:nImages-1
        img = imread(sprintf('images\\train\\triangle\\triangle-train-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        letrasBW(:, counter+i) = reshape(binarizedImg, 1, []);
        letrasTarget(6,counter+i) =  1;
    end

    %% Preparar e treinar rede
    net = feedforwardnet([10]);
    net.trainFcn = 'trainlm';
    net.layers{1}.transferFcn = 'tansig';
    net.layers{2}.transferFcn = 'purelin';
    net.divideFcn = 'dividerand';
    net.divideParam.trainRatio = 0.7;
    net.divideParam.valRatio = 0.15;
    net.divideParam.testRatio = 0.15;
    [net,tr] = train(net, letrasBW, letrasTarget);

    %% Simular e analisar resultados
    out = sim(net, letrasBW);
    r = 0;
    for i=1:size(out,2)
        [a b] = max(out(:,i));
        [c d] = max(letrasTarget(:,i));
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
    
    save('net.mat', 'net');

end