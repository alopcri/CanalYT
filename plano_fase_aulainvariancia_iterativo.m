clear;

%% Descomentar este trecho para gerar a funcao de Lyapunov
% %Gerando dados
% for cont=1:200
%     [tout,xi] = ode45(@aulainvariancia,[0 10],5*randn(2,1));
% %     plot(xi(:,1),xi(:,2));
%     x{cont} = xi;
% %     hold on
% end
% 
% %Lyapunov
% x1 = -4:0.05:4;
% x2 = -4:0.05:4;
% for c1 = 1:length(x1);
%     for c2 = 1:length(x2);
%         V(c1,c2) = (3/4)*x1(c1)^2 - (1/12)*x1(c1)^4 + 0.5*x1(c1)*x2(c2) + 0.5*x2(c2)^2;
%     end
% end
% save dados_aulainvariancia x V x1 x2;
% %%%%%








%Plotando dados
load dados_aulainvariancia
[X1,X2] = meshgrid(x1,x2);
%dx = 0.05
for ind = 1:3:length(x{13})
    for cont=1:length(x)
        plot(x{cont}(:,1),x{cont}(:,2),'b-');
        hold on
    end

    axis([-4 4 -4 4]);
    plot([-sqrt(3) -sqrt(3)],[-4 4],'k--');
    plot([sqrt(3) sqrt(3)],[-4 4],'k--');
    
    %v = 1;
    %contour(X1',X2',V,[v v],'r-');
    
    %Acompanha trajetoria 13 no ''filme''
    trajacomp = 13;
    i1 = max(find(x1 <= x{trajacomp}(ind,1)));
    i2 = max(find(x2 <= x{trajacomp}(ind,2)));
    v = V(i1,i2);
    contour(X1',X2',V,[v v],'r-','LineWidth',3);
    
    plot(x{trajacomp}(1:ind,1),x{trajacomp}(1:ind,2),'k-','LineWidth',5);
    pause(1);
    hold off;
end

%[0.5, 3.5]

