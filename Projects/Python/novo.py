import pandas as pd
import wget
import os

def custom_progress_bar(current, total, width=80):
    progress = current / total
    bar_width = int(width * progress)
    bar = '=' * bar_width + ' ' * (width - bar_width)
    print(f'|{bar}| {progress:.0%}', end='\r')

archive_file_path = "C:\QAX\Projects\Python\Fixtures\Lotofacil.xlsx"

if os.path.exists(archive_file_path):
    os.remove(archive_file_path)
    print(f"{archive_file_path} has been deleted.")
else:
    print(f"{archive_file_path} does not exist.")

link = "https://servicebus2.caixa.gov.br/portaldeloterias/api/resultados/download?modalidade=Lotof%C3%A1cil"
wget.download (link,"C:\QAX\Projects\Python\Fixtures\Lotofacil.xlsx", bar= custom_progress_bar)
print()


array1 = (1,2,3,4,5,6,8,10,13,16,20,21,22,23,24)
i=25 

while i < 3199:
 
    resultanalise =list(pd.read_excel('C:\QAX\Projects\Python\Fixtures\Lotofacil.xlsx',skiprows=i, usecols="C:Q"))
    # print(i, resultanalise)
    
    i=i+1
    posicoes_encontradas = 0

    for elemet in array1:
            if elemet in resultanalise:
                posicoes_encontradas +=1
    if posicoes_encontradas > 10:        
        print(i, resultanalise, posicoes_encontradas)
            
