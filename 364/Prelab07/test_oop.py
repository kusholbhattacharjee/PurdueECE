import unittest
from oopTasks import *
import uuid


class TestStudent(unittest.TestCase):
    def testString(self):
        s = Student('12345-54321', 'Nicky', 'Marino', Level.junior)
        self.assertEqual(str(s), '12345-54321, Nicky Marino, Junior')

        s = Student('01234-56789', 'Tiffany', 'Chen', Level.sophomore)
        self.assertEqual(str(s), '01234-56789, Tiffany Chen, Sophomore')

    def testInvalidLevels(self):
        with self.assertRaises(TypeError):
            Student('12345-12345', 'Nicky', 'Marino', '')

        with self.assertRaises(TypeError):
            Student('12345-12345', 'Nicky', 'Marino', 'sophomore')


class TestCircuit(unittest.TestCase):
    def testBadLists(self):
        # Valid comp lists
        r = ['R206.298', 'R46.34']
        c = ['C13.43', 'C383.238']
        l = ['L49.34', 'L105.382']
        t = ['T343.234', 'T28.348']

        # Check resistor comps
        with self.assertRaises(ValueError):
            Circuit('12345', 'R', c, l, t)
            Circuit('12345', 'R49.34', c, l, t)
            Circuit('12345', [49.23, 43.34], c, l, t)
            Circuit('12345', t, c, l, t)

        # Check capacitor comps
        with self.assertRaises(ValueError):
            Circuit('12345', r, 'C', l, t)
            Circuit('12345', r, 'C322.34', l, t)
            Circuit('12345', r, [23.43, 234.23], l, t)
            Circuit('12345', r, t, l, t)

        # Check inductor comps
        with self.assertRaises(ValueError):
            Circuit('12345', r, c, 'L', t)
            Circuit('12345', r, c, 'L322.34', t)
            Circuit('12345', r, c, [23.43, 234.23], t)
            Circuit('12345', r, c, t, t)

        # Check transistor comps
        with self.assertRaises(ValueError):
            Circuit('12345', r, c, l, 'T')
            Circuit('12345', r, c, l, 'T322.34')
            Circuit('12345', r, c, l, [23.43, 234.23])
            Circuit('12345', r, c, l, l)

    def testStringRep(self):
        r = ['R206.298', 'R46.34']
        c = ['C383.238']
        l = ['L49.34', 'L105.382', 'L38.430']
        t = []

        c = Circuit('01234', r, c, l, t)
        self.assertEqual(str(c), '01234: (R = 02, C = 01, L = 03, T = 00)')

    def testGetDetails(self):
        # Test sorting
        r = ['R12.34']
        c = []
        l = ['L34.57', 'L34.56']
        t = ['T39.53', 'T21.11', 'T11.11']

        c = Circuit('00001', r, c, l, t)
        self.assertEqual(c.getDetails(), '00001: R12.34, L34.56, L34.57, T11.11, T21.11, T39.53')

        # Test empty lists don't mess with commas
        r = []
        c = ['C34.57', 'C34.56']
        l = []
        t = []

        c = Circuit('99999', r, c, l, t)
        self.assertEqual(c.getDetails(), '99999: C34.56, C34.57')

    def testIn(self):
        r = ['R206.298', 'R46.34']
        c = ['C383.238']
        l = ['L49.34', 'L105.382', 'L38.430']
        t = ['T200.30']

        cir = Circuit('12345', r, c, l, t)

        # Check bad inputs
        with self.assertRaises(TypeError):
            200.30 in cir
        with self.assertRaises(ValueError):
            'X200.30' in cir

        self.assertTrue('R206.298' in cir)
        self.assertTrue('C383.238' in cir)
        self.assertTrue('L49.34' in cir)
        self.assertTrue('T200.30' in cir)

        self.assertFalse('R199.00' in cir)
        self.assertFalse('C383.00' in cir)
        self.assertFalse('L99.99' in cir)
        self.assertFalse('T00.00' in cir)

    def testPlusComponent(self):
        cir = Circuit('12345', [], [], [], [])

        cir2 = cir + 'R303.033'
        self.assertTrue('R303.033' in cir2.resistors)
        self.assertTrue('R303.033' in cir.resistors)

        cir3 = cir + 'C404.00'
        self.assertTrue('C404.00' in cir.capacitors)
        self.assertTrue('C404.00' in cir3.capacitors)

        cir4 = cir + 'L50.50'
        self.assertTrue('L50.50' in cir.inductors)
        self.assertTrue('L50.50' in cir4.inductors)

        cir5 = cir + 'T69.269'
        self.assertTrue('T69.269' in cir.transistors)
        self.assertTrue('T69.269' in cir5.transistors)

    def testPlusComponentInvalid(self):
        cir = Circuit('12345', [], [], [], [])
        with self.assertRaises(TypeError):
            cir + 45.05
        with self.assertRaises(ValueError):
            cir + 'X45.15'

    def testSub(self):
        r = 'R10.10'
        c = 'C22.22'
        l = 'L269.269'
        t = 'T23.34'

        cir = Circuit('12345', [r], [c], [l], [t])

        cir2 = cir - r
        self.assertTrue(r not in cir.resistors)
        cir2 = cir - r
        self.assertTrue(r not in cir2.resistors)

        cir3 = cir - c
        self.assertTrue(c not in cir.capacitors)
        self.assertTrue(c not in cir3.capacitors)

        cir4 = cir - l
        self.assertTrue(l not in cir.inductors)
        self.assertTrue(l not in cir4.inductors)

        cir5 = cir - t
        self.assertTrue(t not in cir.transistors)
        self.assertTrue(t not in cir5.transistors)

    def testSubInvalid(self):
        cir = Circuit('12435', ['R100.00'], [], [], [])
        with self.assertRaises(TypeError):
            cir - 15.51
        with self.assertRaises(ValueError):
            cir - 'X100.00'

    def testPlusCircuit(self):
        cir1 = Circuit('11111', ['R1.0'], ['C1.0'], ['L1.0'], ['T1.0'])
        cir2 = Circuit('22222', ['R2.0'], ['C2.0'], ['L2.0'], ['T2.0'])

        cir3 = cir1 + cir2

        self.assertTrue(cir3.ID not in [cir1.ID, cir2.ID])

        self.assertTrue('R1.0' in cir3.resistors)
        self.assertTrue('R2.0' in cir3.resistors)

        self.assertTrue('C1.0' in cir3.capacitors)
        self.assertTrue('C2.0' in cir3.capacitors)

        self.assertTrue('L1.0' in cir3.inductors)
        self.assertTrue('L2.0' in cir3.inductors)

        self.assertTrue('T1.0' in cir3.transistors)
        self.assertTrue('T2.0' in cir3.transistors)


