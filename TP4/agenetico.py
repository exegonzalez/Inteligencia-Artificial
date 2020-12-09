#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# d) Hacer el algoritmo/seudocódigo:
# 1. entrar una cadena
# 2. parsear las cadenas de bits en valores
# 3. hallar los códigos válidos y reemplazar los bits por los símbolos
# 4. descartar las si hay 'n/a'
# 5. evaluar fitness

import operator

def cromosoma(cadena):
    """ Devuelve una lista un cromosoma con sus respectivos genes separados"""
    return [[cadena[i:i+4]] for i in range(0 , len(cadena)-1, 4) if i != 36]

def parsearCromosoma(cromosoma, valoresValidos):
    """Devuelve un cromosoma con los valores reales"""
    return [valoresValidos.get(gen[0]) for gen in cromosoma if gen[0] in valoresValidos]

def target(cromosomaParseado):
    try:
        # Definir las operaciones aritmeticas
        ops = {'+': operator.add, '-': operator.sub, '*': operator.mul, '/': operator.floordiv}
        # Definir el target
        t = cromosomaParseado[0]
        for x in range(1, len(cromosomaParseado), 2):
            t = ops[cromosomaParseado[x]](t, cromosomaParseado[x+1])
        return t
    except ZeroDivisionError: 
        return 'No es posible dividir por 0'
    except:
        return 'Hay un error en la configuracion del cromosoma, la correcta es: # -> operador -> # ...'

def fitness(sol, target):
    return round(1/(sol-target), 2) if (type(sol) is int and type(target) is int) else 'Error en uno de los parametros'


valoresValidos = {
    '0000': 0,
    '0001': 1,
    '0010': 2,
    '0011': 3, 
    '0100': 4,
    '0101': 5, 
    '0110': 6,
    '0111': 7,
    '1000': 8,
    '1001': 9, 
    '1010':'+',
    '1011':'-', 
    '1100':'*',
    '1101':'/'
}



cadenaNoValida="010010100101110001001101001010101010"
cadena='010010100101110001001101001010100101'

cromosoma = cromosoma(cadena)
print(f'Cromosoma: {cromosoma}')

cromosomaParseado = parsearCromosoma(cromosoma, valoresValidos)
print(f'Cromosoma parseado: {cromosomaParseado}')

target = target(cromosomaParseado)
print(f'Target: {target}')

solucion = 42
print(f'Solucion: {solucion}')

print(f'Fitness: {fitness(solucion, target)}')

import random 

# print(f'fila: {random.randrange(1, 8)}, columna {random.randrange(1, 8)}')
# print(f'fila: {random.randrange(1, 8)}, columna {random.randrange(1, 8)}')
# print(f'fila: {random.randrange(1, 8)}, columna {random.randrange(1, 8)}')
# print(f'fila: {random.randrange(1, 8)}, columna {random.randrange(1, 8)}')