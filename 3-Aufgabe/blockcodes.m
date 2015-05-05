

%Berechnung eines Codeworts bei gegebener Generatormatrix
generatorMatrixOne =[1,1,1,1,0,0,1,0 ; 0,0,1,1,1,1,0,1]
generatorMatrixTwo = [ 1,1,0,1,0,0,0 ; 0,1,1,0,1,0,0; 1,1,1,0,0,1,0; 1,0,1,0,0,0,1]
word=[0,1,1,0]
[m,n] = size(generatorMatrixTwo)
codeword=zeros(1,n)

x = 1;
for i = 1: 1:n
    index=0
    for j = 1: 1:m
        tmp = generatorMatrixTwo(j,i)
        charWord = word(j)
        index = index + tmp * charWord
    end
    codeword(x) = mod(index,2)
    x = x+1
end

%Berechnung der Parity-Check-Matrix bei gegebener Generatormatrix
H=gen2par(generatorMatrixTwo)
H=H'
e=[0,1,0,0,0,0,0]
x=[1,0,0,0,1,1,0]
y=e|x

%bei der addition in der Multiplikation darf kein uebertrag stattfinden
s=y*H


