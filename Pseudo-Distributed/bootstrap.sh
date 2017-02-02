#!/usr/bin/env bash

HADOOP_VERSION=2.7.3
HADOOP_HOME=/usr/local/hadoop
HADOOP_CONF_DIR=/usr/local/hadoop/etc/hadoop

# Install Java
# http://askubuntu.com/questions/190582/installing-java-automatically-with-silent-option
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
sudo apt-get install -y oracle-java8-installer

# Install Hadoop
wget --quiet "http://www-us.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz"
tar xfz "hadoop-$HADOOP_VERSION.tar.gz"
sudo mv "hadoop-$HADOOP_VERSION" "$HADOOP_HOME"
sed -i "s/\${JAVA_HOME}/\/usr\/lib\/jvm\/java-8-oracle/" "$HADOOP_HOME/etc/hadoop/hadoop-env.sh"
# Pseudo-Distributed Configuration
cp /vagrant/configurations/core-site.xml "$HADOOP_CONF_DIR/core-site.xml"
cp /vagrant/configurations/hdfs-site.xml "$HADOOP_CONF_DIR/hdfs-site.xml"
cp /vagrant/configurations/mapred-site.xml "$HADOOP_CONF_DIR/mapred-site.xml"
cp /vagrant/configurations/yarn-site.xml "$HADOOP_CONF_DIR/yarn-site.xml"

# ssh to localhost without a passphrase
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys

# Disable StrictHostKeyChecking
# Props: http://bencane.com/2013/07/22/ssh-disable-host-checking-for-scripts-automation/
sudo sed -i "s/#   StrictHostKeyChecking ask/StrictHostKeyChecking no/" /etc/ssh/ssh_config

# Set environmental variables
# http://unix.stackexchange.com/questions/77277/how-to-append-multiple-lines-to-a-file-with-bash
cat <<EOT >> ~/.bashrc
# Java Home
export JAVA_HOME=/usr/lib/jvm/java-8-oracle
# Set Hadoop-related environment variables
export HADOOP_HOME=/usr/local/hadoop
export HADOOP_INSTALL=\$HADOOP_HOME
export HADOOP_PREFIX=\$HADOOP_HOME
export HADOOP_MAPRED_HOME=\$HADOOP_HOME
export HADOOP_COMMON_HOME=\$HADOOP_HOME
export HADOOP_HDFS_HOME=\$HADOOP_HOME
export HADOOP_CONF_DIR=\$HADOOP_INSTALL/etc/hadoop
export YARN_HOME=\$HADOOP_HOME
export PATH=\$PATH:\$HADOOP_HOME/bin:\$HADOOP_HOME/sbin
EOT
source ~/.bashrc

# Set up File System
cd "$HADOOP_HOME"
# Format the filesystem
bin/hdfs namenode -format
# Start NameNode daemon and DataNode daemon
sbin/start-dfs.sh
# Start ResourceManager daemon and NodeManager daemon
sbin/start-yarn.sh
