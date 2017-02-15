#!/usr/bin/env bash

HADOOP_VERSION=2.7.3
HADOOP_HOME=/usr/local/hadoop

# Install Java
# http://askubuntu.com/questions/190582/installing-java-automatically-with-silent-option
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
sudo apt-get install -y oracle-java8-installer

# Install Maven
sudo apt-get install -y maven

# Install Hadoop
wget --quiet "http://www-us.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz"
tar xfz "hadoop-$HADOOP_VERSION.tar.gz"
sudo mv "hadoop-$HADOOP_VERSION" "$HADOOP_HOME"
rm "hadoop-$HADOOP_VERSION.tar.gz"
sed -i "s/\${JAVA_HOME}/\/usr\/lib\/jvm\/java-8-oracle/" "$HADOOP_HOME/etc/hadoop/hadoop-env.sh"

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
