class ochoReinas():
	'''El problema de las 8 reinas usando backtracking'''
	def __init__(self):
		self.solution = []
		self.found = False
		self.board = board = [[' ']*8 for i in range(8)]

	def __str__(self):
		self.buildBoard()
		s = '' 
		for row in self.board:
			s += str(row) + '\n'
		return s

	def buildBoard(self):
		for i in range(8):
			j = self.solution[i] - 1
			self.board[i][j] = 'X'

	def resolver(self):
		self.bt([], 0)
		if self.found:
			return self.solution
		
	
	def bt(self, a, k):
		if k == 8: #Tamaño del tablero: 8x8
			self.solution = a
			self.found = True
		else:
			for s in self.successors(a, k):
				self.bt(s, k+1)
				if self.found:
					return 
		return 
	
	def successors(self, a, k):
		#Para cada reina colocada, la nueva no esta en la misma fila(determinada por el k que avanza), columna ni diagonal
		possible = (lambda ak: all([ak - a[j] not in [k-j, 0, j-k] for j in range(k)])) 
		return [a + [s] for s in range(1, 9) if (possible(s))]

ocho = ochoReinas()
ocho.resolver()
print(ocho)