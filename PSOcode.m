function waterlevel = PSOcode(h) 

bird_setp =50;   % Number of iteration berapa kali dia train untuk dpt better optimization
dim = 2;          % Kat sini dimention dia cuma 2 1.ampitude for water 2.Time 
c2 =1.2;          % PSO parameter C1 constain mesti lest dr water level
c1 = 0.12;        % PSO parameter C2 constain mesti lest dr water level
w =0.9;           % space of tank
%fitness=0*ones(h,bird_setp);

%initialize the parameter %
R1 = rand(dim, h);
R2 = rand(dim, h);
current_fitness =0*ones(h,1);

% Initializing swarm and velocities and waterlevel %                                 
current_waterlevel = 10*(rand(dim, h)-.5);
bernuoline = 0.07*sqrt(2*9.81*h);%.3*randn(dim, h) ; %bernuoline code
local_best_waterlevel  = current_waterlevel ;

local_best_fitness  = current_fitness ;
[global_best_fitness,g] = min(local_best_fitness) ;

for i=1:h
    globl_best_waterlevel(:,i) = local_best_waterlevel(:,g) ;
end

%  bernuoline UPDATE  %
bernuoline = w *bernuoline + c1*(R1.*(local_best_waterlevel-current_waterlevel)) + c2*(R2.*(globl_best_waterlevel-current_waterlevel));
%   SWARMUPDATE    %     
waterlevel = current_waterlevel + bernuoline; 
waterlevel=max(waterlevel(:,1));
end

