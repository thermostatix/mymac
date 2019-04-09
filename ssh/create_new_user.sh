if [ -z "$1" ]
then
      echo "\$1 is empty"
else
      echo $1 
	if [ -z "$2" ]
	then
		sudo adduser $1 --disabled-password
		passwd $1
		usermod -aG sudo $1
	fi
	echo "mkdir .ssh
chmod 700 .ssh
touch .ssh/authorized_keys
chmod 600 .ssh/authorized_keys
echo \"Please paste public key for $1:
cat >> .ssh/authorized_keys" >> /home/$1/setup_ssh.sh

	sudo su - $1
fi

