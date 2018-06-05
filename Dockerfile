FROM ruby:2.5.1

# MeCab
WORKDIR /usr/local/src
RUN git clone https://github.com/taku910/mecab.git

WORKDIR /usr/local/src/mecab/mecab
RUN ./configure --enable-utf8-only \
  && make \
  && make check \
  && make install \
  && ldconfig

WORKDIR /usr/local/src/mecab/mecab-ipadic
RUN ./configure --with-charset=utf8 \
  && make \
  && make install

RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app

