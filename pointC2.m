function pointC2()
    clc;
    clear all;
    close all;

    %Inicializar as variaveis
    IMG_RES = [25 25];
    letrasBW = zeros(IMG_RES(1) * IMG_RES(2), 30);
    counter=1;
    nImages=10;
    letrasTarget = zeros(6,50*6);
    
    %% Ler e redimensionar as imagens e preparar os targets
    %circle
    for i=0:nImages-1
        img = imread(sprintf('images\\test\\circle\\circle-test-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        letrasBW(:, counter+i) = reshape(binarizedImg, 1, []);
        letrasTarget(1,counter+i) =  1;
    end
    counter=counter+nImages;
    %kite
    for i=0:nImages-1
        img = imread(sprintf('images\\test\\kite\\kite-test-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        letrasBW(:, counter+i) = reshape(binarizedImg, 1, []);
        letrasTarget(2,counter+i) =  1;
    end
    counter=counter+nImages;
    %parallelogram
    for i=0:nImages-1
        img = imread(sprintf('images\\test\\parallelogram\\parallelogram-test-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        letrasBW(:, counter+i) = reshape(binarizedImg, 1, []);
        letrasTarget(3,counter+i) =  1;
    end
    counter=counter+nImages;
    %square
    for i=0:nImages-1
        img = imread(sprintf('images\\test\\square\\square-test-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        letrasBW(:, counter+i) = reshape(binarizedImg, 1, []);
        letrasTarget(4,counter+i) =  1;
    end
    counter=counter+nImages;
    %trapezoid
    for i=0:nImages-1
        img = imread(sprintf('images\\test\\trapezoid\\trapezoid-test-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        letrasBW(:, counter+i) = reshape(binarizedImg, 1, []);
        letrasTarget(5,counter+i) =  1;
    end
    counter=counter+nImages;
    %triangle
    for i=0:nImages-1
        img = imread(sprintf('images\\test\\triangle\\triangle-test-%d.png', i));
        img = imresize(img, IMG_RES);
        binarizedImg = im2bw(img);
        letrasBW(:, counter+i) = reshape(binarizedImg, 1, []);
        letrasTarget(6,counter+i) =  1;
    end
    
    %% Treinar a rede neuronal
    net = feedforwardnet(10);
    net.trainFcn = 'trainlm';
    net.layers{1}.transferFcn = 'purelin';
    net.layers{2}.transferFcn = 'purelin';
    net.divideFcn = 'dividerand';
    net.divideParam.trainRatio = 0.7;
    net.divideParam.valRatio = 0.15;
    net.divideParam.testRatio = 0.15;
        
    [net, ~] = train(net, letrasBW, letrasTarget);

    out = sim(net, letrasBW);

    r = 0;
    for i = 1: size(out,2)                  % Para cada classificação:
        [~, b] = max(out(:,i));             % b guarda a linha onde encontrou valor mais alto da saída obtida
        [~, d] = max(letrasTarget(:,i));    % d guarda a linha onde encontrou valor mais alto da saída desejada
        if b == d                           % Se estão na mesma linha, a classificação foi correta (incrementa 1)
          r = r+1;
        end
    end

    accuracy = r/size(out,2);
    fprintf('Precisao total de treino %f\n', accuracy)

    %% Testar rede com pasta start
    letrasBW = zeros(IMG_RES(1) * IMG_RES(2), 10);
    for i = 1: 10
        img = imread(sprintf('Pasta1\\%d.jpg', i));
        img = imresize(img, IMG_RES);
        binarizedImg = imbinarize(img);
        letrasBW(:, i) = reshape(binarizedImg, 1, []);
    end

    letrasTarget1 = [eye(10)];
    out1 = sim(net, letrasBW);

    r = 0;
    for i = 1: size(out1, 2)                % Para cada classificação:
        [~, b] = max(out1(:, i));           % b guarda a linha onde encontrou valor mais alto da saída obtida
        [~, d] = max(letrasTarget1(:, i));  % d guarda a linha onde encontrou valor mais alto da saída desejada
        if b == d                           % Se estão na mesma linha, a classificação foi correta (incrementa 1)
          r = r+1;
        end
    end

    accuracy = r/size(out1, 2);
    fprintf('Precisão total de simulação para a pasta start: %f\n', accuracy);

    %% Testar rede com pasta train
    folderImg = dir('Pasta2\\letter_bnw_*.jpg');
    imgFiles = natsort({folderImg.name});

    letrasBW = zeros(IMG_RES(1) * IMG_RES(2), length(imgFiles));
    letrasTarget2 = [];
    letrasBWCol = 1;

    for i = 1: length(imgFiles) / 10   
        for j = 1: 10
            img = imread(sprintf('Pasta2\\%s', char(imgFiles(((j - 1) * 10) + i))));
            img = imresize(img, IMG_RES);
            binarizedImg = imbinarize(img);
            letrasBW(:, letrasBWCol) = reshape(binarizedImg, 1, []);
            letrasBWCol = letrasBWCol + 1;
        end

        letrasTarget2 = [letrasTarget2 eye(10)];
    end

    % Ordem alfabética
    letrasTarget2 = flip(letrasTarget2, 1);

    out2 = sim(net, letrasBW);

    r = 0;
    for i = 1: size(out2, 2)                % Para cada classificação:
        [~, b] = max(out2(:, i));           % b guarda a linha onde encontrou valor mais alto da saída obtida
        [~, d] = max(letrasTarget2(:, i));  % d guarda a linha onde encontrou valor mais alto da saída desejada
        if b == d                           % Se estão na mesma linha, a classificação foi correta (incrementa 1)
          r = r+1;
        end
    end

    accuracy = r/size(out2, 2);
    fprintf('Precisão total de simulação para a pasta train: %f\n', accuracy);

    %% Testar rede com pasta test

    folderImg = dir('Pasta3\\letter_bnw_test_*.jpg');
    imgFiles = natsort({folderImg.name});

    letrasBW = zeros(IMG_RES(1) * IMG_RES(2), length(imgFiles));
    letrasTarget3 = [];
    letrasBWCol = 1;
    for i = 1: length(imgFiles) / 10  
        for j = 1: 10
            img = imread(sprintf('Pasta3\\%s', char(imgFiles(((j - 1) * 4) + i))));
            img = imresize(img, IMG_RES);
            binarizedImg = imbinarize(img);
            letrasBW(:, letrasBWCol) = reshape(binarizedImg, 1, []);
            letrasBWCol = letrasBWCol + 1;
        end

        letrasTarget3 = [letrasTarget3 eye(10)];
    end

    out3 = sim(net, letrasBW);

    r = 0;
    for i = 1: size(out3, 2)                % Para cada classificação:
        [~, b] = max(out3(:, i));           % b guarda a linha onde encontrou valor mais alto da saída obtida
        [~, d] = max(letrasTarget3(:, i));  % d guarda a linha onde encontrou valor mais alto da saída desejada
        if b == d                           % Se estão na mesma linha, a classificação foi correta (incrementa 1)
          r = r+1;
        end
    end

    accuracy = r/size(out3, 2);
    fprintf('Precisão total de simulação para a pasta test: %f\n', accuracy);

    %% Plotconfusion para todas as simulações
    plotconfusion(letrasTarget1, out1, 'Pasta Start', letrasTarget2, out2, 'Pasta Train', letrasTarget3, out3, 'Pasta Test');
    % Mudar tamanho da letra
    set(findall(gcf, '-property', 'FontSize'), 'FontSize', 6);

end