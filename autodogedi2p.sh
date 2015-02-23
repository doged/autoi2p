#!/bin/bash
path=$(pwd)

function dog_conf () {
    mkdir -p $HOME/.DogeCoinDark
    chmod -R 0777 $HOME/.DogeCoinDark
    cp $path/DogeCoinDark.conf $HOME/.DogeCoinDark/DogeCoinDark.conf
}


function i2p_conf () {

    cp $path/i2ptunnel.config /usr/share/i2p/i2ptunnel.config
}

if [[ $EUID -eq 0 ]] 
then
    apt-get install -f --force-yes --yes build-essential pkg-config libtool autotools-dev autoconf automake libssl-dev libboost-all-dev libdb5.3-dev  libdb5.3++-dev libminiupnpc-dev libdb++-dev qt4-qmake libqt4-dev libboost-dev libboost-system-dev libboost-filesystem-dev libboost-program-options-dev libboost-thread-dev libssl-dev libminiupnpc8 git 
    $(which git) clone https://github.com/doged/dogedsource && cd dogedsource/src
    make -f makefile.unix && make install
    if [[ -f src/dogecoindarkd ]] 
    then
     cp src/dogecoindarkd /usr/bin/dogecoindarkd
    fi
    cd ..
    qmake "USE_UPNP=- USE_QRCODE=0 USE_IPV6=0" dogecoindark-qt.pro
    make
    if [[ -f dogecoindark-qt ]] 
    then
     cp dogecoindark-qt /usr/bin/dogecoindark-qt
    fi
    dog_conf
    apt-add-repository ppa:i2p-maintainers/i2p -y
    apt-get update
    apt-get install i2p default-jre -y
    dpkg-reconfigure i2p
    i2p_conf
    sed -i s/RUN_DAEMON=\"false\"/RUN_DAEMON=\"true\"/ /etc/default/i2p
    service i2p start
    #/etc/init.d/i2p start
fi
$(which dogecoindark-qt) &
#/usr/bin/dogecoindark-qt -onlynet=native_i2p
