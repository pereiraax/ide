FROM alpine:3.12.0

WORKDIR /root/
# clean if exists 
RUN rm -rf /root/.oh-my-zsh || true


# Set the timezone on Paris
RUN apk add tzdata acpi
RUN cp /usr/share/zoneinfo/Europe/Brussels /etc/localtime
RUN echo "Europe/Paris" >  /etc/timezone

RUN apk update && apk add ca-certificates 

RUN update-ca-certificates

RUN apk add -U neovim git git-perl zsh openssh-client bash curl less docker tmux

COPY assets/.zshrc /root/.zshrc

RUN curl --insecure -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | zsh || true

COPY assets/.tmux.conf /root/.tmux.conf

COPY assets/.aliases /root/.aliases

RUN git config --global http.sslVerify "false"

CMD ["bash", "-c", "tmux -2 -u"]
