tt = 1:256;
yy = sin(2*pi/50*tt);
a = ones(256,256); 
a = a.*yy;
img = xx;
%show_img_v2(a, 1);
%show_img_v2(xx, 1);
%plot(a(1, 1:256));
%plot(xx(200, 1:256));
negativepic = negative(img);
%show_img_v2(negativepic, 1);

%FILTER EYE IMAGE HORIZONTALY AND VERTICALLY

xx = echart;
%x1 = echart(256-33,:);
bh = ones(1,7)./7;
bv = ones(7,1)./7;
%x2 = filter(bh, 1, x1);
y1 = conv2(xx, bh);
x1 = conv2(xx, bv);
x2 = conv2(x1, bv);
x2=x2(:,1:end-6); %This cuts off the weird 0-values at the end of the matrix
%{
tiledlayout(2, 2);
nexttile
show_img_v2(xx, 1);
nexttile
show_img_v2(y1, 1);
nexttile
show_img_v2(x1, 1);
nexttile
show_img_v2(x2, 1);
%}

%MORE FILTERS FOR SHOSTY IMAGE
xx = cdata;

a0 = ones(1,1);
a1 = ones(3,3)/3;
a2 = ones(7,7)/7;
a3 = [-1 1]; %filter only rows
a4 = [-1 3 -1]; %filter only rows
a5 = ones(5, 5);
a5(1,1) = -1;
a5(5,1) = -1;
a5(1, 5) = -1;
a5(5, 5) = -1;

xx = conv2(xx, a0);
x1 = conv2(xx, a1);
x2 = conv2(xx, a2);
x3 = conv2(xx, a3);
x4 = conv2(xx, a4);
x5 = conv2(xx, a5);


% Graphing them
tiledlayout(2, 3);
nexttile
show_img_v2(xx, 1);
nexttile
show_img_v2(x1, 1);
nexttile
show_img_v2(x2, 1);
nexttile
show_img_v2(x3, 1);
nexttile
show_img_v2(x4, 1);
nexttile
show_img_v2(x5, 1);

%{
syms k
bk = piecewise(k==11, 1.1, 1 <= k <= 21, exp(-.075*((k-10)^2)), 0);
bk = uint8(subs(bk, k, 1:256));
xy = conv2(xx, bk);

%[h,f] = freqz(bk,xx);

tiledlayout(1,2);
nexttile
stem(impulse(xy));
nexttile
stem(xx, xy);
%}

