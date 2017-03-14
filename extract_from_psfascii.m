clc;
close;
clear;

%%
fname='OSCtran1.tran.tran.txt';
fid=fopen(fname);
line=0;
while line~=-1
   line=  fgets(fid);
   if findstr(line,'VALUE')>0  
       break;
   end
end
if line == -1
    error('no VALUE found');
end

count_time=0;
count_EN_HFOSC_FRMDIG=0;
count_HFOSC_CLK_TODIG=0;
while line~=-1
   line=  fgets(fid);
   if findstr(line,'time')>0  
       A = sscanf(line(8:end),'%f');
       count_time=count_time+1;
       time(count_time)= A(1);
   end
   if findstr(line,'EN_HFOSC_FRMDIG')>0  
       A = sscanf(line(19:end),'%f');
       count_EN_HFOSC_FRMDIG=count_EN_HFOSC_FRMDIG+1;
       EN_HFOSC_FRMDIG(count_EN_HFOSC_FRMDIG)= A(1);
   end
   if findstr(line,'HFOSC_CLK_TODIG')>0  
       A = sscanf(line(19:end),'%f');
       count_HFOSC_CLK_TODIG=count_HFOSC_CLK_TODIG+1;
       HFOSC_CLK_TODIG(count_HFOSC_CLK_TODIG)= A(1);
   end
end

fclose(fid);

%%
savefile=sprintf('%s\\..\\read_data\\extracted_data.mat',pwd);
save(savefile,'time', 'EN_HFOSC_FRMDIG','HFOSC_CLK_TODIG');

plot(time,'r-');
hold on;
plot(EN_HFOSC_FRMDIG,'g-');
hold on;
plot(HFOSC_CLK_TODIG,'b-');
