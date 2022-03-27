FROM ubuntu

SHELL ["/bin/bash", "-c"]

COPY sources.list /etc/apt/
RUN apt update

ENV email_qq 3218125624@qq.com
ENV email_google smalldecline123@gmail.com
ENV github_repo https://github.com/smalldecline
ENV clash_proxy host.docker.internal:7890

RUN apt install -y ca-certificates wget

COPY enable_proxy /usr/local/bin
COPY disable_proxy /usr/local/bin

RUN apt-get install -y language-pack-zh-hans locales
RUN locale-gen zh_CN.UTF-8 \
	&& echo "export LC_ALL=zh_CN.UTF-8">> /etc/profile \
	&& source /etc/profile
RUN apt-get install -y tzdata && ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN apt install -y git 
RUN git config --global user.email ${email_qq}\
	&& git config --global user.name smalldecline \
	&& git config --global http.https://github.com.proxy ${clash_proxy} \
	&& git config --global https.https://github.com.proxy ${clash_proxy}

RUN enable_proxy
RUN apt install -y zsh \
	&& sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
	&& chsh -s /bin/zsh
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions\
	&& git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
ADD ./.zshrc /root