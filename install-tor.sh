
set -ex

sudo apt-add-repository -yn -s "deb https://deb.torproject.org/torproject.org $(lsb_release -cs) main"

wget -q -O - "https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc" | sudo apt-key add -

sudo apt-get -y update
sudo apt-get -y install \
    tor \
    deb.torproject.org-keyring \
    torbrowser-launcher
