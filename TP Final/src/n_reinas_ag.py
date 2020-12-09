#!/usr/bin/env python3

import random
import numpy
import matplotlib.pyplot as plt
import argparse


def crear_individuo(tamanio_individuo):
	"""
	Devuelve un individio con un un numero de genes igual al tamaño recibido como argumento.
	"""
    # return [random.randint(0, tamanio_individuo-1) for i in range(0, tamanio_individuo)]
	return random.sample(range(0, tamanio_individuo), tamanio_individuo)


def crear_poblacion(tamanio_poblacion, tamanio_individuo):
    """
    Devuelve una poblacion de individuos, respectivamente definidos por su tamaño recibidos como argumento.
    """
    return [crear_individuo(tamanio_individuo) for i in range(tamanio_poblacion)]


def evaluar_aptitud(individuo):
	"""
    Evalua la aptitud del individuo recibido como parámetro. Para este caso de n-reinas,
	es necesario evaluar si las reinas ubicadas en el tablero se amenazan entre si.
	
    Devuelve un valor entero que corresponde al numero de amenazas para cada individuo.
	"""
	contDA1 = 0
	contDA2 = 0
	contDB1 = 0
	contDB2 = 0
	idoGlobal = 0
	
	#contamos las coincidencias en el mismo renglon
	for i in range(0, len(individuo)):
		auxcont = individuo.count(i) #cuenta coinsidencias en el condidato por renglon
		if auxcont>1: #si son mas de dos entonces se atacan
			idoGlobal = idoGlobal + auxcont
	
	#contamos las reinas que se atacan en diagonal hacia arriba
	for i in range(0, len(individuo)):
		auxcont = 0
		for j in range(0,i+1):
			if individuo[j] == i-j:
				auxcont = auxcont +1
		if auxcont>1:
			contDA1 = contDA1 + auxcont
	
	for k in range(1, len(individuo)):
		auxcont = 0
		i = len(individuo) - k
		for j in range(i, len(individuo)):
			if individuo[j] == (len(individuo)-1) - (j-i):
				auxcont = auxcont +1
		if auxcont>1:
			contDA2 = contDA2 + auxcont

	#contamos las reinas que se atacan en diagonal hacia abajo
	for i in range(0, len(individuo)):
		auxcont = 0
		for j in range(0, len(individuo)):
			if individuo[j] == (len(individuo)-1)-(i-j):
				auxcont = auxcont +1
		if auxcont>1:
			contDB1 = contDB1 + auxcont

	for i in range(1, len(individuo)):
		auxcont = 0
		for j in range(i, len(individuo)):
			if individuo[j] == j-i:
				auxcont = auxcont + 1
		if auxcont > 1:
			contDB2 = contDB2 + auxcont
	
	#print(idoGlobal, contDA1, contDA2, contDB1, contDB2)
	idoGlobal = idoGlobal + contDA1 + contDA2 + contDB1 + contDB2

	return idoGlobal


def calcular_fitness(individuo):
    return evaluar_aptitud(individuo)


def seleccion_individuos(poblacion, pressure=3):
	"""
	Devuelve una lista de individuos seleccionados por mejor fitness, limitada por pressure.
	"""

	#Calcula el fitness de cada individuo, y lo guarda en pares ordenados de la forma (5 , [1,2,1,1,4,1,8,9,4,1])
	evaluados = [(calcular_fitness(i), i) for i in poblacion]

	#Ordena los pares ordenados y se queda solo con el array de valores
	poblacion_evaluada = [i[1] for i in sorted(evaluados)]

	nueva_poblacion = [i for i in poblacion_evaluada]

	#Esta linea selecciona los 'n' individuos del final, donde n viene dado por 'pressure'
	seleccionados = numpy.copy(poblacion_evaluada[:pressure])
	
	#Convierte a la lista en inmutable
	seleccionados.flags.writeable = False

	return nueva_poblacion, seleccionados
	

def cruza(poblacion, seleccionados, porcentaje_cruza, pressure=3):
	"""
	Devuelve una nueva poblacion en la que los individuos menos aptos son cruzados
	a partir de individuos padres mas aptos. Esta nueva poblacion se crea a partir
	de la recibida como parametro, ademas es posible definirse la cantidad de elementos
	aptos a seleccionar para posteriormente realizar la cruza, a partir del parametro "pressure"
	"""
	
	nueva_poblacion = [i for i in poblacion]

	# Cruza los individuos que fueron seleccionados como padres
	for i in range(0, pressure):
		#Se elige un punto para hacer el intercambio
		punto = random.randint(1, len(seleccionados[0])-1)

		#Se eligen dos padres
		padres = seleccionados[numpy.random.choice(seleccionados.shape[0], size=2, replace=False), :]

		#Se mezcla el material genetico de los padres en cada nuevo individuo		
		nueva_poblacion[i][:punto] = padres[0][:punto]
		nueva_poblacion[i][punto:] = padres[1][punto:]


	# Cruza los individuos que no fueron seleccionados como padres
	for i in range(pressure, len(nueva_poblacion)):
		if random.random() <= porcentaje_cruza:
			#Se elige un punto para hacer el intercambio
			punto = random.randint(1, len(seleccionados[0])-1)

			#Se eligen dos padres
			padres = seleccionados[numpy.random.choice(seleccionados.shape[0], size=2, replace=False), :]

			#Se mezcla el material genetico de los padres en cada nuevo individuo		
			nueva_poblacion[i][:punto] = padres[0][:punto]
			nueva_poblacion[i][punto:] = padres[1][punto:]
	
	return nueva_poblacion


