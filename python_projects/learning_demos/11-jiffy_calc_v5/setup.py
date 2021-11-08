from setuptools import setup

setup(
   name='11-jiffy_calc_v5',
   version='5.0.0',
   author='ctalaveraw',
   author_email='ctalaveraw@gmail.com',
   packages=['jiffy_calc'], # this is the codebase
   scripts=['jiffy_calc_v5'], # this is the shell script created to run while installing
   url='http://github.com/ctalaveraw',
   license='LICENSE.md',
   description='A simple "jiffy to unit" time conversion calculator',
   long_description=open('README.md').read(),
)