class TestProject(unittest.TestCase):
    def testInvalidInputs(self):
        s = Student('11111', 'Nicky', 'Marino', Level.junior)
        c = Circuit('10101', [], [], [], [])

        # Empty participants
        with self.assertRaises(ValueError):
            p = Project(uuid.uuid4(), [], [c])

        # Invalid participants
        with self.assertRaises(ValueError):
            p = Project(uuid.uuid4(), ['11111'], [c])

        # Empty circuits
        with self.assertRaises(ValueError):
            p = Project(uuid.uuid4(), [s], [])

        # Invalid circuits
        with self.assertRaises(ValueError):
            p = Project(uuid.uuid4(), [s], ['10101'])

    def testStringRep(self):
        ID = uuid.uuid4()
        p = Project(ID,
                    [Student('11111', 'Nicky', 'Marino', Level.junior),
                     Student('10101', 'Tiffa', 'Chennn', Level.sophomore),
                     Student('10011', 'Kusho', 'Whatev', Level.senior)],
                    [Circuit('22222', ['R1.10'], ['C2.20'], [], [])]
                    )
        self.assertEqual(str(p), '{}: 01 Circuits, 03 Participants'.format(ID))

    def testGetDetails(self):
        ID = uuid.uuid4()
        p = Project(ID,
                    [Student('11111', 'Nicky', 'Marino', Level.junior),
                     Student('10101', 'Tiffa', 'Chennn', Level.sophomore),
                     Student('10011', 'Kusho', 'Whatev', Level.senior)],
                    [Circuit('22222', ['R1.10'], ['C2.20'], [], []),
                     Circuit('21212', [], ['C1.00'], [], ['T1.23'])])

        id_line = '{}\n\n'.format(ID)
        expected = id_line + \
                   'Participants:\n' + \
                   '10011, Kusho Whatev, Senior\n' + \
                   '10101, Tiffa Chennn, Sophomore\n' + \
                   '11111, Nicky Marino, Junior\n' + \
                   '\n' + \
                   'Circuits:\n' + \
                   '21212: C1.00, T1.23\n' + \
                   '22222: R1.10, C2.20'

        self.assertEqual(p.getDetails(), expected)

    def testInInvalid(self):
        p = Project(uuid.uuid4(),
                    [Student('11111', 'Nicky', 'Marino', Level.junior),
                     Student('10101', 'Tiffa', 'Chennn', Level.sophomore),
                     Student('10011', 'Kusho', 'Whatev', Level.senior)],
                    [Circuit('22222', ['R1.10'], ['C2.20'], [], []),
                     Circuit('21212', [], ['C1.00'], [], ['T1.23'])])

        with self.assertRaises(TypeError):
            1413.348 in p
        with self.assertRaises(ValueError):
            'X23.33' in p

    def testCompIn(self):
        p = Project(uuid.uuid4(),
                    [Student('11111', 'Nicky', 'Marino', Level.junior),
                     Student('10101', 'Tiffa', 'Chennn', Level.sophomore),
                     Student('10011', 'Kusho', 'Whatev', Level.senior)],
                    [Circuit('22222', ['R1.10'], ['C2.20'], [], []),
                     Circuit('21212', [], ['C1.00'], [], ['T1.23'])])

        self.assertTrue('R1.10' in p)
        self.assertTrue('C2.20' in p)
        self.assertTrue('C1.00' in p)
        self.assertTrue('T1.23' in p)

        self.assertFalse('T99.99' in p)
        self.assertFalse('C99.99' in p)

    def testCircuitIn(self):
        s1 = Student('11111', 'Nicky', 'Marino', Level.junior)
        s2 = Student('10101', 'Tiffa', 'Chennn', Level.sophomore)
        s3 = Student('10011', 'Kusho', 'Whatev', Level.senior)
        s4 = Student('22222', 'Nicky', 'Marino', Level.junior)

        c1 = Circuit('22222', ['R1.10'], ['C2.20'], [], [])
        c2 = Circuit('21212', [], ['C1.00'], [], ['T1.23'])
        c3 = Circuit('21212', [], ['C1.00'], ['L23.23'], ['T1.23'])

        p = Project(uuid.uuid4(), [s1, s2, s3], [c1, c2])

        self.assertTrue(s1 in p)
        self.assertTrue(s2 in p)
        self.assertTrue(s3 in p)
        self.assertFalse(s4 in p)

    def testStudentIn(self):
        s1 = Student('11111', 'Nicky', 'Marino', Level.junior)
        s2 = Student('10101', 'Tiffa', 'Chennn', Level.sophomore)
        s3 = Student('10011', 'Kusho', 'Whatev', Level.senior)
        s4 = Student('22222', 'Nicky', 'Marino', Level.junior)

        c1 = Circuit('22222', ['R1.10'], ['C2.20'], [], [])
        c2 = Circuit('21212', [], ['C1.00'], [], ['T1.23'])
        c3 = Circuit('34343', [], ['C1.00'], ['L23.23'], ['T1.23'])

        p = Project(uuid.uuid4(), [s1, s2, s3], [c1, c2])

        self.assertTrue(c1 in p)
        self.assertTrue(c2 in p)
        self.assertFalse(c3 in p)

    def testInvalidAdd(self):
        s1 = Student('11111', 'Nicky', 'Marino', Level.junior)
        c1 = Circuit('22222', ['R1.10'], ['C2.20'], [], [])
        p = Project(uuid.uuid4(), [s1], [c1])

        with self.assertRaises(TypeError):
            p + '2383'
        with self.assertRaises(TypeError):
            p + 3828

    def testAddCircuit(self):
        s1 = Student('11111', 'Nicky', 'Marino', Level.junior)
        c1 = Circuit('22222', ['R1.10'], ['C2.20'], [], [])
        c2 = Circuit('21212', [], ['C1.00'], [], ['T1.23'])
        p = Project(uuid.uuid4(), [s1], [c1])

        # Basic add
        self.assertTrue(c2 not in p.circuits)
        p += c2
        self.assertTrue(c2 in p.circuits)

        # Add again to make sure length doesn't change
        self.assertEqual(len(p.circuits), 2)
        p += c2
        self.assertEqual(len(p.circuits), 2)

    def testAddStudent(self):
        s1 = Student('11111', 'Nicky', 'Marino', Level.junior)
        s2 = Student('10101', 'Tiffa', 'Chennn', Level.sophomore)
        c1 = Circuit('22222', ['R1.10'], ['C2.20'], [], [])
        p = Project(uuid.uuid4(), [s1], [c1])

        # Basic add
        self.assertTrue(s2 not in p.participants)
        p += s2
        self.assertTrue(s2 in p.participants)

        # Add again to make sure length doesn't change
        self.assertEqual(len(p.participants), 2)
        p += s2
        self.assertEqual(len(p.participants), 2)

    def testInvalidSub(self):
        s1 = Student('11111', 'Nicky', 'Marino', Level.junior)
        c1 = Circuit('22222', ['R1.10'], ['C2.20'], [], [])
        p = Project(uuid.uuid4(), [s1], [c1])

        with self.assertRaises(TypeError):
            p - '2383'
        with self.assertRaises(TypeError):
            p - 3828

    def testSubCircuit(self):
        s1 = Student('11111', 'Nicky', 'Marino', Level.junior)
        c1 = Circuit('22222', ['R1.10'], ['C2.20'], [], [])
        c2 = Circuit('21212', [], ['C1.00'], [], ['T1.23'])
        p = Project(uuid.uuid4(), [s1], [c1, c2])

        # Basic sub
        self.assertTrue(c2 in p.circuits)
        p -= c2
        self.assertTrue(c2 not in p.circuits)

        # Sub again to make sure length doesn't change
        self.assertEqual(len(p.circuits), 1)
        p -= c2
        self.assertEqual(len(p.circuits), 1)

    def testSubStudent(self):
        s1 = Student('11111', 'Nicky', 'Marino', Level.junior)
        s2 = Student('10101', 'Tiffa', 'Chennn', Level.sophomore)
        c1 = Circuit('22222', ['R1.10'], ['C2.20'], [], [])
        p = Project(uuid.uuid4(), [s1, s2], [c1])

        # Basic sub
        self.assertTrue(s2 in p.participants)
        p -= s2
        self.assertTrue(s2 not in p.participants)

        # Sub again to make sure length doesn't change
        self.assertEqual(len(p.participants), 1)
        p -= s2
        self.assertEqual(len(p.participants), 1)


