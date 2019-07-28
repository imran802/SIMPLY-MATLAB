% Refer below website for understanding this code
%https://www.wikihow.com/Convert-a-Number-from-Decimal-to-IEEE-754-Floating-Point-Representation
exp= bin2dec(binstr(1,1+1:8));  % extracting exponent decimal (32 bit floating IEEE754)
pwr=exp-127;        % 127 due to 32 bit floating repb  




if binstr(1,1)=='0'
    
