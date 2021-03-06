FROM debian:buster-slim

WORKDIR /runner

RUN apt update

RUN DEBIAN_FRONTEND=noninteractive apt install curl libicu-dev -y

RUN curl -o actions-runner -L https://github.com/actions/runner/releases/download/v2.285.0/actions-runner-linux-x64-2.285.0.tar.gz

RUN tar xzf ./actions-runner

USER 7000

RUN ./config.sh --url https://github.com/${REPO} --token ${TOKEN}

ENTRYPOINT ["./run.sh"]