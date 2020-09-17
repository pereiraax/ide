FROM alpine:3.12.0

RUN apk update && apk add ca-certificates 

RUN update-ca-certificates

run apk add -U --no-cache neovim git git-perl zsh openssh-client bash curl less docker tmux

RUN git config --global http.sslVerify "false"

RUN curl --insecure -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | zsh || true

COPY assets/.zshrc /root/.zshrc

COPY assets/.tmux.conf /root/.tmux.conf

COPY assets/.aliases /root/.aliases


CMD ["bash", "-c", "zsh"]
