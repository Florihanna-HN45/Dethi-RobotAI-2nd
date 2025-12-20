MSV = 16;
J = 0.02;
B = 0.2 / MSV;
Km = MSV;
K = MSV;


Tgian_vh = 30;
Tgian_mp = [0, Tgian_vh];
x0 = [0; 0]; 

he_servo = @(t, x, u_func) [ x(2); ...
    (1/J) * (Km * u_func(t) - B * x(2) - K * x(1)) ];

%song sin
f_a = 100; %
A_a = 24; % 
%  u(t) = A_a * sin(f_a * t)
u_a = @(t) A_a * sin(f_a * t); 

% 
ode_a = @(t, x) he_servo(t, x, u_a);

%
[t_a, x_a] = ode45(ode_a, Tgian_mp, x0);


theta_a = x_a(:, 1);
omega_a = x_a(:, 2);

%vuong
A_b = 24; 
T_b = 1; 
do_rong_xung = MSV; 


u_b = @(t) A_b * (square(2 * pi * t / T_b, do_rong_xung) + 1) / 2;

ode_b = @(t, x) he_servo(t, x, u_b);

[t_b, x_b] = ode45(ode_b, Tgian_mp, x0);

theta_b = x_b(:, 1);
omega_b = x_b(:, 2);


%VE

%song sin
figure(1);
sgtitle('Đặc tính hệ Servo - Trường hợp (a): Sóng Sin');

% 1
subplot(3, 1, 1);
plot(t_a, omega_a, 'b-');
title('Tốc độ quay \omega(t) (rad/s)');
xlabel('Thời gian (s)');
ylabel('Tốc độ \omega');
grid on;

% 2
subplot(3, 1, 2);
plot(t_a, theta_a, 'r-');
title('Góc quay \theta(t) (rad)');
xlabel('Thời gian (s)');
ylabel('Góc quay \theta');
grid on;

%  u(t)
subplot(3, 1, 3);
plot(t_a, u_a(t_a), 'k-');
title('Tín hiệu điều khiển u(t)');
xlabel('Thời gian (s)');
ylabel('Điện áp (V)');
grid on;

%Song vuong
figure(2);
sgtitle('Đặc tính hệ Servo - Trường hợp (b): Sóng Vuông');

% 1
subplot(3, 1, 1);
plot(t_b, omega_b, 'b-');
title('Tốc độ quay \omega(t) (rad/s)');
xlabel('Thời gian (s)');
ylabel('Tốc độ \omega');
grid on;
%2
subplot(3, 1, 2);
plot(t_b, theta_b, 'r-');
title('Góc quay \theta(t) (rad)');
xlabel('Thời gian (s)');
ylabel('Góc quay \theta');
grid on;

% 3
subplot(3, 1, 3);
plot(t_b, u_b(t_b), 'k-');
title('Tín hiệu điều khiển u(t)');
xlabel('Thời gian (s)');
ylabel('Điện áp (V)');
% 
ylim([-A_b*0.1, A_b*1.1]); 
grid on;