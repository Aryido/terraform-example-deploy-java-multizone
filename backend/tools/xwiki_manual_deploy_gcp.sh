#! /bin/bash

Install(){
	echo "-----Configuring apt-get-----"
	sudo wget https://maven.xwiki.org/xwiki-keyring.gpg -O /usr/share/keyrings/xwiki-keyring.gpg
	sudo wget "https://maven.xwiki.org/stable/xwiki-stable.list" -O /etc/apt/sources.list.d/xwiki-stable.list
	sudo apt-get update

	echo "-----Installing Network Tools-----"
	sudo apt-get install net-tools nfs-common -y

	echo "-----Installing MySQL-----"
	sudo apt-get -y install mysql-client-core-8.0

	echo "-----Installing XWiki-----"
  sudo wget https://maven.xwiki.org/releases/org/xwiki/platform/xwiki-platform-distribution-debian-tomcat9-common/14.10.4/xwiki-platform-distribution-debian-tomcat9-common-14.10.4.deb
  sudo wget https://maven.xwiki.org/releases/org/xwiki/platform/xwiki-platform-distribution-debian-common/14.10.4/xwiki-platform-distribution-debian-common-14.10.4.deb
  sudo apt-get install -y -f ./xwiki-platform-distribution-debian-common-14.10.4.deb
  sudo apt-get install -y -f ./xwiki-platform-distribution-debian-tomcat9-common-14.10.4.deb

}

#############
### Main ####
#############

cloud-init status -w
Install
sudo cp /tmp/tcp_gcp.xml /usr/lib/xwiki/WEB-INF/observation/remote/jgroups/tcp.xml
sudo cp /tmp/hibernate_gcp.cfg.xml /etc/xwiki/hibernate.cfg.xml
sudo cp /tmp/xwiki_startup.sh /home/xwiki_startup.sh