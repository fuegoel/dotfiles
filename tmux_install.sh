# Exit on error
set -e

TMUX_VERSION=2.5
LIBEVENT_VERSION=2.1.8
NCURSES_VERSION=6.0

mkdir -p $HOME/local $HOME/tmux_tmp
rm -rf $HOME/tmux_tmp/*
cd $HOME/tmux_tmp

############
# libevent #
############
wget https://github.com/libevent/libevent/releases/download/release-${LIBEVENT_VERSION}-stable/libevent-${LIBEVENT_VERSION}-stable.tar.gz
tar xvzf libevent-${LIBEVENT_VERSION}-stable.tar.gz
cd libevent-*/
./configure --prefix=$HOME/local --disable-shared
make
make install
cd ..

############
# ncurses  #
############
wget ftp://ftp.gnu.org/gnu/ncurses/ncurses-${NCURSES_VERSION}.tar.gz
tar xvzf ncurses-${NCURSES_VERSION}.tar.gz
cd ncurses-*/
#./configure --prefix=$HOME/local LDFLAGS="-static"
./configure --prefix=$HOME/local
make
make install
cd ..

############
# tmux     #
############
wget -O tmux-${TMUX_VERSION}.tar.gz https://github.com/tmux/tmux/releases/download/${TMUX_VERSION}/tmux-${TMUX_VERSION}.tar.gz
tar xvzf tmux-${TMUX_VERSION}.tar.gz
cd tmux-${TMUX_VERSION}
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"/usr/local/lib"
./configure CFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses" LDFLAGS="-L$HOME/local/lib -L$HOME/local/include/ncurses -L$HOME/local/include"
CPPFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses" LDFLAGS="-static -L$HOME/local/include -L$HOME/local/include/ncurses -L$HOME/local/lib" make
cp tmux $HOME/local/bin
cd ..

echo "Add export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"/usr/local/lib" to your .bashrc"
rm -rf $HOME/tmux_tmp