def mutacion(poblacion, porcentaje_mutacion, pressure=3):
	"""
	Devuelve una nueva poblacion con los individuos de la poblacion recibida 
	como parametro ya mutados. Se debe tener en cuenta que la mutacion es posterior 
	a la cruza. El criterio de mutacion para el caso es el intercambio de dos genes 
	seleccionados al azar.
    """
	nueva_poblacion = [i for i in poblacion]

	for i in range(len(nueva_poblacion)):
		
		#Cada individuo de la poblacion (menos los padres) tienen una probabilidad de mutar
		if random.random() <= porcentaje_mutacion:

			#Se elige un punto al azar
			punto1 = random.randint(0,len(nueva_poblacion[0])-1)

			#Se elige un valor al azar
			valor = random.randint(0,len(nueva_poblacion[0])-1)

			while nueva_poblacion[i][punto1] == valor:
				valor = random.randint(0,len(nueva_poblacion[0])-1)

			#Se aplica la mutacion
			nueva_poblacion[i][punto1] = valor

	return nueva_poblacion


def mejor_individuo_poblacion_final(poblacion_final):

	mejor_fitness = 10

	for i in poblacion_final:
		if evaluar_aptitud(i) <= mejor_fitness:
			mejor_fitness = evaluar_aptitud(i)
			mejor_individuo = i

	return mejor_individuo


def algoritmo_genetico(tamanio_individuo, tamanio_poblacion, generaciones, porcentaje_mutacion, porcentaje_cruza, pressure=3):
	
	poblacion_inicial = crear_poblacion(tamanio_poblacion, tamanio_individuo)

	# poblacion_inicial = [
	# 	[7,3,0,2,5,1,6,4],
	# 	[7,2,0,5,1,4,6,3],
	# 	[7,1,4,2,0,6,3,5],
	# 	[7,1,3,0,6,4,2,5],
	# 	[6,4,2,0,5,7,1,3],
	# 	[6,3,1,7,5,0,2,4],
	# 	[6,3,1,4,7,0,2,5],
	# 	[6,2,7,1,4,0,5,3],
	# 	[6,2,0,5,7,4,1,3],
	# 	[6,1,5,2,0,3,7,4]
	# ]

	print(f'\nPOBLACION INICIAL: {poblacion_inicial}\n')
	
	poblacion_final = None
	for i in range(0, generaciones):

		poblacion_por_mejor_FF, seleccionados = seleccion_individuos(poblacion_inicial, pressure)
		poblacion_cruzada = cruza(poblacion_por_mejor_FF, seleccionados, porcentaje_cruza, pressure)
		poblacion_final = mutacion(poblacion_cruzada, porcentaje_mutacion, pressure)

	return poblacion_final


def plotear_solucion(individuo):
		print(f'Individuo: {individuo}')
		plt.figure()
		x = range(len(individuo))
		x = numpy.array(x)
		y = numpy.array(individuo)
		x = x + 0.5
		y = y + 0.5
		plt.scatter(x, y)
		plt.xlim(0, len(individuo))
		plt.ylim(0, len(individuo))
		plt.xticks(x-0.5)
		plt.yticks(x-0.5)
		plt.grid(True)
		plt.title(f"Individuo solucion: {individuo}")
		plt.show()


def main():

	parser = argparse.ArgumentParser(prog='Guía 5.1. Algoritmos Genéticos (AG)', description='Problema de las n-Reinas')
	parser.add_argument('-ti', help='Tamaño de individuo', type=int)
	parser.add_argument('-tp', help='Tamaño de poblacion', type=int)
	parser.add_argument('-g', help='Cantidad de generaciones', type=int)
	parser.add_argument('-pm', help='Porcentaje de mutacion', type=float)
	parser.add_argument('-pc', help='Porcentaje de cruza', type=float)
	parser.add_argument('-p', help='Pressure (candidatos a ser padres - min(2) - max(tp))', type=int, default=3)
	parser.add_argument('-c', help='Cantidad de corridas', type=int)

	args = parser.parse_args()

	TAMANIO_INDIVIDUO = args.ti
	TAMANIO_POBLACION = args.tp
	GENERACIONES = args.g
	PRESSURE = args.p
	PORCENTAJE_MUTACION = args.pm
	PORCENTAJE_CRUZA = args.pc
	CORRIDAS = args.c

	print(f'\n{parser.prog} - {parser.description}\n')

	print(f'TAMANIO_INDIVIDUO: {TAMANIO_INDIVIDUO}')
	print(f'TAMANIO_POBLACION: {TAMANIO_POBLACION}')
	print(f'GENERACIONES: {GENERACIONES}')
	print(f'PORCENTAJE_MUTACION: {PORCENTAJE_MUTACION}')
	print(f'PRESSURE: {PRESSURE}')

	soluciones = []

	for i in range(CORRIDAS):
		print(f'\nEJECUCION N°: {i+1}')

		poblacion_final = algoritmo_genetico(TAMANIO_INDIVIDUO,TAMANIO_POBLACION,GENERACIONES,PORCENTAJE_MUTACION,PORCENTAJE_CRUZA,PRESSURE)
		print(f'POBLACION FINAL (individuo, fitness): {[(i, evaluar_aptitud(i)) for i in poblacion_final]}\n')
		
		mejor_individuo = mejor_individuo_poblacion_final(poblacion_final)
		print(f'MEJOR INDIVIDUO ENCONTRADO: {mejor_individuo}, SU FITNESS ES: {evaluar_aptitud(mejor_individuo)}\n')
		
		if evaluar_aptitud(mejor_individuo) == 0:
			soluciones.append(mejor_individuo)
	
	print(f'\nSe encontraron {len(soluciones)} soluciones: {soluciones}\n')
	
	if len(soluciones) > 0:
		for s in soluciones:
			plotear_solucion(s)


if __name__ == "__main__":
	main()
