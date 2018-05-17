import numpy as np
from scipy.spatial import Delaunay
from scipy.interpolate import RectBivariateSpline
from PIL import Image, ImageDraw
import imageio

class Affine:

    # - source: A 3 × 2 numpy array of type float64 containing vertices of a single triangle from the source
    # image.
    # - destination: A 3 × 2 numpy array of type float64 containing vertices of the corresponding triangle
    # vertices in the target image.
    # - matrix: A 3 × 3 numpy array of type float64 holding the affine projection matrix.

    def __init__(self, source, destination):
        #check if float64 np array && Check dimensions
        for arr in (source, destination):
            if arr.dtype != np.float64 or arr.shape != (3,2):
                raise ValueError('numpy arrays not float64 or wrong size')

        self.source = source 
        self.destination = destination
        # Using the correspondences, you should be able to 
        # calculate the affine transformation and populate
        # the member variable matrix
        A_total,b_total = self.createAB(source[0],destination[0])
        for i in range(1,3):
            A,b = self.createAB(source[i], destination[i])
            A_total = np.vstack( [A_total,A] )
            b_total = np.append( b_total, b )
        h = np.linalg.solve(A_total,b_total)
        #print(h)
        self.matrix = np.array([ h[0:3],h[3:6],[0,0,1] ] , dtype=np.float64)  

    def transform(self, sourceImage, destinationImage):
        #  - Verify that both input arguments are numpy arrays, 
        if not isinstance(sourceImage,np.ndarray) or not isinstance(destinationImage,np.ndarray):
            raise TypeError('One or more images not np arrays')

        #  - affine transformation from the triangle in the source image to its corresponding triangle

        # 1st step: create mask
        length, width = destinationImage.shape
        img = Image.new('L', (width, length), 0)
        vertices = [ (x,y) for [x,y] in self.destination ]
        ImageDraw.Draw(img).polygon(vertices, outline=255, fill=255)
        mask = np.array(img)
        
        # 2nd step: create H inverse and get bivariate spline approximation
        H_inv = np.linalg.inv(self.matrix)
        x = np.arange(length)
        y = np.arange(width)
        approx = RectBivariateSpline(x,y,sourceImage,kx=1,ky=1)


        #get each point in mask whose value is greater than 0
        for yp,xp in np.transpose(np.nonzero(mask)):
            #H^-1 * [x' y' 1] = [x y 1]
            P = H_inv.dot([xp,yp,1])[0:2]
            
            #2d interpolation to obtain a value if x y are floats
            shade = np.round(approx.ev(P[1],P[0]))

            #assign that value to x' y'
            destinationImage[yp][xp] = shade


    def createAB(self, source, dest):
        A = np.array([ [source[0],source[1],1,0,0,0], [0,0,0,source[0],source[1],1] ], dtype=np.float64)
        b = np.array([ dest[0], dest[1] ], dtype=np.float64)
        return A,b






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
        self.triangles = Delaunay(startPoints)
        return


    def getBlendedImage(self, alpha):

        # set up starting and ending images
        startImg = np.zeros(self.startImage.shape)
        endImg = np.zeros(self.startImage.shape)

        # for every triangle pair:
        for triangle in self.triangles.simplices:
            #get points with index provided by simplices
            startTriangle = np.array([self.startPoints[i] for i in triangle], dtype=np.float64) 
            endTriangle = np.array([self.endPoints[i] for i in triangle], dtype=np.float64)

            #  - Calculate the middle triangle that corresponds with the given α (target triangle)
            target = np.zeros( (3,2), dtype=np.float64 )
            i = 0
            for lvertex,rvertex in zip(startTriangle, endTriangle):
                x = (1-alpha)*lvertex[0] + alpha*rvertex[0]
                y = (1-alpha)*lvertex[1] + alpha*rvertex[1]
                target[i] = np.array([x,y])
                i+=1

            #  - Create instance of Affine class to transform the starting triangle into target triangle
            A_start = Affine(startTriangle, target)
            A_start.transform(self.startImage,startImg)
            #  - Repeat above step to transform the ending triangle into target triangle
            A_end = Affine(endTriangle, target)
            A_end.transform(self.endImage, endImg)

        # Once processing of all triangles is complete, perform a blending between the two target images, and
        blend = (1-alpha)*startImg + alpha*endImg
        # return the result.
        return blend


def saveImage(arr,f):
    img = Image.fromarray(arr)
    img.convert('L').save(f,'jpeg')
    return img


if __name__ == '__main__':    
    wolf = np.array(imageio.imread('WolfGray.jpg'))
    wolf_points = np.loadtxt('wolf.jpg.txt')

    tiger = np.array(imageio.imread('Tiger2Gray.jpg'))
    tiger_points = np.loadtxt('tiger2.jpg.txt')

    b1 = Blender(wolf, wolf_points, tiger, tiger_points)
    A = b1.getBlendedImage(0.5)
    saveImage(A,'test.jpg')
