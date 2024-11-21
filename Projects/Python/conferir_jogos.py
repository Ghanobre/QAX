def transformar_valor(valor_original):
        numeros = [int(valor_original[i:i+2]) for i in range(0, len(valor_original), 2)]
        return numeros

def jogo1(array0,array1):
        posicoes_encontradas = 0
        for elemento in array1:
                if elemento in array0:
                        posicoes_encontradas +=1
        return 'jogo1',array1,posicoes_encontradas

def jogo2(array0,array2):
        posicoes_encontradas = 0
        for elemento in array2:
                if elemento in array0:
                        posicoes_encontradas +=1
        return 'Jogo2',array2,posicoes_encontradas

def jogo3(array0,array3):
        posicoes_encontradas = 0
        for elemento in array3:
                if elemento in array0:
                        posicoes_encontradas +=1
        return 'Jogo3',array3,posicoes_encontradas