FROM devenv:base
RUN apt install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev libbz2-dev
ADD ./Python-3.10.3.tgz /usr/local/src
RUN cd /usr/local/src/Python-3.10.3 && ./configure && make && make install && rm -rf /usr/local/src/Python-3.10.3
RUN pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple