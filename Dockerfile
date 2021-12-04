FROM debian:bullseye-slim

WORKDIR /runner

RUN sudo apt-get install curl

RUN curl -o actions-runner -L https://github.com/actions/runner/releases/download/v2.285.0/actions-runner-linux-x64-2.285.0.tar.gz

RUN tar xzf ./actions-runner

RUN ./config.sh --url https://github.com/${REPO} --token ${TOKEN}

ENTRYPOINT ["./run.sh"]