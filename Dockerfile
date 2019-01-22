FROM debian:stretch-slim

# Installazione dei requisiti
RUN apt-get update && \
apt-get install --no-install-recommends -y \
sudo \
tor \
privoxy \
git \
python \
ca-certificates \
python-pycurl \
python-geoip \
python-whois \
python-crypto \
python-requests \
python-scapy \
dnsutils

# Creazione dell'utente 
RUN useradd -d /home/ufonet -m ufonet && \
passwd -d ufonet && \
adduser ufonet sudo

# Selezione utente
USER ufonet

# Selezione dello spazio di lavoro
WORKDIR /home/ufonet

# Installazione di Ufonet all'interno della macchina 
RUN git clone https://github.com/epsylon/ufonet.git

# Configurazione del Tor Proxy mediante Privoxy e Torcc
RUN sudo rm -f /etc/privoxy/config && \
sudo rm -f /etc/tor/torcc && \
echo "listen-address localhost:8118" | sudo tee -a /etc/privoxy/config && \
echo "forward-socks5 / localhost:9050 ." | sudo tee -a /etc/privoxy/config && \
echo "forward-socks4 / localhost:9050 ." | sudo tee -a /etc/privoxy/config && \
echo "forward-socks4a / localhost:9050 ." | sudo tee -a /etc/privoxy/config && \
echo "SOCKSPort localhost:9050" | sudo tee -a /etc/tor/torcc

# Pulizia dei pacchetti non necessati
RUN sudo apt-get --purge autoremove -y \
wget \
git && \
sudo apt-get autoclean -y && \
sudo rm /etc/apt/sources.list && \
sudo rm -rf /var/cache/apt/archives/* && \
sudo rm -rf /var/lib/apt/lists/*

# Nuova selezione dello spazio di lavoro
WORKDIR /home/ufonet/ufonet/

# Comando per l'esecuzione e lo start di Ufonet
CMD sudo service tor start && sudo service privoxy start && ./ufonet --gui