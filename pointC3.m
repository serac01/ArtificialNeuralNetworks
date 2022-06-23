function [accuracy, accuracy1, accuracy2, accuracy3] = pointC3()
    clc;
    clear all;
    close all;
    IMG_RES = [25 25];

    %% Inicializar as variaveis para a pasta Test
    figurasBW1 = zeros(IMG_RES(1) * IMG_RES(2), 10*6);
    counter=1;
    nImages=10;
    figurasTarget1 = zeros(6,10*6);
    
    %Ler e redimensionar as imagens e preparar os targets
    %circle
    for i=0:nImages-1
        img = imread(sprintf('images\\test\\circle\\circle-test-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        figurasBW1(:, counter+i) = reshape(binarizedImg, 1, []);
        figurasTarget1(1,counter+i) =  1;
    end
    counter=counter+nImages;
    %kite
    for i=0:nImages-1
        img = imread(sprintf('images\\test\\kite\\kite-test-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        figurasBW1(:, counter+i) = reshape(binarizedImg, 1, []);
        figurasTarget1(2,counter+i) =  1;
    end
    counter=counter+nImages;
    %parallelogram
    for i=0:nImages-1
        img = imread(sprintf('images\\test\\parallelogram\\parallelogram-test-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        figurasBW1(:, counter+i) = reshape(binarizedImg, 1, []);
        figurasTarget1(3,counter+i) =  1;
    end
    counter=counter+nImages;
    %square
    for i=0:nImages-1
        img = imread(sprintf('images\\test\\square\\square-test-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        figurasBW1(:, counter+i) = reshape(binarizedImg, 1, []);
        figurasTarget1(4,counter+i) =  1;
    end
    counter=counter+nImages;
    %trapezoid
    for i=0:nImages-1
        img = imread(sprintf('images\\test\\trapezoid\\trapezoid-test-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        figurasBW1(:, counter+i) = reshape(binarizedImg, 1, []);
        figurasTarget1(5,counter+i) =  1;
    end
    counter=counter+nImages;
    %triangle
    for i=0:nImages-1
        img = imread(sprintf('images\\test\\triangle\\triangle-test-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        figurasBW1(:, counter+i) = reshape(binarizedImg, 1, []);
        figurasTarget1(6,counter+i) =  1;
    end
    %% Inicializar as variaveis para a pasta Train
    figurasBW2 = zeros(IMG_RES(1) * IMG_RES(2), 50*6);
    counter=1;
    nImages=50;
    figurasTarget2 = zeros(6,50*6);
    
    %Ler e redimensionar as imagens e preparar os targets
    %circle
    for i=0:nImages-1
        img = imread(sprintf('images\\train\\circle\\circle-train-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        figurasBW2(:, counter+i) = reshape(binarizedImg, 1, []);
        figurasTarget2(1,counter+i) =  1;
    end
    counter=counter+nImages;
    %kite
    for i=0:nImages-1
        img = imread(sprintf('images\\train\\kite\\kite-train-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        figurasBW2(:, counter+i) = reshape(binarizedImg, 1, []);
        figurasTarget2(2,counter+i) =  1;
    end
    counter=counter+nImages;
    %parallelogram
    for i=0:nImages-1
        img = imread(sprintf('images\\train\\parallelogram\\parallelogram-train-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        figurasBW2(:, counter+i) = reshape(binarizedImg, 1, []);
        figurasTarget2(3,counter+i) =  1;
    end
    counter=counter+nImages;
    %square
    for i=0:nImages-1
        img = imread(sprintf('images\\train\\square\\square-train-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        figurasBW2(:, counter+i) = reshape(binarizedImg, 1, []);
        figurasTarget2(4,counter+i) =  1;
    end
    counter=counter+nImages;
    %trapezoid
    for i=0:nImages-1
        img = imread(sprintf('images\\train\\trapezoid\\trapezoid-train-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        figurasBW2(:, counter+i) = reshape(binarizedImg, 1, []);
        figurasTarget2(5,counter+i) =  1;
    end
    counter=counter+nImages;
    %triangle
    for i=0:nImages-1
        img = imread(sprintf('images\\train\\triangle\\triangle-train-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        figurasBW2(:, counter+i) = reshape(binarizedImg, 1, []);
        figurasTarget2(6,counter+i) =  1;
    end
    
    %% Inicializar as variaveis para a pasta Start
    figurasBW3 = zeros(IMG_RES(1) * IMG_RES(2), 30);
    counter=1;
    nImages=5;
    figurasTarget3 = zeros(6,30);
    
    %Ler e redimensionar as imagens e preparar os targets
    %circle
    for i=0:nImages-1
        img = imread(sprintf('images\\start\\circle\\circle-start-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        figurasBW3(:, counter+i) = reshape(binarizedImg, 1, []);
        figurasTarget3(1,counter+i) =  1;
    end
    counter=counter+nImages;
    %kite
    for i=0:nImages-1
        img = imread(sprintf('images\\start\\kite\\kite-start-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        figurasBW3(:, counter+i) = reshape(binarizedImg, 1, []);
        figurasTarget3(2,counter+i) =  1;
    end
    counter=counter+nImages;
    %parallelogram
    for i=0:nImages-1
        img = imread(sprintf('images\\start\\parallelogram\\parallelogram-start-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        figurasBW3(:, counter+i) = reshape(binarizedImg, 1, []);
        figurasTarget3(3,counter+i) =  1;
    end
    counter=counter+nImages;
    %square
    for i=0:nImages-1
        img = imread(sprintf('images\\start\\square\\square-start-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        figurasBW3(:, counter+i) = reshape(binarizedImg, 1, []);
        figurasTarget3(4,counter+i) =  1;
    end
    counter=counter+nImages;
    %trapezoid
    for i=0:nImages-1
        img = imread(sprintf('images\\start\\trapezoid\\trapezoid-start-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        figurasBW3(:, counter+i) = reshape(binarizedImg, 1, []);
        figurasTarget3(5,counter+i) =  1;
    end
    counter=counter+nImages;
    %triangle
    for i=0:nImages-1
        img = imread(sprintf('images\\start\\triangle\\triangle-start-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        figurasBW3(:, counter+i) = reshape(binarizedImg, 1, []);
        figurasTarget3(6,counter+i) =  1;
    end
    
    %% Juntar os inputs e imagens
    figurasBW = [figurasBW1 figurasBW2 figurasBW3];
    figurasTarget = [figurasTarget1 figurasTarget2 figurasTarget3];
    
    %% Treinar a rede neuronal
    net = feedforwardnet(10);
    net.trainFcn = 'trainlm';
    net.layers{1}.transferFcn = 'purelin';
    net.layers{2}.transferFcn = 'purelin';
    net.divideFcn = 'dividerand';
    net.divideParam.trainRatio = 0.7;
    net.divideParam.valRatio = 0.15;
    net.divideParam.testRatio = 0.15;
        
    [net, ~] = train(net, figurasBW, figurasTarget);

    out = sim(net, figurasBW);

    r = 0;
    for i = 1: size(out,2)                  % Para cada classificação:
        [~, b] = max(out(:,i));             % b guarda a linha onde encontrou valor mais alto da saída obtida
        [~, d] = max(figurasTarget(:,i));    % d guarda a linha onde encontrou valor mais alto da saída desejada
        if b == d                           % Se estão na mesma linha, a classificação foi correta (incrementa 1)
          r = r+1;
        end
    end

    accuracy = r/size(out,2);
    fprintf('Precisao total de treino %f\n', accuracy)
    
    %% Testar rede com pasta start
    figurasBW = zeros(IMG_RES(1) * IMG_RES(2), 30);
    counter=1;
    nImages=5;
    figurasTarget1 = zeros(6,30);
    
    %Ler e redimensionar as imagens e preparar os targets
    %circle
    for i=0:nImages-1
        img = imread(sprintf('images\\start\\circle\\circle-start-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        figurasBW(:, counter+i) = reshape(binarizedImg, 1, []);
        figurasTarget1(1,counter+i) =  1;
    end
    counter=counter+nImages;
    %kite
    for i=0:nImages-1
        img = imread(sprintf('images\\start\\kite\\kite-start-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        figurasBW(:, counter+i) = reshape(binarizedImg, 1, []);
        figurasTarget1(2,counter+i) =  1;
    end
    counter=counter+nImages;
    %parallelogram
    for i=0:nImages-1
        img = imread(sprintf('images\\start\\parallelogram\\parallelogram-start-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        figurasBW(:, counter+i) = reshape(binarizedImg, 1, []);
        figurasTarget1(3,counter+i) =  1;
    end
    counter=counter+nImages;
    %square
    for i=0:nImages-1
        img = imread(sprintf('images\\start\\square\\square-start-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        figurasBW(:, counter+i) = reshape(binarizedImg, 1, []);
        figurasTarget1(4,counter+i) =  1;
    end
    counter=counter+nImages;
    %trapezoid
    for i=0:nImages-1
        img = imread(sprintf('images\\start\\trapezoid\\trapezoid-start-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        figurasBW(:, counter+i) = reshape(binarizedImg, 1, []);
        figurasTarget1(5,counter+i) =  1;
    end
    counter=counter+nImages;
    %triangle
    for i=0:nImages-1
        img = imread(sprintf('images\\start\\triangle\\triangle-start-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        figurasBW(:, counter+i) = reshape(binarizedImg, 1, []);
        figurasTarget1(6,counter+i) =  1;
    end
    
    out1 = sim(net, figurasBW);

    r = 0;
    for i = 1: size(out1, 2)                % Para cada classificação:
        [~, b] = max(out1(:, i));           % b guarda a linha onde encontrou valor mais alto da saída obtida
        [~, d] = max(figurasTarget1(:, i)); % d guarda a linha onde encontrou valor mais alto da saída desejada
        if b == d                           % Se estão na mesma linha, a classificação foi correta (incrementa 1)
          r = r+1;
        end
    end

    accuracy1 = r/size(out1, 2);
    fprintf('Precisão total de simulação para a pasta start: %f\n', accuracy1);

    %% Testar rede com pasta train
    figurasBW = zeros(IMG_RES(1) * IMG_RES(2), 50*6);
    counter=1;
    nImages=50;
    figurasTarget2 = zeros(6,50*6);
    
    %Ler e redimensionar as imagens e preparar os targets
    %circle
    for i=0:nImages-1
        img = imread(sprintf('images\\train\\circle\\circle-train-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        figurasBW(:, counter+i) = reshape(binarizedImg, 1, []);
        figurasTarget2(1,counter+i) =  1;
    end
    counter=counter+nImages;
    %kite
    for i=0:nImages-1
        img = imread(sprintf('images\\train\\kite\\kite-train-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        figurasBW(:, counter+i) = reshape(binarizedImg, 1, []);
        figurasTarget2(2,counter+i) =  1;
    end
    counter=counter+nImages;
    %parallelogram
    for i=0:nImages-1
        img = imread(sprintf('images\\train\\parallelogram\\parallelogram-train-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        figurasBW(:, counter+i) = reshape(binarizedImg, 1, []);
        figurasTarget2(3,counter+i) =  1;
    end
    counter=counter+nImages;
    %square
    for i=0:nImages-1
        img = imread(sprintf('images\\train\\square\\square-train-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        figurasBW(:, counter+i) = reshape(binarizedImg, 1, []);
        figurasTarget2(4,counter+i) =  1;
    end
    counter=counter+nImages;
    %trapezoid
    for i=0:nImages-1
        img = imread(sprintf('images\\train\\trapezoid\\trapezoid-train-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        figurasBW(:, counter+i) = reshape(binarizedImg, 1, []);
        figurasTarget2(5,counter+i) =  1;
    end
    counter=counter+nImages;
    %triangle
    for i=0:nImages-1
        img = imread(sprintf('images\\train\\triangle\\triangle-train-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        figurasBW(:, counter+i) = reshape(binarizedImg, 1, []);
        figurasTarget2(6,counter+i) =  1;
    end

    out2 = sim(net, figurasBW);

    r = 0;
    for i = 1: size(out2, 2)                % Para cada classificação:
        [~, b] = max(out2(:, i));           % b guarda a linha onde encontrou valor mais alto da saída obtida
        [~, d] = max(figurasTarget2(:, i)); % d guarda a linha onde encontrou valor mais alto da saída desejada
        if b == d                           % Se estão na mesma linha, a classificação foi correta (incrementa 1)
          r = r+1;
        end
    end

    accuracy2 = r/size(out2, 2);
    fprintf('Precisão total de simulação para a pasta train: %f\n', accuracy2);

    %% Testar rede com pasta test

    figurasBW = zeros(IMG_RES(1) * IMG_RES(2), 10*6);
    counter=1;
    nImages=10;
    figurasTarget3 = zeros(6,10*6);
    
    %Ler e redimensionar as imagens e preparar os targets
    %circle
    for i=0:nImages-1
        img = imread(sprintf('images\\test\\circle\\circle-test-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        figurasBW(:, counter+i) = reshape(binarizedImg, 1, []);
        figurasTarget3(1,counter+i) =  1;
    end
    counter=counter+nImages;
    %kite
    for i=0:nImages-1
        img = imread(sprintf('images\\test\\kite\\kite-test-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        figurasBW(:, counter+i) = reshape(binarizedImg, 1, []);
        figurasTarget3(2,counter+i) =  1;
    end
    counter=counter+nImages;
    %parallelogram
    for i=0:nImages-1
        img = imread(sprintf('images\\test\\parallelogram\\parallelogram-test-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        figurasBW(:, counter+i) = reshape(binarizedImg, 1, []);
        figurasTarget3(3,counter+i) =  1;
    end
    counter=counter+nImages;
    %square
    for i=0:nImages-1
        img = imread(sprintf('images\\test\\square\\square-test-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        figurasBW(:, counter+i) = reshape(binarizedImg, 1, []);
        figurasTarget3(4,counter+i) =  1;
    end
    counter=counter+nImages;
    %trapezoid
    for i=0:nImages-1
        img = imread(sprintf('images\\test\\trapezoid\\trapezoid-test-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        figurasBW(:, counter+i) = reshape(binarizedImg, 1, []);
        figurasTarget3(5,counter+i) =  1;
    end
    counter=counter+nImages;
    %triangle
    for i=0:nImages-1
        img = imread(sprintf('images\\test\\triangle\\triangle-test-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        figurasBW(:, counter+i) = reshape(binarizedImg, 1, []);
        figurasTarget3(6,counter+i) =  1;
    end

    out3 = sim(net, figurasBW);

    r = 0;
    for i = 1: size(out3, 2)                % Para cada classificação:
        [~, b] = max(out3(:, i));           % b guarda a linha onde encontrou valor mais alto da saída obtida
        [~, d] = max(figurasTarget3(:, i));  % d guarda a linha onde encontrou valor mais alto da saída desejada
        if b == d                           % Se estão na mesma linha, a classificação foi correta (incrementa 1)
          r = r+1;
        end
    end

    accuracy3 = r/size(out3, 2);
    fprintf('Precisão total de simulação para a pasta test: %f\n', accuracy3);

    %% Plotconfusion para todas as simulações
    plotconfusion(figurasTarget1, out1, 'Pasta Start', figurasTarget2, out2, 'Pasta Train', figurasTarget3, out3, 'Pasta Test');
    % Mudar tamanho da letra
    set(findall(gcf, '-property', 'FontSize'), 'FontSize', 6);

end