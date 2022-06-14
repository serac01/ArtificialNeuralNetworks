function pointC1()
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

    %% Carregar a rede neuronal
    net = load('net.mat', 'net').net;

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
    fprintf('Precisao total %f\n', accuracy)

end