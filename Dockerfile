FROM alpine:3.12.0

ENV TERM screen-256color


WORKDIR /root/
# clean if exists 
RUN rm -rf /root/.oh-my-zsh || true


COPY assets/.zshrc /root/.zshrc

COPY assets/.tmux.conf /root/.tmux.conf

COPY assets/.aliases /root/.aliases

COPY assets/tmux-power.tmux /root/tmux-power.tmux

RUN apk update && apk add ca-certificates 

RUN update-ca-certificates

RUN apk add -U neovim git git-perl zsh openssh-client bash curl less docker tmux

RUN git config --global http.sslVerify "false"

RUN curl --insecure -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | zsh || true

RUN git clone https://github.com/erikw/tmux-powerline.git /usr/lib/tmux-powerline
 
# RUN git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack


CMD ["bash", "-c", "tmux -u"]
