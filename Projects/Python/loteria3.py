import pandas    as  pd


array3 = (1,3,5,8,9,10,12,13,15,16,18,20,21,23,24)
i=3118

while i < 3190:
 
    resultanalise =list(pd.read_excel('C:\QAX\Projects\Python\Fixtures\Lotofacil.xlsx',skiprows=i, usecols="C:Q"))
    # print(i, resultanalise)
    
    i=i+1
    posicoes_encontradas = 0

    for elemet in array3:
            if elemet in resultanalise:
                posicoes_encontradas +=1
    if posicoes_encontradas > 10:        
        print(i, resultanalise, posicoes_encontradas)
            
