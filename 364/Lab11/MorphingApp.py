# Import PySide classes
import sys
from PySide.QtCore import *
from PySide.QtGui import *

from Morphing import *
from MorphingGUI import *

from os.path import isfile
import numpy as np
import imageio

class MorphingApp(QMainWindow, Ui_MainWindow):

    def __init__(self, parent=None):
        super(MorphingApp, self).__init__(parent)
        self.setupUi(self)

        #VARIABLES
        self.imgLoaded1 = False
        self.imgLoaded2 = False
        self.alpha = 0.0
        self.img1 = None
        self.img1_points = None
        self.img2 = None
        self.img2_points = None
        self.hasPoints1 = False
        self.hasPoints2 = False
        self.greenCount = 0
        self.img1File = None
        self.img2File = None
        self.g1 = None
        self.g2 = None
        self.canClick1= True
        self.canClick2 = True
        self.noRed1 = True
        self.noRed1 = True

        #INITIAL STATE
        self.imgBtn1.setEnabled(True)
        self.imgBtn2.setEnabled(True)
        #self.alphaValue.setText('0.0')
        self.alphaValue.setReadOnly(True)
        self.disableWidgets()
        
        #BUTTON UPDATES
        self.imgBtn1.clicked.connect(self.loadImg1)
        self.imgBtn2.clicked.connect(self.loadImg2)
        self.alpha_slider.valueChanged.connect(self.update)
        self.blendBtn.clicked.connect(self.blendImages)
        self.checkBox.stateChanged.connect(self.drawTriangles)

        #INITIAL SCENE CREATIONS
        self.scene1 = QGraphicsScene()
        self.scene2 = QGraphicsScene()
        self.imgView1.mousePressEvent = self.drawGreen1
        self.imgView2.mousePressEvent = self.drawGreen2

    def loadImg1(self, filename = None):
        if filename is None:
            imgPath,lol = QFileDialog.getOpenFileName(self)
        #print(type(imgPath))
        img = QPixmap(imgPath)
        self.scene1.addPixmap(img)
        self.imgLoaded1 = True
        self.img1 = np.array(imageio.imread(imgPath))
        s = imgPath + '.txt'
        self.img1File = s
        if isfile(s):
            self.img1_points = np.loadtxt(s)
            self.drawRed1()
        else:
            open(s,'w')
        self.update()

    def loadImg2(self, filename = None):
        if filename is None:
            imgPath,lol = QFileDialog.getOpenFileName(self)
        img = QPixmap(imgPath)
        self.scene2.addPixmap(img)
        self.imgLoaded2 = True
        self.img2 = np.array(imageio.imread(imgPath))
        s = imgPath + '.txt'
        self.img2File = s
        if isfile(s):
            self.img2_points = np.loadtxt(s)
            self.drawRed2()
        else:
            open(s,'w')
        self.update()

    def update(self):
        #Enable & disable widgets
        if self.imgLoaded1 and self.imgLoaded2:
            self.enableWidgets()
        else:
            self.disableWidgets()

        #alpha value
        self.alpha = self.alpha_slider.value() / 10
        self.alphaValue.setText('{:.2f}'.format(self.alpha))

        #update scene
        if self.imgLoaded1:
            self.imgView1.setScene(self.scene1)
            self.imgView1.fitInView(QRectF(0,0,len(self.img1[0]),len(self.img1)),Qt.KeepAspectRatio)
            self.imgView1.show()
            self.img1_points = np.loadtxt(self.img1File)
        if self.imgLoaded2:
            self.imgView2.setScene(self.scene2)
            self.imgView2.fitInView(QRectF(0,0,len(self.img2[0]),len(self.img2)),Qt.KeepAspectRatio)
            self.imgView2.show()
            self.img2_points = np.loadtxt(self.img2File)


    def blendImages(self):
        B = Blender(self.img1,self.img1_points,self.img2,self.img2_points)
        blendNP = B.getBlendedImage(self.alpha)
        saveImage(blendNP,'testApp.jpg')
        ###
        img = QPixmap('testApp.jpg')
        img = img.scaled(self.imgView2.width(),self.imgView2.height()-2,Qt.KeepAspectRatio)
        scene = QGraphicsScene()
        scene.addPixmap(img)
        self.blendView.setScene(scene)
        self.blendView.show()     
        

    def disableWidgets(self):
        self.checkBox.setDisabled(True)
        self.alpha_slider.setDisabled(True)
        self.alphaValue.setDisabled(True)
        self.blendBtn.setDisabled(True)

    def enableWidgets(self):
        self.checkBox.setEnabled(True)
        self.alpha_slider.setEnabled(True)
        self.alphaValue.setEnabled(True)
        self.blendBtn.setEnabled(True)

