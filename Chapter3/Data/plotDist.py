import numpy as np
import matplotlib as mplt
import matplotlib.pyplot as pypl
import os

abspath = os.path.abspath(__file__)
dname = os.path.dirname(abspath)
os.chdir(dname)

mplt.rcParams['font.family']='serif'
mplt.rcParams['mathtext.fontset']='cm'


file='./vortexDist.dat'

data = np.loadtxt(file, skiprows=0)
length = len(data[:,0])

data = np.array([100*row/np.sum(row) for row in data])
dataFlat = data.flatten(order='F')

negOnes = [-1]*99
zeros = [0]*99
ones = [1]*99
X = [negOnes,zeros,ones]

avg = np.mean(data,axis=0)
X2 = [-1,0,1]

f = pypl.figure()
ax1 = f.add_subplot(111)

pypl.hlines(33.33, -1.5, 1.5, linestyles='dashed', zorder=1)
ax1.scatter(X,dataFlat,marker='.',c='#088da5',label='Individual Phases', zorder=2)
ax1.scatter(X2,avg,c='#cc0000',label='Average Phase', edgecolor='k', zorder=3)
xi = [-1,0,1]
def fmt(x,pos):
    if x>0:
        return u"$+1$".format(x)
    else:
        return "${:.0f}$".format(x)
    
formatter = mplt.ticker.FuncFormatter(fmt)
ax1.xaxis.set_major_formatter(formatter)

pypl.xticks(xi)
pypl.xlim(-1.2, 1.2)
pypl.xlabel('Vortex Phase')
pypl.ylabel('% of Total Vortices')
pypl.ylim(33.1,33.5)
ax1.legend()
pypl.savefig('./VortexDistribution.pdf',format='pdf',bbox_inches='tight')
