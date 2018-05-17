import numpy as np
import scipy
from PIL import Image, ImageDraw

class Blender:

    # - startImage: An m × n numpy array of type uint8 containing starting image of the morph sequence.
    # - startPoints: An x × 2 numpy array of type float64 containing the points of interest in the starting
    # image, where x is a number greater than 50.
    # - endImage: An m × n numpy array of type uint8 containing ending image of the morph sequence.
    # - endPoints: An x × 2 numpy array of type float64 containing the corresponding points of interest in
    # the ending image, where x is a number greater than 50.

    def __init__(self, startImage, startPoints, endImage, endPoints):
        # verify all are np arrays and raise TypeError
        if False in map( lambda x: isinstance(x,np.ndarray), (startImage, startPoints, endImage, endPoints) ):
            raise TypeError("Not a ndarray")

        # points of interest passed can be used to identify the triangles in both images using Delaunay triangulation
        self.startImage = startImage
        self.startPoints = startPoints
        self.endImage = endImage
        self.endPoints = endPoints
        self.triangles = scipy.spatial.Delaunay(startPoints)
        return


    def getBlendedImage(self, alpha):

        # set up starting and ending images
        startImg = np.zeros(self.startImage.shape)
        endImg = np.zeros(self.startImage.shape)

        # for every triangle pair:
        for triangle in self.triangles.simplices:
            #get points with index provided by simplices
            startTriangle = np.array( [self.startPoints[i] for i in triangle] ) 
            endTriangle = np.array( [self.endPoints[i] for i in triangle] )

            #  - Calculate the middle triangle that corresponds with the given α (target triangle)
            target = np.zeros( (3,2), dtype=np.float64 )
            v = 0
            for lvertex,rvertex in zip(startTriangle, endTriangle):
                x = (1-alpha)*lvertex[0] + alpha*rvertex[0]
                y = (1-alpha)*lvertex[1] + alpha*rvertex[1]
                target[i] = np.array([x,y])
                i+=1

            #  - Create instance of Affine class to transform the starting triangle into target triangle
            A_start = Affine(startTriangle, target)
            A_start.transform(self.startImage,startImg)
            #  - Repeat above step to transform the ending triangle into target triangle
            A_end = Affine(endImg, target)
            A_end.transform(self.endImage, endImg)

        # Once processing of all triangles is complete, perform a blending between the two target images, and
        blend = (1-alpha)*startImg + alpha*endImg
        # return the result.
        return blend
