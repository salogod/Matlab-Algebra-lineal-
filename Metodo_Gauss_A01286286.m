A = [2, 6, 1; 1, 2, -1; 5,7, -4];
B = [7; -1; 9];

disp("----------------")
disp("Sistema 1")
sol = gaussElimination3x3(A, B);
disp("x=" + sol(1,1));
disp("y=" + sol(2,1));
disp("z=" + sol(3,1));

disp("----------------")
disp("Sistema 2")
A = [1, 1, 2; 2, 1, -3; -1,-2, 0];
B = [3; 4; -5];

sol2 = gaussElimination3x3(A, B);
disp("x=" + sol2(1,1));
disp("y=" + sol2(2,1));
disp("z=" + sol2(3,1));

disp("----------------")

function x = gaussElimination3x3(A, B)
    % Verificación de dimensiones
    [m, n] = size(A);
    if m ~= 3 || n ~= 3
        error('La matriz debe ser de dimensiones 3x3.');
    end

    % Combinar matriz de coeficientes y vector de términos constantes
    C = [A, B];

    % Eliminación Gaussiana
    for k = 1:2
        for i = k+1:3
            factor = C(i, k) / C(k, k);
            C(i, k:4) = C(i, k:4) - factor * C(k, k:4);
        end
    end

    % Sustitución hacia atrás
    x = zeros(3, 1);
    x(3) = C(3, 4) / C(3, 3);
    x(2) = (C(2, 4) - C(2, 3) * x(3)) / C(2, 2);
    x(1) = (C(1, 4) - C(1, 2) * x(2) - C(1, 3) * x(3)) / C(1, 1);
end
