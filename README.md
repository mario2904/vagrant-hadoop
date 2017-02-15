# vagrant-hadoop

This project is geared towards people starting to learn about [Hadoop](http://hadoop.apache.org/). It creates a basic Hadoop environment in Ubuntu 14.04 VM's in either Standalone, Pseudo-Distributed or Cluster mode.

## Requirements

* [VirtualBox](https://www.virtualbox.org/)
* [Vagrant](https://www.vagrantup.com/)
  * Plugin - [vagrant-hostmanager](https://github.com/devopsgroup-io/vagrant-hostmanager)

## Setup

Clone this repository and go to the project root directory:

```bash
git clone https://github.com/mario2904/vagrant-hadoop.git && cd vagrant-hadoop
```

Change to the directory of the Hadoop Installation you want.

\<hadoop-installation\> = Standalone | Pseudo-Distributed | Cluster

```bash
cd <hadoop-installation>
```

Then just run the following command and vagrant will spin up 1 or more VM's and take care of all the Hadoop setup installation.

```bash
vagrant up
```

## Usage

Once you're in the correct directory that has it's own Vagrantfile, you can run the following commands to manage your VM's through the command line.

### Access

You can access the VM remotely by running the command:

```bash
vagrant ssh
```

or in the case of a Cluster setup:

```bash
vagrant ssh <node>
```

### Shutdown

You can shut down your VM's by running the command:

```bash
vagrant halt
```

### Destroy

You can destroy your VM's by running the command:

```bash
vagrant destroy
```



*** If you prefer a more Graphical User Interface for managing all your vagrant vm's then check out [Vagrant Manager](http://vagrantmanager.com/). 

## Configurations

Click one of the following to see their respective configurations in more detail:

* [Standalone](https://github.com/mario2904/vagrant-hadoop/tree/master/Standalone)
* [Pseudo-Distributed](https://github.com/mario2904/vagrant-hadoop/tree/master/Pseudo-Distributed)
* [Cluster](https://github.com/mario2904/vagrant-hadoop/tree/master/Cluster)

*** For extra configurations you can consult the Vagrant documentation [here](https://www.vagrantup.com/docs/).

