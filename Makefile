all: install

install: install_base.sh docker-proxy config
	echo "#!/bin/bash" > install
	echo >> install
	echo 'PAYLOAD=$$(cat <<EOF' >> install
	tar cz docker-proxy config | uuencode -m - >> install
	echo "EOF" >> install
	echo ")" >> install
	echo >> install
	cat install_base.sh >> install
