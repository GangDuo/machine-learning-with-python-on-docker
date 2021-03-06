FROM python:3.7.3

RUN apt-get update && \
    apt-get install -y locales \
                       unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen ja_JP.UTF-8

ENV LC_ALL ja_JP.UTF-8

# 日本語フォントインストール
WORKDIR /usr/share/fonts
ENV RICTY_DIMINISHED_VERSION 3.2.4
RUN wget https://github.com/mzyy94/RictyDiminished-for-Powerline/archive/$RICTY_DIMINISHED_VERSION-powerline-early-2016.zip && \
    unzip -jo $RICTY_DIMINISHED_VERSION-powerline-early-2016.zip && \
    rm $RICTY_DIMINISHED_VERSION-powerline-early-2016.zip && \
    fc-cache -fv

# Matplotlib用の設定ファイル
WORKDIR /etc
RUN { \
      echo "backend : Agg"; \
      echo "font.family : Ricty Diminished"; \
    } > matplotlibrc

RUN pip install --upgrade pip

WORKDIR /app

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/bin/bash"]
