docker-ssh
==========

Allows connecting to all your local docker containers using ssh simply like this:

	ssh container-name.docker

if `container-name` is the name of the container and ssh is running in it. **Automatically install for the current user** using

	curl -s https://raw.github.com/henrik-muehe/docker-ssh/master/install | /bin/bash

you need `nc`, `uudecode` and `curl` for the installer to work, only `nc` if you install manually.