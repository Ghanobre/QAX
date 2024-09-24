import random
    # Lista de 25 números (exemplo: [1, 2, 3, ..., 25])
lista = list(range(1, 26))
# Gerar 3 listas de 15 números aleatórios e ordená-las
jogo1 = sorted(random.sample(lista, 15))
jogo2 = sorted(random.sample(lista, 15))
jogo3 = sorted(random.sample(lista, 15))
# Exibir as listas ordenadas
print("Lista 1:", jogo1)
print("Lista 2:", jogo2)
print("Lista 3:", jogo3)