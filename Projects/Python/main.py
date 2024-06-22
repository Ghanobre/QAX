# import pandas as pd
# import wget
# import os

# def custom_progress_bar(current, total, width=80):
#     progress = current / total
#     bar_width = int(width * progress)
#     bar = '=' * bar_width + ' ' * (width - bar_width)
#     print(f'|{bar}| {progress:.0%}', end='\r')

# archive_file_path = "C:\QAX\Projects\Python\Fixtures\Lotofacil.xlsx"

# if os.path.exists(archive_file_path):
#     os.remove(archive_file_path)
#     print(f"{archive_file_path} has been deleted.")
# else:
#     print(f"{archive_file_path} does not exist.")

# link = "https://servicebus2.caixa.gov.br/portaldeloterias/api/resultados/download?modalidade=Lotof%C3%A1cil"
# wget.download (link,"C:\QAX\Projects\Python\Fixtures\Lotofacil.xlsx", bar= custom_progress_bar)
# print()

# resultanalise =list(pd.read_excel('C:\QAX\Projects\Python\Fixtures\Lotofacil.xlsx',skiprows=3077, usecols="C:Q"))

array0 = (1,3,6,7,8,9,12,13,14,15,18,19,20,21,25)
array1 = (2,3,4,6,7,10,11,14,15,17,18,19,21,22,25)
array2 = (1,3,5,7,8,9,11,13,15,17,19,20,21,23,25)
array3 = (1,3,5,8,9,10,12,13,15,16,18,20,21,23,24)
array4 = (2,4,5,6,8,9,11,12,15,16,18,20,22,23,25)

posicoes_encontradas = 0
for elemento in array1:
    if elemento in array0:
        posicoes_encontradas +=1
print('Jogo1 Gus',array0,posicoes_encontradas)

posicoes_encontradas = 0
for elemento in array2:
    if elemento in array0:
        posicoes_encontradas +=1
print('Jogo2 Gus',array0,posicoes_encontradas)

posicoes_encontradas = 0
for elemento in array3:
    if elemento in array0:
        posicoes_encontradas +=1
print('Jogo1 Ana',array0,posicoes_encontradas)

posicoes_encontradas = 0
for elemento in array4:
    if elemento in array0:
        posicoes_encontradas +=1
print('Jogo2 Ana',array0,posicoes_encontradas)