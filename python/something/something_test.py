import unittest

from something import aFunction

class SomethingTest(unittest.TestCase):
    def test_something_about_the_function(self):
        self.assertEqual(aFunction(1), "1")

if __name__ == "__main__":
    unittest.main()
