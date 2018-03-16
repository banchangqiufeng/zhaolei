cd /Data/tgz/
wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.38.tar.gz
tar zxvf pcre-8.38.tar.gz
cd pcre-8.38
./configure --prefix=/Data/apps/pcre
make && make install