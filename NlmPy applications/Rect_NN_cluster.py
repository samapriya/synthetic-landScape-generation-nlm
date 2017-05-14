import numpy
import nlmpy
import numpy as np

np.random.seed()
nRow=50
nCol=50

# Random rectangular cluster NLM
RectCluster = nlmpy.randomRectangularCluster(nRow, nCol, 4, 8)
nlmpy.exportASCIIGrid("transp.asc", RectCluster)

# Random cluster nearest-neighbour NLM
NN_Cluster = nlmpy.randomClusterNN(nRow, nCol, 0.4)
nlmpy.exportASCIIGrid("transp_NN.asc", NN_Cluster)
