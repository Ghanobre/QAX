import pandas    as  pd


array4 = (2,4,5,6,8,9,11,12,15,16,18,20,22,23,25)
i=3059

while i < 3101:
 
    resultanalise =list(pd.read_excel('C:\QAX\Projects\Python\Fixtures\Lotofacil.xlsx',skiprows=i, usecols="C:Q"))
    # print(i, resultanalise)
    
    i=i+1
    posicoes_encontradas = 0

    for elemet in array4:
            if elemet in resultanalise:
                posicoes_encontradas +=1
    if posicoes_encontradas > 10:        
        print(i, resultanalise, posicoes_encontradas)
            
