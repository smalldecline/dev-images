FROM ubuntu

ENV email_qq 3218125624@qq.com
ENV email_google smalldecline123@gmail.com
ENV github_repo https://github.com/smalldecline
ENV DEBIAN_FRONTEND=noninteractive
ENV clash_proxy host.docker.internal:7890
COPY enable_proxy /usr/local/bin
COPY disable_proxy /usr/local/bin

COPY sources.list /etc/apt/
RUN apt update

RUN apt install -y ca-certificates wget curl

RUN apt install -y git 
RUN git config --global user.email ${email_qq}\
	&& git config --global user.name smalldecline \
	&& git config --global http.https://github.com.proxy ${clash_proxy} \
	&& git config --global https.https://github.com.proxy ${clash_proxy}

RUN apt-get install -y language-pack-zh-hans locales
RUN locale-gen zh_CN.UTF-8
ENV LC_ALL=zh_CN.UTF-8

RUN apt-get install -y tzdata && ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN apt install -y zsh \
	&& chsh -s /bin/zsh

ENV http_proxy=${clash_proxy}
ENV https_proxy=${clash_proxy}

RUN sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions\
	&& git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

ADD .zshrc /root

ENV http_proxy=
ENV https_proxy=