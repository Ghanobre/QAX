def transformar_valor(valor_original):
    numeros = [f"'{valor_original[i:i+2]}'" for i in range(0, len(valor_original), 2)]
    return "[" + ", ".join(numeros) + "]"
