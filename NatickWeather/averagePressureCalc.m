% Channel IDs
readChId = 12397;
writeChId = 629784;

% API keys
writeKey = 'X6Z6AW8KJUH8BOP1';

% Read the latest 6 hrs (once a minute sample rate) barometeric pressure
[press,time] = thingSpeakRead(readChId,'Fields',6,'NumMinutes',60*6);

% Compute average
Pbar = mean(press)


thingSpeakWrite(writeChId,Pbar,'Fields',4,'WriteKey',writeKey);