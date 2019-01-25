python3-gdcm wrapper

This wrapper is not offical library from gdcm. I built the wrapper for python3.6 as the official python-gdcm works/worked only for python2.7

Working example for python3.6 and Ubuntu18.04

# LOCAL BUILD/INSTALL INSTRUCTION

`apt-get update`

`apt install -y python-vtk6 libvtk6-dev cmake-curses-gui checkinstall swig libpython3.6-dev`

`mkdir gdcm && cd gdcm && git clone --branch release git://git.code.sf.net/p/gdcm/gdcm`

`mkdir build && cd build`

`cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_FLAGS=-fPIC -DCMAKE_CXX_FLAGS=-fPIC -DGDCM_BUILD_SHARED_LIBS:BOOL=ON -DGDCM_WRAP_PYTHON=ON PYTHON_EXECUTABLE=/usr/local/bin/python3.6 PYTHON_INCLUDE_DIR=/usr/local/lib/python3.6/site-packages/ GDCM_BUILD_SHARED_LIBS=ON GDCM_USE_VTK=ON ../gdcm`

`checkinstall -D -y --pkgversion --pkgname=python3-gdcm --pkgversion=1`



`cp /usr/local/lib/gdcm.py /usr/local/lib/python3.6/site-packages/.`

`cp /usr/local/lib/gdcmswig.py /usr/local/lib/python3.6/site-packages/.`

`cp /usr/local/lib/_gdcmswig.so /usr/local/lib/python3.6/site-packages/.`

`cp /usr/local/lib/libgdcm* /usr/local/lib/python3.6/site-packages/.`

`ldconfig`

# INSTALLATION FROM .deb

`git clone --branch master https://github.com/HealthplusAI/python3-gdcm.git && cd python3-gdcm && dpkg -i build_1-1_amd64.deb && apt-get install -f`

`cp /usr/local/lib/gdcm.py /usr/local/lib/python3.6/site-packages/.`

`cp /usr/local/lib/gdcmswig.py /usr/local/lib/python3.6/site-packages/.`

`cp /usr/local/lib/_gdcmswig.so /usr/local/lib/python3.6/site-packages/.`

`cp /usr/local/lib/libgdcm* /usr/local/lib/python3.6/site-packages/.`

`ldconfig`
