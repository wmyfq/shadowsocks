install_ubuntu_ssr(){
    apt-get update -y
    apt-get install supervisor lsof -y
    apt-get install build-essential wget -y
    apt-get install iptables git -y
    wget https://github.com/jedisct1/libsodium/releases/download/1.0.13/libsodium-1.0.13.tar.gz
    tar xf libsodium-1.0.13.tar.gz && cd libsodium-1.0.13
    ./configure && make -j2 && make install
    echo /usr/local/lib > /etc/ld.so.conf.d/usr_local_lib.conf
    ldconfig
    apt-get install python-pip git -y
    pip install cymysql
    cd /root
    git clone -b manyuser https://github.com/wmyfq/shadowsocks.git "/root/shadowsocks"
    cd shadowsocks
    pip install -r requirements.txt
    chmod +x *.sh
    # 配置程序
    cp apiconfig.py userapiconfig.py
    cp config.json user-config.json
}

install_ubuntu_ssr
