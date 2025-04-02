% Session 2 - sampling

fs = 8000;
t = 0 : 1/fs : 1;

x = sin(2*pi*1000*t) + 0.5*sin(2*pi*2900*t);

subplot(2,1,1);
plot(x);

sampled = upsample(x, 6);
sampled = downsample(sampled, 8);
subplot(2,1,2);
plot(sampled);