class TestCapstone(unittest.TestCase):
    def testInvalid(self):
        s1 = Student('11111', 'Nicky', 'Marino', Level.senior)
        s2 = Student('10101', 'Tiffa', 'Chennn', Level.sophomore)
        c1 = Circuit('22222', ['R1.10'], ['C2.20'], [], [])

        with self.assertRaises(ValueError):
            p = Capstone(uuid.uuid4(), [s1, s2], [c1])

    def testValid(self):
        s1 = Student('11111', 'Nicky', 'Marino', Level.senior)
        s2 = Student('10101', 'Tiffa', 'Chennn', Level.senior)
        c1 = Circuit('22222', ['R1.10'], ['C2.20'], [], [])

        ID = uuid.uuid4()
        cap = Capstone(ID, [s1, s2], [c1])
        proj = Project(ID, [s1, s2], [c1])

        self.assertEqual(cap.getDetails(), proj.getDetails())

    def testAddInvalid(self):
        s1 = Student('11111', 'Nicky', 'Marino', Level.senior)
        s2 = Student('10101', 'Tiffa', 'Chennn', Level.sophomore)
        c1 = Circuit('22222', ['R1.10'], ['C2.20'], [], [])

        cap = Capstone(uuid.uuid4(), [s1], [c1])

        with self.assertRaises(ValueError):
            cap += s2

    def testValid(self):
        s1 = Student('11111', 'Nicky', 'Marino', Level.senior)
        s2 = Student('10101', 'Tiffa', 'Chennn', Level.senior)
        c1 = Circuit('22222', ['R1.10'], ['C2.20'], [], [])
        cap = Capstone(uuid.uuid4(), [s1], [c1])

        self.assertTrue(s2 not in cap.participants)
        cap += s2 # If you fail this you didn't return the value
        self.assertTrue(s2 in cap.participants)




if __name__ == '__main__':
    unittest.main()
