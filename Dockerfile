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

RUN apk add -U neovim git git-perl zsh openssh-client bash curl less docker tmux fzf

RUN git config --global http.sslVerify "false"
    
RUN curl --insecure -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | zsh || true

RUN curl --insecure -LO https://storage.googleapis.com/kubernetes-release/release/$(curl --insecure -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl

RUN chmod +x ./kubectl

RUN mv ./kubectl /usr/local/bin/kubectl

COPY assets/.zshrc /root/.zshrc

COPY assets/.tmux.conf /root/.tmux.conf

COPY assets/.aliases /root/.aliases


CMD ["bash", "-c", "tmux -2 -u"]
