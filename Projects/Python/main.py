# import pandas as pd

# pd.read_html('https://loterias.caixa.gov.br/Paginas/Lotofacil.aspx')

array0 = ('02','04','05','07','08','09','10','11','12','15','18','19','20','21','23')
array1 = ('02','03','04','06','07','10','11','14','15','17','18','19','21','22','25')
array2 = ('01','04','05','06','08','09','11','12','13','16','19','20','23','24','25')
array3 = ('01','03','05','08','09','10','12','13','15','16','18','20','21','23','24')
array4 = ('02','04','05','06','08','09','11','12','15','16','18','20','22','23','25')

posicoes_encontradas = 0

for elemento in array1:
    if elemento in array0:
        posicoes_encontradas +=1
print(posicoes_encontradas)

posicoes_encontradas = 0
for elemento in array2:
    if elemento in array0:
        posicoes_encontradas +=1
print(posicoes_encontradas)

posicoes_encontradas = 0
for elemento in array3:
    if elemento in array0:
        posicoes_encontradas +=1
print(posicoes_encontradas)

posicoes_encontradas = 0
for elemento in array4:
    if elemento in array0:
        posicoes_encontradas +=1
print(posicoes_encontradas)