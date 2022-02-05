from interpretare import interpretare
from interpretare import schimbarebruscaacceleratie
from interpretare import analizaacceleratielaterala
from interpretare import crestereacceleratiesusjos

def cazatura(rez_interpretare_parametrii):
    #functie utilizata dupa interpretarea datelor pentru output
    if rez_interpretare_parametrii  >= 0.5 :
        print("aualeu, ai cazut!")
        return False
    return True
n1 = [1, 2, 3] #replace with something from data file
n2 = [1, 2, 3] #replace with something from data file
n3 = [1, 2, 3] #replace with something from data file
x = True
while(x) :
    x = cazatura(interpretare(schimbarebruscaacceleratie(n1), analizaacceleratielaterala(n2), crestereacceleratiesusjos(n3)))