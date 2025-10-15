%term_project20230606.m 지대공 미사일 방어 시뮬레이션 스크립트

height_fighter=100;%전투기의 좌표z값
Speed_fighter=30; %전투기의 속도값 (정확도를 위해 임의의 값으로 나눔)
fighter=[0,0,height_fighter];%전투기의 좌표
fighter_startpoint=[fighter(1),fighter(2),fighter(3)];%시작지점

location_missile=500; %미사일의 좌표 x값
Speed_misssile=60; %미사일 속도값 (정확도를 위해 임의의 값으로 나눔)
missile=[location_missile,0,0];%미사일 좌표
missile_startpoint=[missile(1),missile(2),missile(3)];%미사일 시작지점

distance=sqrt(((missile(1)-fighter(1))^2+((missile(2)-fighter(2))^2))+((missile(3)-fighter(3))^2));%전투기와 미사일의 거리

while distance>5

    x_f=linspace(fighter_startpoint(1),fighter(1),5);
    y_f=linspace(fighter_startpoint(2),fighter(2),5);
    z_f=linspace(fighter_startpoint(3),fighter(3),5);
    %전투기 궤적그래프 그리기 위한 전투기위치에서 시작지점까지의 배열

    x_m=linspace(missile_startpoint(1),missile(1),5);
    y_m=linspace(missile_startpoint(2),missile(2),5);
    z_m=linspace(missile_startpoint(3),missile(3),5);
    %미사일 궤적그래프 그리기 위한 미사일 위치에서 시작지점까지의 배열

    plot3(x_f,y_f,z_f,'r',x_m,y_m,z_m,'b') %전투기와 미사일 그래프
    xlabel('x축'),ylabel('y축'),zlabel('z축'),grid;
    xlim([0,600]),ylim([-200,200]),zlim([0,150]);%그래프 보여지는 범위
    drawnow %그래프 바로 그리기
    hold on %그래프 중첩해서 그리기
    

    normalizedvector=(fighter-missile)/norm(fighter-missile);
    %미사일에서 전투기까지의 크기가 1인 방향벡터 계산
    
    fighter_startpoint=fighter;%전투기의 궤적을 그리기위해 현재위치를 시작지점으로 설정
    missile_startpoint=missile;%미사일의 궤적을 그리기 위해 현재위치를 시작지점으로 설정
    fighter=fighter+[Speed_fighter,0,0]*0.03;%전투기 이동 후 좌표설정 시간증분 0.03초
    missile=missile+normalizedvector*Speed_misssile*0.03;%미사일 이동 후 좌표설정 시간증분 0.03초
    

    distance=sqrt(((missile(1)-fighter(1))^2+((missile(2)-fighter(2))^2))+((missile(3)-fighter(3))^2));
    %전투기와 미사일 거리계산
  
end
