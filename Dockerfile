FROM python:3.7

RUN apt-get update
RUN pip install --upgrade pip

# GDCM PYTHON3 WRAPPER INSTALLATION

# BUILD COMMANDS IF NECESSARY
RUN apt install -y python-vtk6 libvtk6-dev cmake-curses-gui swig
RUN mkdir gdcm && cd gdcm && git clone --branch release git://git.code.sf.net/p/gdcm/gdcm
RUN mkdir build
RUN cd build && cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_FLAGS=-fPIC -DCMAKE_CXX_FLAGS=-fPIC -DGDCM_BUILD_SHARED_LIBS:BOOL=ON -DGDCM_WRAP_PYTHON=ON PYTHON_EXECUTABLE=/usr/local/bin/python3.7 PYTHON_INCLUDE_DIR=/usr/local/lib/python3.7/site-packages/ GDCM_BUILD_SHARED_LIBS=ON GDCM_USE_VTK=ON /gdcm/gdcm && cmake --build . --target install

## DEB INSTALLATION
#RUN git clone --branch master https://github.com/HealthplusAI/python3-gdcm.git && cd python3-gdcm && dpkg -i build_1-1_amd64.deb && apt-get install -f

RUN cp /usr/local/lib/gdcm.py /usr/local/lib/python3.7/site-packages/.
RUN cp /usr/local/lib/gdcmswig.py /usr/local/lib/python3.7/site-packages/.
RUN cp /usr/local/lib/_gdcmswig.so /usr/local/lib/python3.7/site-packages/.
RUN cp /usr/local/lib/libgdcm* /usr/local/lib/python3.7/site-packages/.
RUN ldconfig