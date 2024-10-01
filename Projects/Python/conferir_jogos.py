def transformar_valor(valor_original):
        numeros = [int(valor_original[i:i+2]) for i in range(0, len(valor_original), 2)]
        return(numeros)

def jogo1(array0):
        array1 = (1,2,3,6,7,8,9,11,13,15,17,18,19,20,21)
        posicoes_encontradas = 0
        for elemento in array1:
                if elemento in array0:
                        posicoes_encontradas +=1
        return 'jogo1',array1,posicoes_encontradas

def jogo2(array0):
        array1 = (1,4,5,6,8,9,11,12,13,15,16,17,20,23,25)
        posicoes_encontradas = 0
        for elemento in array1:
                if elemento in array0:
                        posicoes_encontradas +=1
        return('Jogo2',array1,posicoes_encontradas)

def jogo3(array0):
        array1 = (1,2,3,4,5,6,10,13,15,18,19,20,21,22,24)
        posicoes_encontradas = 0
        for elemento in array1:
                if elemento in array0:
                        posicoes_encontradas +=1
        return('Jogo3',array1,posicoes_encontradas)