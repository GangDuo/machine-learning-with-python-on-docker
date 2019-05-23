FROM python:3.7.3

RUN apt-get update && \
    apt-get install -y locales && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen ja_JP.UTF-8

ENV LC_ALL ja_JP.UTF-8

RUN pip install --upgrade pip && \
    pip install numpy scipy matplotlib scikit-learn

WORKDIR /app
