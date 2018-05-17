import unittest
import os
import shutil

from moduleTasks import checkNetwork, isOK, loadDataFrom, isBounded
from signals import loadMultiple, saveData

class TestPart1(unittest.TestCase):
    def testValid(self):
        self.assertTrue(checkNetwork())

    def testOSError(self):
        err = BlockingIOError('This is an OSError')
        val = checkNetwork(error=err)
        self.assertEqual(val, 'An issue encountered during runtime. The name of the error is: BlockingIOError')

        err = InterruptedError('This is OSError')
        val = checkNetwork(error=err)
        self.assertEqual(val, 'An issue encountered during runtime. The name of the error is: InterruptedError')

    def testConnectionError(self):
        err = ConnectionError('My error')
        with self.assertRaises(ConnectionError):
            val = checkNetwork(error=err)

    def testRandomError(self):
        err = ValueError('This is an error')
        self.assertFalse(checkNetwork(error=err))

class TestPart2(unittest.TestCase):
    '''isOk'''

    def testValidSignals(self):
        names = ['DAS-900', 'SWE-314', 'AAA-838', 'ZJS-300']
        for idx, name in enumerate(names):
            with self.subTest(i=idx):
                self.assertTrue(isOK(name))

    def testValidSignalsFromExamples(self):
        # All filenames in Signals dir must be valid
        names = [n.split('.')[0] for n in os.listdir('Signals')]
        for idx, name in enumerate(names):
            with self.subTest(i=idx):
                self.assertTrue(isOK(name))

    def testInvalidSignals(self):
        names = ['AD-810', 'aaa-832', 'AAA-38', 'nND-388', '999-AXJ']
        for idx, name in enumerate(names):
            with self.subTest(i=idx):
                self.assertFalse(isOK(name))

    '''loadDataFrom'''
    def testInvalidSignal(self):
        try:
            loadDataFrom('badsignalname', '')
            self.fail('ValueError not raised')
        except ValueError as err:
            self.assertEqual(str(err), 'badsignalname is invalid.')

    def testSignalNotInFolder(self):
        signal = 'XXX-269'
        try:
            loadDataFrom(signal, 'Signals')
            self.fail('OSError not raised')
        except OSError as err:
            self.assertTrue(signal in str(err))

    def testValidSignalData(self):
        # Create data file
        data = ['-5.803',
                '3.539',
                'x99ueb2',
                '4.903',
                '5.186',
                '-4.729',
                '8nqh7o0',
                '-4.761',
                '3.059',
                '3.617',
                '3jkj',
                'ksk33'
                ]
        signal = 'JFJ-832'

        path = 'Signals/{}.txt'.format(signal)
        with open(path, 'w') as f:
            f.write('\n'.join(data))

        floats, count_invalid = loadDataFrom(signal, 'Signals')
        self.assertEqual(floats, [-5.803, 3.539, 4.903, 5.186, -4.729, -4.761, 3.059, 3.617])
        self.assertEqual(count_invalid, 4)

        os.remove(path)

    def testValidSignalDataNoFloats(self):
        data = ['xx3kekj',
                'tiffany',
                'kusholIsAWhore',
                'fej3kjskjf',
                '3l2kjf'
                ]

        signal = 'IOP-382'

        path = 'Signals/{}.txt'.format(signal)
        with open(path, 'w') as f:
            f.write('\n'.join(data))

        floats, count_invalid = loadDataFrom(signal, 'Signals')
        self.assertEqual(floats, [])
        self.assertEqual(count_invalid, 5)

        os.remove(path)

    def testIsBoundedNoValues(self):
        try:
            val = isBounded([], (0, 1), 3)
            self.fail('ValueError not raised for no data')
        except ValueError as err:
            self.assertTrue(str(err), 'Signal contains no data.')

    def testIsBounded(self):
        values = [-4, -4, -3, -2, -1, 0, 1, 2, 3, 3.5]

        self.assertTrue(isBounded(values, (-3, 3), 4))
        self.assertTrue(isBounded(values, (3, -3), 4))
        self.assertTrue(isBounded(values, (-3, 3), 3))

        self.assertFalse(isBounded(values, (-3, 3), 2))
        self.assertFalse(isBounded(values, (-3, 3), 1))

        self.assertFalse(isBounded(values, (0, 0), 1))

class TestPart3(unittest.TestCase):
    def testLoadMultipleSignalDoesNotExist(self):
        badSignals = ['XXX-382', 'YYY-383', 'KDJ-382']
        data = loadMultiple(badSignals, 'Signals', 3)

        for i, signal in enumerate(badSignals):
            with self.subTest(i=i):
                self.assertEqual(data[signal], None)

    def testLoadMultipleSignalInvalidNames(self):
        badSignals = ['X-382', 'yyy-383', 'd-82']
        data = loadMultiple(badSignals, 'Signals', 3)

        for i, signal in enumerate(badSignals):
            with self.subTest(i=i):
                self.assertEqual(data[signal], None)

    def testLoadMultiple(self):
        # Write two signal files
        data = ['xx3kekj',
                '32.238',
                '-0.2348',
                'fej3kjskjf',
                '23.382'
                ]
        signal1 = 'NIC-111'
        path1 = 'Signals/{}.txt'.format(signal1)
        with open(path1, 'w') as f:
            f.write('\n'.join(data))

        data = ['xx3kekj',
                'tiffany',
                'kusholIsAWhore',
                'fej3kjskjf',
                '3l2kjf',
                ]
        signal2 = 'TIF-111'
        path2 = 'Signals/{}.txt'.format(signal2)
        with open(path2, 'w') as f:
            f.write('\n'.join(data))

        floats1 = loadDataFrom(signal1, 'Signals')[0]
        floats2 = loadDataFrom(signal2, 'Signals')[0]

        # Both accepted
        signals = loadMultiple([signal1, signal2], 'Signals', 5)
        self.assertEqual(signals[signal1], floats1)
        self.assertEqual(signals[signal2], floats2)

        # Both rejected
        signals = loadMultiple([signal1, signal2], 'Signals', 1)
        self.assertEqual(signals[signal1], [])
        self.assertEqual(signals[signal2], [])

        # Only one accepted
        signals = loadMultiple([signal1, signal2], 'Signals', 2)
        self.assertEqual(signals[signal1], floats1)
        self.assertEqual(signals[signal2], [])

        os.remove(path1)
        os.remove(path2)

    def testSaveData(self):
        signals = {'FKE-382': ['-1.3', '-0.99', '-0.5', '0.323', '0.932', '1.32'], # All valid
                   'JES-103': ['-1.3', '-2.99', '-0.5', '0.323', '1.932', '2.32'], # 2 invalid
                   'KEJ-893': ['-7.3', '-6.99', '-5.5', '8.323', '7.932', '5.32']} # All invalid

        signals = {key: [float(i) for i in val] for key, val in signals.items()}

        if not os.path.exists('SignalOut'):
            os.mkdir('SignalOut')

        saveData(signals, 'SignalOut', (2, -2), 2)

        with open('SignalOut/FKE-382.txt', 'r') as f:
            lines = f.readlines()
        self.assertEqual([float(i) for i in lines], signals['FKE-382'])

        with open('SignalOut/JES-103.txt', 'r') as f:
            lines = f.readlines()
        self.assertEqual([float(i) for i in lines], signals['JES-103'])

        self.assertFalse(os.path.exists('SignalOut/KEJ-893.txt'))

        # Clean up
        shutil.rmtree('SignalOut')

if __name__ == '__main__':
    unittest.main()
