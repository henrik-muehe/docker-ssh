all: install

install: install_base.sh docker-proxy config
	cat install_base.sh > install
	tar cz docker-proxy config | uuencode - >> install
	