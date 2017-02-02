#!/usr/bin/env bash

HADOOP_HOME=/usr/local/hadoop
HADOOP_CONF_DIR=/usr/local/hadoop/etc/hadoop

# These files will be dynamically created at the moment of creation of each node.
cp /vagrant/configurations/masters "$HADOOP_CONF_DIR/masters"
cp /vagrant/configurations/slaves "$HADOOP_CONF_DIR/slaves"

# Install sshpass
sudo apt-get install -y sshpass

# Copy the key to all the slaves. Enable password-less ssh from master to all slaves
# http://www.systutorials.com/1500/enabling-password-less-ssh-login/#password-based-.22password-less.22-ssh-login
while read slave; do
  sshpass -p 'vagrant' ssh-copy-id -i $HOME/.ssh/id_rsa.pub vagrant@${slave}
done </vagrant/configurations/slaves

# Set up File System
cd "$HADOOP_HOME"
# Format the filesystem
bin/hdfs namenode -format
# Start NameNode daemon and DataNode daemon
sbin/start-dfs.sh
# Start ResourceManager daemon and NodeManager daemon
sbin/start-yarn.sh
