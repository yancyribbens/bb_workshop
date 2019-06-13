FROM python:3

WORKDIR ~
RUN pip install --user lnd_grpc
RUN pip install --user qrcode[pil]
RUN PATH=$PATH:/home/jovyan/.local/bin
RUN curl -L https://github.com/lightningnetwork/lnd/releases/download/v0.6.1-beta/lnd-linux-386-v0.6.1-beta.tar.gz --output lnd-linux-386-v0.6.1-beta.tar.gz
RUN tar -C ~/ -xzf ./lnd-linux-386-v0.6.1-beta.tar.gz

ENTRYPOINT ["/bin/bash", "-c", "/root/lnd-linux-386-v0.6.1-beta/lnd --bitcoin.active --bitcoin.testnet --debuglevel=info --bitcoin.node=neutrino --neutrino.addpeer=btcd-testnet.lightning.computer"]
