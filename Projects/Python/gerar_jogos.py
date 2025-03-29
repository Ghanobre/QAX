import random
import json
import os

# Lista de 25 números (exemplo: [1, 2, 3, ..., 25])
lista = list(range(1, 26))

# Gerar 3 listas de 15 números aleatórios e ordená-las
jogo1 = sorted(random.sample(lista, 10))
jogo2 = sorted(random.sample(lista, 10))
# jogo3 = sorted(random.sample(lista, 10))
# jogo4 = sorted(random.sample(lista, 10))
# jogo5 = sorted(random.sample(lista, 10))

# Criar um dicionário para armazenar os jogos
jogos = {
    "Jogo1": jogo1,
    "Jogo2": jogo2
#     "Jogo3": jogo3,
#     "Jogo4": jogo4,
#     "Jogo5": jogo5
 }

# Caminho da pasta onde deseja salvar (usando caminho relativo)
caminho_pasta = 'C:\QAX\Projects\Python\Fixtures'

# Criar a pasta se ela não existir
if not os.path.exists(caminho_pasta):
    os.makedirs(caminho_pasta)

# Caminho completo do arquivo
caminho_arquivo = os.path.join(caminho_pasta, "jogos.json")

# Salvar as listas em um arquivo JSON na pasta especificada
with open(caminho_arquivo, "w") as file:
    json.dump(jogos, file)

# Exibir a confirmação de que o arquivo foi salvo
print(f"Arquivo salvo em: {caminho_arquivo}",jogos)
