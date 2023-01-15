FROM cloudron/base:4.0.0@sha256:31b195ed0662bdb06a6e8a5ddbedb6f191ce92e8bee04c03fb02dd4e9d0286df

RUN mkdir -p /app/code
WORKDIR /app/code

RUN curl -L https://github.com/dutchcoders/transfer.sh/releases/download/v1.4.0/transfersh-v1.4.0-linux-amd64 -o /app/code/transfersh && chmod +x /app/code/transfersh

ADD start.sh /app/code/start.sh
ADD env.template /app/code/env.template

RUN ln -fs /app/data/env.production /app/code/.env.production

CMD [ "/app/code/start.sh" ]

