FROM golang:1.17-alpine3.15
ENV PATH="$PATH:/bin/bash" \
  BENTO4_BIN="/opt/bento4/bin" \
  PATH="$PATH:/opt/bento4/bin"

RUN apk add --update bash curl make

#install terminal
RUN apk add zsh curl wget git
RUN echo 'sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"'
RUN echo 'sed -i -e "s/bin\/ash/bin\/zsh/" /etc/passwd'


WORKDIR /go/src

#vamos mudar para o endpoint correto. Usando top apenas para segurar o processo rodando
ENTRYPOINT [ "top" ]