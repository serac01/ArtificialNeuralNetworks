function pointD(n)
    %Inicializar as variaveis
    IMG_RES = [25 25];
    nImagem=n;
    identity = eye(6);
    %% Ler e redimensionar as imagens e preparar os targets
    img = imread(sprintf('images\\pointD\\img%d.png', nImagem));
    img = imresize(img, IMG_RES);
    
    %Para ver as imagens redimensionadas vs as imagens verdadeiras
    %[X1,map1]=imread(sprintf('images\\pointD\\img%d.png', nImagem));
    %[X2,map2]=imresize(img, IMG_RES);
    %subplot(1,2,1), imshow(X1,map1)
    %subplot(1,2,2), imshow(X2,map2)
    binarizedImg = im2bw(img);
    figurasBW(:,1) = reshape(binarizedImg, 1, []);
    if (rem(nImagem, 6) == 0)
        figurasTarget = identity(:, 6);
    else
        figurasTarget = identity(:, rem(nImagem, 6));
    end
    %% Carregar a rede neuronal
    net = load('net4.mat', 'net').net;

    %% Obter o resultado
    out = sim(net, figurasBW);
    [~, b] = max(out(:, 1));      
    [~, d] = max(figurasTarget(:, 1));

    %% Analisar resultado
    possibleFigures = ["circle", "kite", "parallelogram", "square", "trapezoid", "triangle"];
    fprintf('Figura correta: %s\n', possibleFigures(d));
    fprintf('Figura escolhido pela RN: %s\n', possibleFigures(b));
    
    if (b == d)
        disp('Correto!');
    else
        disp('Errado!');
    end
end