%%Response to Coil query
% For instance go for max upto 2 reg for now.............
% In this instance we are using our numbers
% ONLY INTEGERS for 2 reg
% FLOAT for 1 reg for now e.g. 26.35   
% Accept a connection from any machine on port 502.
clear
clc
fprintf('Creating Server...\n');
t = tcpip('192.168.56.2', 502, 'NetworkRole', 'server');
fprintf('Server Created...\n')

%Open a connection. This will not return until a connection is received.
fprintf('Waiting for a client to connect...\n');
fopen(t);
pause(10);
fprintf('Client Connected...\n')
%Read the waveform and confirm it visually by plotting it.
fprintf('Receiving Data...\n')
data = get(t,'BytesAvailable')
%data=12
data_Final = fread(t, data)
m=data_Final;

%decoding packets receive
TransID=[m(1);m(2)];
ProtID=[m(3);m(4)];
Length=[m(5);m(6)];
UnitID=[m(7)];
FunCod=[m(8)];
AddressHi=[m(9)];
AddressLo=[m(10)];
ValueHi=[m(11)];
ValueLo=[m(12)];

%creating packet to send
var=(2^(ValueLo))-1;  % This is decide how many number of coils are high
RTransID=TransID;
RProtID=ProtID;
RLenght=5;
RUnitID=UnitID
RFunCod=FunCod;
Rdata1=1;
Rdata2=1;
Rdata3=1;
Rdata4=1;
Rdata5=1;
N=ValueLo
Rmessage=[RTransID;RProtID;0;RLenght;RUnitID;RFunCod;N;0;64;0;26.5]
fwrite(t, Rmessage,'uint8')
%fread(t)
% plot(data_Final);


