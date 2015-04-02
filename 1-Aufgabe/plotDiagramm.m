pathToFile='c:\enter\the\path\here\rfc2324.txt'
fid=fopen(pathToFile,'r');
C=textscan(fid,'%c')%,'delimiter','\n')
fclose(fid)

a=sort(C{1,1},'descend')
b=double(a)

% hist determined the frequency of the letters in the textfile %
[frequency,number]=hist(b,unique(b))
number=number'

% combine the two 1dim arrays to a 2dim matrix %
new=[frequency; number]

% sort the 2dim matrix according to the first row (frequency) %
[Y,I]=sort(new(1,:),'descend');
B=new(:,I)

% Absteigende Häufigkeit der Zeichen %
figure(1)
plot(B(1,:))
xlabel('Zeichen (sortiert)')
ylabel('Häufigkeit')

% 10 häufigste Zeichen als Balkendiagramm %
figure(2)
letters=char(1,10)
i = 1;
for x=B(2,1:10)
    letters(i) = char(x)
    i= i+1;
end

bar(B(1,1:10))
set(gca,'XTickLabel',letters)

% 10 häufigste Zeichen als Kuchendiagramm %
figure(3)
pie(B(1,1:10))
legend(letters,'Location','eastoutside')
