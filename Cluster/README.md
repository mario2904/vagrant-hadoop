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

### Web Interfaces

The plugin vagrant-hostmanager helps in configuring the private network and also automatically add the hostnames and ip addresses to the host's machine hosts file (/etc/hosts) and manage it smoothly, that way when you destroy the VM's it will also clear out the added entries in your hosts file.

- NameNode - [http://node1:50070](http://node1:50070)
- ResourceManager - [http://node1:8088](http://node1:8088)
- MapReduce JobHistory Server - [http://node1:19888](http://node1:19888)

### Important

If you **destroy** the VM's and then want to create them again, you must first delete the files:

* **configurations/masters**
* **configurations/slaves**

These files are generated during initial setup only.