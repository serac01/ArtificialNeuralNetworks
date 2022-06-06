function pointA()
    clc;
    clear all;
    close all;

    IMG_RES = [25 25];
    letrasBW = zeros(IMG_RES(1) * IMG_RES(2), 30);
    counter=1;
    nImages=5;
    letrasTarget = zeros(6,30);
    
    %% Ler e redimensionar as imagens e preparar os targets
    %circle (0-4)
    for i=0:nImages-1
        img = imread(sprintf('images\\start\\circle\\circle-start-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        letrasBW(:, counter+i) = reshape(binarizedImg, 1, []);
        letrasTarget(1,counter+i) =  1;
    end
    counter=counter+nImages;
    %kite (5-9)
    for i=0:nImages-1
        img = imread(sprintf('images\\start\\kite\\kite-start-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        letrasBW(:, counter+i) = reshape(binarizedImg, 1, []);
        letrasTarget(2,counter+i) =  1;
    end
    counter=counter+nImages;
    %parallelogram (10-14)
    for i=0:nImages-1
        img = imread(sprintf('images\\start\\parallelogram\\parallelogram-start-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        letrasBW(:, counter+i) = reshape(binarizedImg, 1, []);
        letrasTarget(3,counter+i) =  1;
    end
    counter=counter+nImages;
    %square (15-19)
    for i=0:nImages-1
        img = imread(sprintf('images\\start\\square\\square-start-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        letrasBW(:, counter+i) = reshape(binarizedImg, 1, []);
        letrasTarget(4,counter+i) =  1;
    end
    counter=counter+nImages;
    %trapezoid (20-24)
    for i=0:nImages-1
        img = imread(sprintf('images\\start\\trapezoid\\trapezoid-start-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        letrasBW(:, counter+i) = reshape(binarizedImg, 1, []);
        letrasTarget(5,counter+i) =  1;
    end
    counter=counter+nImages;
    %triangle (25-29)
    for i=0:nImages-1
        img = imread(sprintf('images\\start\\triangle\\triangle-start-%d.png', i));
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
    net.divideParam.trainRatio = 1;
    net.divideParam.valRatio = 0;
    net.divideParam.testRatio = 0;
    [net,tr] = train(net, letrasBW, letrasTarget);

    %% Simular e analisar resultados
    out = sim(net, letrasBW);
    disp(tr);
    r = 0;
    for i=1:size(out,2)
        [a b] = max(out(:,i));
        [c d] = max(letrasTarget(:,i));
        if b == d
          r = r+1;
        end
    end
    accuracy = r/size(out,2);
    tr.time
    fprintf('Total time %f\n', sum(tr.time))
    fprintf('Precisao total de treino %f\n', accuracy)

end