#!/bin/bash
dog_cfg_path=~/.DogeCoinDark/DogeCoinDark.conf
i2p_cfg_path=/usr/share/i2p/i2ptunnel.config

function dog_conf () {
	if [[ -f "$dog_cfg_path" ]]
	then
		mv "$dog_cfg_path" "$dog_cfg_path".bak
		(cat <<- _EOF_ 
		gen=0
		i2p=1
		connect=2rdno5ah3p3px4n4yy6ml4uehxre2oiwo34ujrw54gh7e2m7igaq.b32.i2p
		connect=jq2xulvypntlz2oyzovjsbzexfgz4yyemxr7jqdogn2jngjdipvq.b32.i2p
		connect=zlrpkbudiwyahhufjx6v6zi2f4d37ulq4jzumndktzekmlqhupma.b32.i2p
		connect=ccdmw3f32wwkxviqrdamuduvpbc7dxbmz2kemticyrbt3oaoehaa.b32.i2p
		proxy=127.0.0.1:9000
		socks=5
		_EOF_
		) > "$dog_cfg_path"
	fi
}

function i2p_conf () {
	if [[ -f "$dog_cfg_path" ]]
	then
		mv "$i2p_cfg_path" "$i2p_cfg_path".bak
		(cat <<- _EOF_
		# NOTE: This I2P config file must use UTF-8 encoding
		tunnel.0.description=HTTP proxy for browsing eepsites and the web
		tunnel.0.i2cpHost=127.0.0.1
		tunnel.0.i2cpPort=7654
		tunnel.0.interface=127.0.0.1
		tunnel.0.listenPort=4444
		tunnel.0.name=I2P HTTP Proxy
		tunnel.0.option.i2cp.reduceIdleTime=900000
		tunnel.0.option.i2cp.reduceOnIdle=true
		tunnel.0.option.i2cp.reduceQuantity=1
		tunnel.0.option.i2p.streaming.connectDelay=1000
		tunnel.0.option.i2p		tunnel.httpclient.SSLOutproxies=false.i2p
		tunnel.0.option.inbound.length=3
		tunnel.0.option.inbound.lengthVariance=0
		tunnel.0.option.inbound.nickname=shared clients
		tunnel.0.option.outbound.length=3
		tunnel.0.option.outbound.lengthVariance=0
		tunnel.0.option.outbound.nickname=shared clients
		tunnel.0.option.outbound.priority=10
		tunnel.0.proxyList=false.i2p
		tunnel.0.sharedClient=true
		tunnel.0.startOnLoad=true
		tunnel.0.type=httpclient
		tunnel.1.description=IRC tunnel to access the Irc2P network
		tunnel.1.i2cpHost=127.0.0.1
		tunnel.1.i2cpPort=7654
		tunnel.1.interface=127.0.0.1
		tunnel.1.listenPort=6668
		tunnel.1.name=Irc2P
		tunnel.1.option.crypto.lowTagThreshold=14
		tunnel.1.option.crypto.tagsToSend=20
		tunnel.1.option.i2cp.closeIdleTime=1200000
		tunnel.1.option.i2cp.closeOnIdle=true
		tunnel.1.option.i2cp.delayOpen=true
		tunnel.1.option.i2cp.destination.sigType=ECDSA_SHA256_P256
		tunnel.1.option.i2cp.newDestOnResume=false
		tunnel.1.option.i2cp.reduceIdleTime=600000
		tunnel.1.option.i2cp.reduceOnIdle=true
		tunnel.1.option.i2cp.reduceQuantity=1
		tunnel.1.option.i2p.streaming.connectDelay=1000
		tunnel.1.option.i2p.streaming.maxWindowSize=16
		tunnel.1.option.inbound.length=3
		tunnel.1.option.inbound.lengthVariance=0
		tunnel.1.option.inbound.nickname=Irc2P
		tunnel.1.option.outbound.length=3
		tunnel.1.option.outbound.lengthVariance=0
		tunnel.1.option.outbound.nickname=Irc2P
		tunnel.1.option.outbound.priority=15
		tunnel.1.sharedClient=false
		tunnel.1.startOnLoad=true
		tunnel.1.targetDestination=irc.dg.i2p:6667,irc.postman.i2p:6667,irc.echelon.i2p:6667
		tunnel.1.type=ircclient
		tunnel.2.description=I2P Monotone Server
		tunnel.2.i2cpHost=127.0.0.1
		tunnel.2.i2cpPort=7654
		tunnel.2.interface=127.0.0.1
		tunnel.2.listenPort=8998
		tunnel.2.name=mtn.i2p-projekt.i2p
		tunnel.2.option.i2cp.reduceIdleTime=900000
		tunnel.2.option.i2cp.reduceOnIdle=true
		tunnel.2.option.i2cp.reduceQuantity=1
		tunnel.2.option.inbound.length=3
		tunnel.2.option.inbound.lengthVariance=0
		tunnel.2.option.inbound.nickname=shared clients
		tunnel.2.option.outbound.length=3
		tunnel.2.option.outbound.lengthVariance=0
		tunnel.2.option.outbound.nickname=shared clients
		tunnel.2.sharedClient=true
		tunnel.2.startOnLoad=false
		tunnel.2.targetDestination=mtn.i2p-projekt.i2p:4691
		tunnel.2.type=client
		tunnel.3.description=My eepsite
		tunnel.3.i2cpHost=127.0.0.1
		tunnel.3.i2cpPort=7654
		tunnel.3.name=I2P webserver
		tunnel.3.option.i2cp.destination.sigType=ECDSA_SHA256_P256
		tunnel.3.option.inbound.length=3
		tunnel.3.option.inbound.lengthVariance=0
		tunnel.3.option.inbound.nickname=eepsite
		tunnel.3.option.outbound.length=3
		tunnel.3.option.outbound.lengthVariance=0
		tunnel.3.option.outbound.nickname=eepsite
		tunnel.3.option.shouldBundleReplyInfo=false
		tunnel.3.privKeyFile=eepsite/eepPriv.dat
		tunnel.3.spoofedHost=mysite.i2p
		tunnel.3.startOnLoad=false
		tunnel.3.targetHost=127.0.0.1
		tunnel.3.targetPort=7658
		tunnel.3.type=httpserver
		tunnel.4.description=smtp server
		tunnel.4.i2cpHost=127.0.0.1
		tunnel.4.i2cpPort=7654
		tunnel.4.interface=127.0.0.1
		tunnel.4.listenPort=7659
		tunnel.4.name=smtp.postman.i2p
		tunnel.4.option.i2cp.reduceIdleTime=900000
		tunnel.4.option.i2cp.reduceOnIdle=true
		tunnel.4.option.i2cp.reduceQuantity=1
		tunnel.4.option.inbound.length=3
		tunnel.4.option.inbound.lengthVariance=0
		tunnel.4.option.inbound.nickname=shared clients
		tunnel.4.option.outbound.length=3
		tunnel.4.option.outbound.lengthVariance=0
		tunnel.4.option.outbound.nickname=shared clients
		tunnel.4.sharedClient=true
		tunnel.4.startOnLoad=true
		tunnel.4.targetDestination=smtp.postman.i2p:25
		tunnel.4.type=client
		tunnel.5.description=pop3 server
		tunnel.5.i2cpHost=127.0.0.1
		tunnel.5.i2cpPort=7654
		tunnel.5.interface=127.0.0.1
		tunnel.5.listenPort=7660
		tunnel.5.name=pop3.postman.i2p
		tunnel.5.option.i2cp.reduceIdleTime=900000
		tunnel.5.option.i2cp.reduceOnIdle=true
		tunnel.5.option.i2cp.reduceQuantity=1
		tunnel.5.option.i2p.streaming.connectDelay=1000
		tunnel.5.option.inbound.length=3
		tunnel.5.option.inbound.lengthVariance=0
		tunnel.5.option.inbound.nickname=shared clients
		tunnel.5.option.outbound.length=3
		tunnel.5.option.outbound.lengthVariance=0
		tunnel.5.option.outbound.nickname=shared clients
		tunnel.5.sharedClient=true
		tunnel.5.startOnLoad=true
		tunnel.5.targetDestination=pop.postman.i2p:110
		tunnel.5.type=client
		tunnel.6.description=HTTPS proxy for browsing eepsites and the web
		tunnel.6.i2cpHost=127.0.0.1
		tunnel.6.i2cpPort=7654
		tunnel.6.interface=127.0.0.1
		tunnel.6.listenPort=4445
		tunnel.6.name=I2P HTTPS Proxy
		tunnel.6.option.i2cp.reduceIdleTime=900000
		tunnel.6.option.i2cp.reduceOnIdle=true
		tunnel.6.option.i2cp.reduceQuantity=1
		tunnel.6.option.i2p.streaming.connectDelay=1000
		tunnel.6.option.inbound.length=3
		tunnel.6.option.inbound.lengthVariance=0
		tunnel.6.option.inbound.nickname=shared clients
		tunnel.6.option.outbound.length=3
		tunnel.6.option.outbound.lengthVariance=0
		tunnel.6.option.outbound.nickname=shared clients
		tunnel.6.proxyList=outproxy-tor.meeh.i2p
		tunnel.6.sharedClient=true
		tunnel.6.startOnLoad=true
		tunnel.6.type=connectclient
		tunnel.7.interface=127.0.0.1
		tunnel.7.listenPort=9000
		tunnel.7.name=dogedsock9000
		tunnel.7.option.i2cp.closeIdleTime=1800000
		tunnel.7.option.i2cp.closeOnIdle=false
		tunnel.7.option.i2cp.delayOpen=false
		tunnel.7.option.i2cp.destination.sigType=0
		tunnel.7.option.i2cp.newDestOnResume=false
		tunnel.7.option.i2cp.reduceIdleTime=1200000
		tunnel.7.option.i2cp.reduceOnIdle=false
		tunnel.7.option.i2cp.reduceQuantity=1
		tunnel.7.option.i2p.streaming.connectDelay=0
		tunnel.7.option.i2ptunnel.httpclient.allowInternalSSL=false
		tunnel.7.option.i2ptunnel.httpclient.sendAccept=false
		tunnel.7.option.i2ptunnel.httpclient.sendReferer=false
		tunnel.7.option.i2ptunnel.httpclient.sendUserAgent=false
		tunnel.7.option.i2ptunnel.useLocalOutproxy=true
		tunnel.7.option.inbound.backupQuantity=0
		tunnel.7.option.inbound.length=3
		tunnel.7.option.inbound.lengthVariance=0
		tunnel.7.option.inbound.nickname=dogedsock9000
		tunnel.7.option.inbound.quantity=2
		tunnel.7.option.outbound.backupQuantity=0
		tunnel.7.option.outbound.length=3
		tunnel.7.option.outbound.lengthVariance=0
		tunnel.7.option.outbound.nickname=dogedsock9000
		tunnel.7.option.outbound.quantity=2
		tunnel.7.option.outproxyAuth=false
		tunnel.7.option.persistentClientKey=false
		tunnel.7.option.useSSL=false
		tunnel.7.privKeyFile=i2ptunnel7-privKeys.dat
		tunnel.7.sharedClient=false
		tunnel.7.startOnLoad=true
		tunnel.7.type=sockstunnel
		_EOF_
		) > "$i2p_cfg_path"
fi
	
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
    mkdir -p ~/.DogeCoinDark
    chmod -R 0777 ~/.DogeCoinDark
    #cp $path/DogeCoinDark.conf $HOME/.DogeCoinDark/DogeCoinDark.conf
    dog_conf
    apt-add-repository ppa:i2p-maintainers/i2p -y
    apt-get update
    apt-get install i2p default-jre -y
    #dpkg-reconfigure i2p
    #cp $path/i2ptunnel.config /usr/share/i2p/i2ptunnel.config
    i2p_conf
    sed -i s/RUN_DAEMON=\"false\"/RUN_DAEMON=\"true\"/ /etc/default/i2p
    service i2p start
    #/etc/init.d/i2p start
fi
$(which dogecoindark-qt) &
#/usr/bin/dogecoindark-qt -onlynet=native_i2p
