tic
% Channel IDs
readChId = 12397;
writeChId = 629784;

% API keys
writeKey = yourAPIKey;

% Read the latest 6 hrs (once a minute sample rate) barometeric pressure
%[press,time] = thingSpeakRead(readChId,'Fields',6,'NumMinutes',60*6);
[press,time] = thingSpeakRead(readChId,'Fields',6,'NumPoints',8000);

% Compute average
Pbar = mean(press)

thingSpeakWrite(writeChId,Pbar,'Fields',4,'WriteKey',writeKey);
toc