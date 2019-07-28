%Create a waveform and visualize it.
data = sin(1:64);
plot(data);

%Create a client interface and open it.
fprintf('Creating Client...\n');
t = tcpip('localhost', 30000, 'NetworkRole', 'client');
fprintf('Client Created...\n');

fopen(t)

%Write the waveform to the server session.
fwrite(t, data)