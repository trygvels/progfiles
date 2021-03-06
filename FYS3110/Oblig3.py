from numpy import *
from numpy.linalg import *
from matplotlib.pyplot import *
g = 1
V = 4
N = 32
basis = []
for i in range(N):
	b = zeros(N)
	b[i] = 1
	b = matrix(b).T
	basis.append(b)


H = zeros((N,N))
for i in range(N-1):
	H = H -g*(basis[i]*basis[i+1].T+basis[i+1]*basis[i].T) #summing values 0 to N-1
H = H -g*(basis[-1]*basis[0].T+basis[0]*basis[-1].T) #Making sure i+1=N=0
H = H-V*(basis[0]*basis[0].T) #Adding potential 

#plot(range(N), sort(eigvals(H)))
#title('Eigenvalue diagram')
#ylabel('Value eigenvalue')
#show()

#print H
#print eigvals(H)
#print "The lowest eigenvalue is Lambda= %.3f" % min(eigvals(H))

eigenvalues, eigenvectors = eig(H)

#print abs(eigenvectors[0,0])**2
#print abs(eigenvectors[1,0])**2
X = diag(range(N+1))
print eigenvectors[0]*X*eigenvectors[0].T