#POINTS DRAWING AND TRIANGLES
    def drawRed1(self):
        self.img1_points = np.loadtxt(self.img1File)
        for point in self.img1_points:
            self.scene1.addEllipse(point[0],point[1],5,5,QPen(Qt.red),QBrush(Qt.red))

    def drawRed2(self):
        self.img2_points = np.loadtxt(self.img2File)
        for point in self.img2_points:
            self.scene2.addEllipse(point[0],point[1],5,5,QPen(Qt.red),QBrush(Qt.red))

    def drawTriangles(self):
        self.img2_points = np.loadtxt(self.img2File)
        self.img1_points = np.loadtxt(self.img1File)
        if self.checkBox.isChecked():
            #Draw Triangles
            triangles = Delaunay(self.img1_points)
            indexes = triangles.simplices
            for i in indexes:
                v1,v2,v3 = self.img1_points[i[0]],self.img1_points[i[1]],self.img1_points[i[2]]
                self.scene1.addLine(v1[0],v1[1],v2[0],v2[1],QPen(Qt.red))
                self.scene1.addLine(v2[0],v2[1],v3[0],v3[1],QPen(Qt.red))
                self.scene1.addLine(v3[0],v3[1],v1[0],v1[1],QPen(Qt.red))
                v1,v2,v3 = self.img2_points[i[0]],self.img2_points[i[1]],self.img2_points[i[2]]
                self.scene2.addLine(v1[0],v1[1],v2[0],v2[1],QPen(Qt.red))
                self.scene2.addLine(v2[0],v2[1],v3[0],v3[1],QPen(Qt.red))
                self.scene2.addLine(v3[0],v3[1],v1[0],v1[1],QPen(Qt.red))      
        else:
            #Delete Triangles
            for item in self.scene1.items():
                if type(item) == QGraphicsLineItem:
                    self.scene1.removeItem(item)
            for item in self.scene2.items():
                if type(item) == QGraphicsLineItem:
                    self.scene2.removeItem(item)
            return

    def drawGreen1(self, event):
        if self.imgLoaded1 and self.imgLoaded2 and self.canClick1: 
            pos = event.pos()
            rw = len(self.img1[0])/self.imgView1.width()
            rh = len(self.img1)/self.imgView1.height()
            if self.greenCount == 1: #draw green and now 2 dots
                self.greenCount = 2
                self.scene1.addEllipse(pos.x()*rw,pos.y()*rh,5,5,QPen(Qt.yellow),QBrush(Qt.yellow))
                with open(self.img1File,'a+') as myFile:
                    myFile.write('   '+str(pos.x()*rw)+'   '+str(pos.y()*rh)+'\n')
                self.g1 = [pos.x()*rw, pos.y()*rh]
                self.canClick1 = True
                self.canClick2 = True

            elif self.greenCount == 0: #draw green and now 1 dot
                self.greenCount = 1
                self.scene1.addEllipse(pos.x()*rw,pos.y()*rh,5,5,QPen(Qt.yellow),QBrush(Qt.yellow))
                with open(self.img1File,'a+') as myFile:
                    myFile.write('   '+str(pos.x()*rw)+'   '+str(pos.y()*rh)+'\n')
                self.g1 = [pos.x()*rw, pos.y()*rh]
                self.canClick1 = False
                self.canClick2 = True

            elif self.greenCount == 2: #draw blue dots now 0 dots
                self.greenCount = 0
                self.scene1.addEllipse(self.g1[0],self.g1[1],5,5,QPen(Qt.blue),QBrush(Qt.blue))
                self.scene2.addEllipse(self.g2[0],self.g2[1],5,5,QPen(Qt.blue),QBrush(Qt.blue))
                self.canClick1 = True
                self.canClick2 = True

    def drawGreen2(self, event):
        if self.imgLoaded1 and self.imgLoaded2 and self.canClick2:
            pos = event.pos()
            rw = len(self.img2[0])/self.imgView2.width()
            rh = len(self.img2)/self.imgView2.height()
            if self.greenCount == 1: #draw green and now 2 dots
                self.greenCount = 2
                self.scene2.addEllipse(pos.x()*rw,pos.y()*rh,5,5,QPen(Qt.yellow),QBrush(Qt.yellow))
                with open(self.img2File,'a+') as myFile:
                    myFile.write('   '+str(pos.x()*rw)+'   '+str(pos.y()*rh)+'\n')
                self.g2 = [pos.x()*rw, pos.y()*rh]
                self.canClick1 = True
                self.canClick2 = True

            elif self.greenCount == 0: #draw green and now 1 dot
                self.greenCount = 1
                self.scene2.addEllipse(pos.x()*rw,pos.y()*rh,5,5,QPen(Qt.yellow),QBrush(Qt.yellow))
                with open(self.img2File,'a+') as myFile:
                    myFile.write('   '+str(pos.x()*rw)+'   '+str(pos.y()*rh)+'\n')
                self.g2 = [pos.x()*rw, pos.y()*rh]
                self.canClick1 = True
                self.canClick2 = False

            elif self.greenCount == 2: #draw blue dots now 0 dots
                self.greenCount = 0
                self.scene1.addEllipse(self.g1[0],self.g1[1],5,5,QPen(Qt.blue),QBrush(Qt.blue))
                self.scene2.addEllipse(self.g2[0],self.g2[1],5,5,QPen(Qt.blue),QBrush(Qt.blue))
                self.canClick1 = True
                self.canClick2 = True
        



if __name__ == "__main__":
    currentApp = QApplication(sys.argv)
    currentForm = MorphingApp()
    
    currentForm.show()
    currentApp.exec_()

