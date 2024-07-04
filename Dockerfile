# Step 1: Use an official Ubuntu base image
FROM ubuntu:20.04

# Step 2: Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Step 3: Install necessary packages
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    cmake \
    python3 \
    python3-pip \
    libgl1-mesa-dev \
    llvm-10 \
    clang-10 \
    nodejs \
    npm \
    wget \
    curl \
    && ln -sf /usr/bin/python3 /usr/bin/python \
    && rm -rf /var/lib/apt/lists/*

# Step 4: Install Emscripten SDK
RUN git clone https://github.com/emscripten-core/emsdk.git /emsdk \
    && cd /emsdk \
    && ./emsdk install 1.39.8 \
    && ./emsdk activate 1.39.8 \
    && echo "source $EMSDK/emsdk_env.sh" >> /etc/profile

# Step 5: Set environment variables for Emscripten
ENV EMSDK /emsdk
ENV PATH /emsdk:/emsdk/upstream/emscripten:/emsdk/node/18.20.3_64bit/bin:$PATH
ENV EMSDK_NODE /emsdk/node/18.20.3_64bit/bin/node
ENV EM_CACHE /emsdk/upstream/emscripten/cache
ENV EM_CONFIG /emsdk/.emscripten

# Step 6: Clone the Qt5 repository and check out the desired branch
RUN git clone git://code.qt.io/qt/qt5.git /qt5 \
    && cd /qt5 \
    && git checkout 5.15 \
    && ./init-repository --module-subset=default,qtbase,qtdeclarative,qtquickcontrols2,qtsvg

# Step 6: Configure and build Qt5
WORKDIR /qt5
RUN ./configure -xplatform wasm-emscripten -prefix $PWD/qtbase -nomake examples -nomake tests -skip qtwebengine -confirm-license
RUN make -j$(nproc)

# Step 8: Create the config.h file for MuseScore
RUN mkdir -p /musescore/libmscore \
    && echo '#ifndef CONFIG_H' > /musescore/libmscore/config.h \
    && echo '#define CONFIG_H' >> /musescore/libmscore/config.h \
    && echo '' >> /musescore/libmscore/config.h \
    && echo '#define MUSESCORE_NAME_VERSION "MuseScore 3.3.0"' >> /musescore/libmscore/config.h \
    && echo '#define VERSION "3.3.0"' >> /musescore/libmscore/config.h \
    && echo '#define BUILD_NUMBER "3543170"' >> /musescore/libmscore/config.h \
    && echo '' >> /musescore/libmscore/config.h \
    && echo '#define INSTALL_NAME "MuseScore"' >> /musescore/libmscore/config.h \
    && echo '#define INSTPREFIX "/usr/local"' >> /musescore/libmscore/config.h \
    && echo '' >> /musescore/libmscore/config.h \
    && echo '#endif // CONFIG_H' >> /musescore/libmscore/config.h

# Step 5: Clone the MuseScoreWeb repository and navigate to the project directory
RUN git clone https://github.com/ttambet/MuseScoreWeb.git /musescoreweb
WORKDIR /musescoreweb

# Step 6: Pull the latest changes from the repository
RUN git pull origin web

# Step 6: Build the project using Emscripten
RUN /bin/bash -c "source $EMSDK/emsdk_env.sh && /qt5/qtbase/bin/qmake libmscore.wasm.pro -spec wasm-emscripten && make -j$(nproc)"

# Step 7: Create a directory to hold the built files
RUN mkdir /output

# Step 8: Copy the built files to the output directory
RUN cp -r /musescoreweb/path/to/generated/files/* /output/

# Step 9: Set entrypoint
ENTRYPOINT ["/bin/bash"]
