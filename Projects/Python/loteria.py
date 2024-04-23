import pandas    as  pd


array1 = (2,3,4,6,7,10,11,14,15,17,18,19,21,22,25)
i=25

while i < 3076:
 
    resultanalise =list(pd.read_excel('C:\QAX\Projects\Python\Fixtures\Lotofacil.xlsx',skiprows=i, usecols="C:Q"))
    # print(i, resultanalise)
    
    i=i+1
    posicoes_encontradas = 0

    for elemet in array1:
            if elemet in resultanalise:
                posicoes_encontradas +=1
    if posicoes_encontradas == 11:        
        print(i, resultanalise, posicoes_encontradas)
            
