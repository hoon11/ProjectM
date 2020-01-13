FROM elixir:1.8.1

RUN cd $HOME
# update
RUN dnf -y update

# install git
RUN dnf install git

# install asdf 
RUN git clone https://github.com/asdf-vm/asdf.git

RUN echo -e '\n. $HOME/asdf/asdf.sh' >> ~/.bashrc
RUN echo -e '\n. $HOME/asdf/completions/asdf.bash' >> ~/.bashrc
RUN source ~/.bashrc
RUN dnf install \
  automake autoconf readline-devel \
  ncurses-devel openssl-devel \
  libxslt-devel libffi-devel libtool unixODBC-devel \
  unzip curl \
  make

# install erlang
RUN asdf plugin-add erlang
RUN asdf install erlang 22.1
# install elixir
RUN asdf plugin-add elixir
RUN asdf install elixir 1.9.1-otp-22

# node *for phx
RUN asdf plugin-add nodejs

# asdf global 
RUN asdf global erlang 22.1
RUN asdf global elixir 1.9.1-otp-22


# docker image run