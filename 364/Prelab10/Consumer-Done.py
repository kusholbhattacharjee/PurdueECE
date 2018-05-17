import sys
from PySide.QtGui import *
from BasicUI import *
import PySide
import re


class Consumer(QMainWindow, Ui_MainWindow):

    def __init__(self, parent=None):

        super(Consumer, self).__init__(parent)
        self.setupUi(self)
        self.clear() #Initially cleared

        self.btnClear.clicked.connect(self.clear) #clear btn activated
        self.btnSave.clicked.connect(self.saveData) #save data
        self.btnLoad.clicked.connect(self.loadData) #load data
        
        #ANY CHANGES
        self.txtStudentName.textChanged.connect(self.dataChanged)
        self.txtStudentID.textChanged.connect(self.dataChanged)
        for i in range(1,21):
            getattr(self,'txtComponentCount_{}'.format(i)).textChanged.connect(self.dataChanged)
            getattr(self,'txtComponentName_{}'.format(i)).textChanged.connect(self.dataChanged)
        self.chkGraduate.stateChanged.connect(self.dataChanged)
        self.cboCollege.currentIndexChanged.connect(self.dataChanged)
        return

    def clear(self):
        self.txtStudentName.setText('')
        self.txtStudentID.setText('')
        for i in range(1,21):
            getattr(self,'txtComponentCount_{}'.format(i)).setText('')
            getattr(self,'txtComponentName_{}'.format(i)).setText('')
        self.chkGraduate.setCheckState(QtCore.Qt.CheckState.Unchecked)
        self.cboCollege.setCurrentIndex(0)
        self.btnLoad.setEnabled(True)
        self.btnSave.setEnabled(False)
        return

    def dataChanged(self):
        self.btnSave.setEnabled(True)
        self.btnLoad.setEnabled(False)
        return


    def loadDataFromFile(self, filePath):
        with open(filePath,'r') as myFile:
            lines = myFile.read()
        p = re.compile(r'<StudentName graduate="(true|false)">(.*?)</StudentName>')
        m = p.search(lines)
        if m:
            self.txtStudentName.setText(m.group(2))
            isGrad = QtCore.Qt.CheckState.Checked if m.group(1) == 'true' else QtCore.Qt.CheckState.Unchecked
            self.chkGraduate.setCheckState(isGrad)
        p = re.compile(r'<StudentID>(.*?)</StudentID>')
        m = p.search(lines)
        if m:
            self.txtStudentName.setText(m.group(1))
        p = re.compile(r'<College>(.*?)</College>')
        m = p.search(lines)
        if m:
            self.cboCollege.setCurrentIndex(self.cboCollege.findText(m.group(1)))
        p = re.compile(r'<Component name="(.*?)" count="(.*?)" />')
        for i, (name,count) in enumerate(p.findall(lines)):
            if i >= 20:
                break
            getattr(self, 'txtComponentName_{}'.format(i+1)).setText(name)
            getattr(self, 'txtComponentCount_{}'.format(i+1)).setText(count)
        return
        

    def loadData(self):
        """
        Obtain a file name from a file dialog, and pass it on to the loading method. This is to facilitate automated
        testing. Invoke this method when clicking on the 'load' button.

        *** DO NOT MODIFY THIS METHOD! ***
        """
        filePath, _ = QFileDialog.getOpenFileName(self, caption='Open XML file ...', filter="XML files (*.xml)")

        if not filePath:
            return

        self.loadDataFromFile(filePath)

    def saveData(self):
        with open('target.xml','w') as myFile:
            myFile.write('<?xml version="1.0" encoding="UTF-8"?>\n')
            myFile.write('<Content>\n')

            isGrad = 'true' if self.chkGraduate.isChecked() else 'false'
            myFile.write('\t<StudentName gradute="{}">{}</StudentName>\n'.format(isGrad,self.txtStudentName.text()))
            
            if self.txtStudentID.text():
                myFile.write('\t<StudentID>{}</StudentID>\n'.format(self.txtStudentID.text()))
            myFile.write('\t<College>{}</College>\n'.format(self.cboCollege.currentText()))

            components = self.getComponents()
            if len(components) > 0:
                myFile.write('\t<Components>\n')
                for name, count in components.items():
                    myFile.write('\t\t<Component name="{}" count="{}" />\n'.format(name,count))
                myFile.write('\t</Components>\n')
            myFile.write('</Content>')
        return

    def getComponents(self):
        components = {}
        for i in range(1,21):
            name = getattr(self,'txtComponentName_{}'.format(i)).text()
            count = getattr(self,'txtComponentCount_{}'.format(i)).text()

            if name or count:
                components[name] = count
        return components


if __name__ == "__main__":
    currentApp = QApplication(sys.argv)
    currentForm = Consumer()

    currentForm.show()
    currentApp.exec_()
