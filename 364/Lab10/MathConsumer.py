# Import PySide classes
import sys
from PySide.QtCore import *
from PySide.QtGui import *
from calculator import *

class MathConsumer(QMainWindow, Ui_MainWindow):
    def __init__(self, parent=None):
        super(MathConsumer, self).__init__(parent)
        self.setupUi(self)
        self.btnCalculate.clicked.connect(self.performOperation)

    def performOperation(self):
        try:
            a = float(self.edtNumber1.text())
            b = float(self.edtNumber2.text())
            op = (self.cboOperation.currentText())
            e = eval("{} {} {}".format(a,op,b))
            self.edtResult.setText(str(e))
        except:
            self.edtResult.setText('E')
        return
            

if __name__ == "__main__":
    currentApp = QApplication(sys.argv)
    currentForm = MathConsumer() 
    currentForm.show()
    currentApp.exec_()
