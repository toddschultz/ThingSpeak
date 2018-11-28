% Channel IDs
readChId = 12397;
writeChId = 629784;

% API keys
writeKey = yourAPIKey;

% Read the latest 20 points of temperature data with timestamps and humidity
[temp,time] = thingSpeakRead(readChId,'Fields',4,'NumPoints',20);
humidity = thingSpeakRead(readChId,'Fields',3,'NumPoints',20);

% Compute dew point
tempC = (5/9)*(temp-32); 
b = 17.62;
c = 243.5;
gamma = log(humidity/100) + b*tempC./(c+tempC);
dewPoint = c*gamma./(b-gamma);
dewPointF = (dewPoint*1.8) + 32

thingSpeakWrite(writeChId,[temp,humidity,dewPointF],'WriteKey',writeKey, ...
    'Fields',[1,2,3],'Timestamp',time);

