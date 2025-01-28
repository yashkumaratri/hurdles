# Install tmux without sudo

# Step 1: Install libevent (dependency for tmux)
# Download the stable release of libevent
wget https://github.com/libevent/libevent/releases/download/release-2.1.12-stable/libevent-2.1.12-stable.tar.gz

# Extract the tarball
tar xvzf libevent-2.1.12-stable.tar.gz

# Change to the extracted directory
cd libevent-2.1.12-stable

# Configure the build to install libevent locally in $HOME/local and disable shared libraries
./configure --prefix=$HOME/local --disable-shared

# Compile the source code
make

# Install libevent locally
make install

# Return to the parent directory
cd ..

# Step 2: Install ncurses (another dependency for tmux)
# Download the stable release of ncurses
wget https://ftp.gnu.org/pub/gnu/ncurses/ncurses-6.5.tar.gz

# Extract the tarball
tar xvzf ncurses-6.5.tar.gz

# Change to the extracted directory
cd ncurses-6.5

# Configure the build to install ncurses locally in $HOME/local
./configure --prefix=$HOME/local

# Compile the source code
make

# Install ncurses locally
make install

# Return to the parent directory
cd ..

# Step 3: Install tmux
# Download the stable release of tmux
wget https://github.com/tmux/tmux/releases/download/3.5a/tmux-3.5a.tar.gz

# Extract the tarball
tar xvzf tmux-3.5a.tar.gz

# Change to the extracted directory
cd tmux-3.5a

# Configure the build to use the locally installed libevent and ncurses
./configure CFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses" \
    LDFLAGS="-L$HOME/local/lib -L$HOME/local/include/ncurses -L$HOME/local/include" \
    CPPFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses" \
    LDFLAGS="-static -L$HOME/local/include -L$HOME/local/include/ncurses -L$HOME/local/lib"

# Compile the source code
make

# Copy the tmux binary to $HOME/local/bin
cp tmux $HOME/local/bin

# Return to the parent directory
cd ..

# Step 4: Create an alias for tmux
# Add the following alias to your shell configuration file (e.g., ~/.bashrc or ~/.zshrc):
# alias tmux="$HOME/local/bin/tmux"

# After adding the alias, reload your shell configuration:
# source ~/.bashrc

# tmux is now installed and can be run using the command `tmux`.
