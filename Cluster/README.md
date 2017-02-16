# Cluster

The default configuration is to spin up 4 VM's  and setup their appropiate Hadoop configurations. Here is a table with more details of each VM:

| Name  | Hostname | IP Address     | Running Hadoop Daemons |
| ----- | -------- | -------------- | ---------------------- |
| node1 | node1    | 192.168.56.101 | NameNode               |
|       |          |                | SecondaryNameNode      |
|       |          |                | ResourceManager        |
|       |          |                | JobHistoryServer       |
| node2 | node2    | 192.168.56.102 | DataNode               |
|       |          |                | NodeManager            |
| node3 | node3    | 192.168.56.103 | DataNode               |
|       |          |                | NodeManager            |
| node4 | node4    | 192.168.56.104 | DataNode               |
|       |          |                | NodeManager            |

### Extra customization

You can make the following changes to the default customization. These changes need to be done before initial setup ```vagrant up```.

#### Adding more nodes

If your hardware can support it, you can add more **DataNodes** to the Cluster by editing the line **19**: ```nodes = 4```  of the Vagrantfile. The node **node1** will always be the NameNode.

### Web Interfaces

The plugin vagrant-hostmanager helps in configuring the private network and also automatically add the hostnames and ip addresses to the host's machine hosts file (/etc/hosts) and manage it smoothly. **For this reason you will be prompted for your password during initial setup.**

- NameNode - [http://node1:50070](http://node1:50070)
- ResourceManager - [http://node1:8088](http://node1:8088)
- MapReduce JobHistory Server - [http://node1:19888](http://node1:19888)

### Important

If you **destroy** the VM's and then want to create them again, you must first delete the files:

* **configurations/masters**
* **configurations/slaves**

These files are generated during initial setup only.