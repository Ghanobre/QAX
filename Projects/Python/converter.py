def transformar_valor(valor_original):
        numeros = [int(valor_original[i:i+2]) for i in range(0, len(valor_original), 2)]
        return(numeros)


def resultado1(array0):
        array1 = (2,3,4,6,7,10,11,14,15,17,18,19,21,22,25)
        posicoes_encontradas = 0
        for elemento in array1:
                if elemento in array0:
                        posicoes_encontradas +=1
        return('Jogo1 Gus',array0,posicoes_encontradas)

def resultado2(array0):
        array1 = (1,4,5,6,8,9,11,12,13,16,19,20,23,24,25)
        posicoes_encontradas = 0
        for elemento in array1:
                if elemento in array0:
                        posicoes_encontradas +=1
        return('Jogo2 Gus',array0,posicoes_encontradas)

def resultado3(array0):
        array1 = (1,3,5,8,9,10,12,13,15,16,18,20,21,23,24)
        posicoes_encontradas = 0
        for elemento in array1:
                if elemento in array0:
                        posicoes_encontradas +=1
        return('Jogo1 Ana',array0,posicoes_encontradas)

def resultado4(array0):
        array1 = (2,4,5,6,8,9,11,12,15,16,18,20,22,23,25)
        posicoes_encontradas = 0
        for elemento in array1:
                if elemento in array0:
                        posicoes_encontradas +=1
        return('Jogo2 Ana',array0,posicoes_encontradas)