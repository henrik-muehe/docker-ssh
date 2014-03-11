TMPDIR="/tmp/docker-ssh-l3jk2413"

# after http://www.linuxjournal.com/content/add-binary-payload-your-shell-scripts
function extract_payload()
{
	rm -rf $TMPDIR
	mkdir -p $TMPDIR
	echo "$PAYLOAD" | uudecode | tar -xzf - -C $TMPDIR
}

function cleanup()
{
	rm -rf $TMPDIR
}

# create directory and restrict permissions if it doesn't exist
mkdir ~/.ssh 2>/dev/null && chmod 700 ~/.ssh

# extract data
extract_payload

# check for previous install of this addon
touch ~/.ssh/config
if grep -q "\\.docker" ~/.ssh/config || grep -q "docker-proxy" ~/.ssh/config; then
	echo "Upgrading docker-ssh"
else
	echo "Installing docker-ssh"

	# install config
	cat $TMPDIR"/config" >> ~/.ssh/config
	chmod 600 ~/.ssh/config
fi

# upgrade/install proxy
cp $TMPDIR"/docker-proxy" ~/.ssh/
chmod 700 ~/.ssh/docker-proxy

# cleanup
cleanup

exit 0


PAYLOAD:
