%--------------------------------------------------------------------------
% KHỞI TẠO DỮ LIỆU
%--------------------------------------------------------------------------

% Bai 1
x1 = [7, 8, 9, 10, 11, 12, 13];
y1 = [3.1, 4.9, 5.3, 5.8, 6.1, 6.1, 5.9];
n = 2; % Bậc của đa thức hồi quy (bậc 2: y = ax^2 + bx + c)

% Bai 2
x2 = [0.78, 1.56, 2.34, 3.12, 3.81];
y2 = [2.50, 1.20, 1.12, 2.25, 4.28];

% Bai 3
x3 = [-3, -2, -1, 0, 1, 2, 3];
y3 = [-0.71, 1.9, 5.3, 5.8, 6.1, 6.1, 5.9]; % Lưu ý: Dữ liệu y3 có vẻ bị trùng lặp với y1 ở phần đuôi.

%--------------------------------------------------------------------------
% XỬ LÝ DỮ LIỆU (POLYFIT & POLYVAL)
%--------------------------------------------------------------------------

% Bai 1: Hồi quy đa thức bậc 2
p1 = polyfit(x1, y1, n);
a1 = p1(1);
b1 = p1(2);
c1 = p1(3);
x1_ve = linspace(min(x1), max(x1), 100);
y1_ve = polyval(p1, x1_ve);

% Bai 2: Hồi quy đa thức bậc 2
p2 = polyfit(x2, y2, n);
a2 = p2(1);
b2 = p2(2);
c2 = p2(3);
x2_ve = linspace(min(x2), max(x2), 100);
y2_ve = polyval(p2, x2_ve);

% Bai 3: Hồi quy đa thức bậc 2
p3 = polyfit(x3, y3, n);
a3 = p3(1);
b3 = p3(2);
c3 = p3(3);
x3_ve = linspace(min(x3), max(x3), 100);
y3_ve = polyval(p3, x3_ve);


%--------------------------------------------------------------------------
% IN KẾT QUẢ CÁC HÀM HỒI QUY
%--------------------------------------------------------------------------

fprintf('Ham co dang: y = a*x^2 + b*x + c\n\n')

fprintf('Bai 1:\n');
fprintf('a = %f\n', a1);
fprintf('b = %f\n', b1);
fprintf('c = %f\n', c1);
fprintf('=> y = (%f) * x^2 + (%f) * x + (%f)\n\n', a1, b1, c1);

fprintf('Bai 2:\n');
fprintf('a = %f\n', a2);
fprintf('b = %f\n', b2);
fprintf('c = %f\n', c2);
fprintf('=> y = (%f) * x^2 + (%f) * x + (%f)\n\n', a2, b2, c2);

fprintf('Bai 3:\n');
fprintf('a = %f\n', a3);
fprintf('b = %f\n', b3);
fprintf('c = %f\n', c3);
fprintf('=> y = (%f) * x^2 + (%f) * x + (%f)\n\n', a3, b3, c3);

%--------------------------------------------------------------------------
% VẼ ĐỒ THỊ
%--------------------------------------------------------------------------

figure;

% Đồ thị 1
subplot(3, 1, 1);
plot(x1, y1, 'bo', 'DisplayName', 'Du lieu goc');
hold on;
plot(x1_ve, y1_ve, 'DisplayName', 'Ham bac 2');
title('Bai toan 1');
xlabel('x');
ylabel('y');
legend;
grid on;

% Đồ thị 2
subplot(3, 1, 2);
plot(x2, y2, 'go', 'DisplayName', 'Du lieu goc');
hold on;
plot(x2_ve, y2_ve, 'DisplayName', 'Ham bac 2');
title('Bai toan 2');
xlabel('x');
ylabel('y');
legend;
grid on;

% Đồ thị 3
subplot(3, 1, 3);
plot(x3, y3, 'mo', 'DisplayName', 'Du lieu goc');
hold on;
plot(x3_ve, y3_ve, 'r--', 'DisplayName', 'Ham bac 2');
title('Bai toan 3');
xlabel('x');
ylabel('y');
legend;
grid on;
