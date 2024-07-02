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
    && rm -rf /var/lib/apt/lists/*

# Step 4: Install Emscripten SDK
RUN git clone https://github.com/emscripten-core/emsdk.git /emsdk \
    && cd /emsdk \
    && ./emsdk install 1.39.8 \
    && ./emsdk activate 1.39.8 \
    && echo "source /emsdk/emsdk_env.sh" >> ~/.bashrc

# Step 5: Set up Emscripten environment
SHELL ["/bin/bash", "-c"]
RUN source /emsdk/emsdk_env.sh

# Step 6: Clone the Qt5 repository and check out the desired branch
RUN git clone git://code.qt.io/qt/qt5.git /qt5 \
    && cd /qt5 \
    && git checkout 5.15 \
    && ./init-repository --module-subset=default,qtbase,qtdeclarative,qtquickcontrols2,qtsvg

# Step 7: Configure and build Qt5
RUN cd /qt5 \
    && ./configure -xplatform wasm-emscripten -prefix $PWD/qtbase -nomake examples -nomake tests -skip qtwebengine -confirm-license \
    && make -j$(nproc)

# Step 8: Create the config.h file for MuseScore
RUN mkdir -p /musescore/libmscore
COPY <<'EOF' /musescore/libmscore/config.h
#ifndef CONFIG_H
#define CONFIG_H

#define MUSESCORE_NAME_VERSION "MuseScore 3.3.0"
#define VERSION "3.3.0"
#define BUILD_NUMBER "3543170"

#define INSTALL_NAME "MuseScore"
#define INSTPREFIX "/usr/local"

#endif // CONFIG_H
EOF

# Step 9: Navigate to MuseScore project directory and configure the project with qmake
WORKDIR /musescore
RUN /qt5/qtbase/bin/qmake libmscore.wasm.pro -spec wasm-emscripten

# Step 10: Build MuseScore project
RUN make -j$(nproc)

# Step 11: Set entrypoint
ENTRYPOINT ["/bin/bash"]
