#!/bin/bash
#todo_setup_much_configs
path=$(pwd)
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
    mkdir -p $HOME/.DogeCoinDark
    chmod -R 0777 $HOME/.DogeCoinDark
    if [[ -f $HOME/.DogeCoinDark/DogeCoinDark.conf ]]
    then 
     mv $HOME/.DogeCoinDark/DogeCoinDark.conf $HOME/.DogeCoinDark/DogeCoinDark.conf.bak
     cp DogeCoinDark.conf $HOME/.DogeCoinDark/DogeCoinDark.conf
    fi
  
    apt-add-repository ppa:i2p-maintainers/i2p -y
    apt-get update
    apt-get install i2p default-jre -y
    dpkg-reconfigure i2p
    if [[ -f /usr/share/i2p/i2ptunnel.config ]] 
    then
    mv /usr/share/i2p/i2ptunnel.config /usr/share/i2p/i2ptunnel.config.bak
    cp $path/i2ptunnel.config /usr/share/i2p/i2ptunnel.config
    fi
    
    sed -i s/RUN_DAEMON=\"false\"/RUN_DAEMON=\"true\"/ /etc/default/i2p
    service i2p start
    #/etc/init.d/i2p start
fi
$(which dogecoindark-qt) &
#/usr/bin/dogecoindark-qt -onlynet=native_i2p
