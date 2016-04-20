FROM abaez/lua
MAINTAINER Jay Thomas <jay@gfax.ch

ENV LUAROCKS_VERSION 2.3.0
ENV LUAROCKS_INSTALL luarocks-$LUAROCKS_VERSION
ENV TMP_LOC /tmp/luarocks

# Build luarocks
RUN curl -O http://keplerproject.github.io/luarocks/releases/$LUAROCKS_INSTALL.tar.gz

RUN tar xvzf $LUAROCKS_INSTALL.tar.gz && \
    mv $LUAROCKS_INSTALL $TMP_LOC && \
    rm $LUAROCKS_INSTALL.tar.gz


WORKDIR $TMP_LOC

RUN ./configure \
  --with-lua=$WITH_LUA \
  --with-lua-include=$LUA_INCLUDE \
  --with-lua-lib=$LUA_LIB

RUN make build

RUN make install

WORKDIR /

RUN rm $TMP_LOC -rf

## Luarocks
RUN luarocks install luacheck

## App setup
RUN mkdir /usr/app
WORKDIR /usr/app
COPY . /usr/app

## Run tests
CMD ["luacheck", "."]
