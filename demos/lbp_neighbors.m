function pts = lbp_neighbors(P, R)
    pts = zeros(P,2);
    
    for p = 1:P
         pts(p,1) = -R*sin(2*pi*p/P);
         pts(p,2) = R*cos(2*pi*p/P);
    end
    
    plot(pts(:,1), pts(:,2),'.','markersize',30,'LineSmoothing','on');
    hold on
    plot(0, 0,'r.','markersize',30,'LineSmoothing','on')
    set(gca,'XTick',-(R+0.5):1:(R+0.5))
    set(gca,'YTick',-(R+0.5):1:(R+0.5))
    axis([-(R+0.5), R+0.5, -(R+0.5), R+0.5]);
    grid on
    axis square 
end