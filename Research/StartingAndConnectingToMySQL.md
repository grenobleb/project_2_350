
# Steps to Start and Connect to MySQL
From [Doris Quick Start Guide](https://doris.apache.org/docs/gettingStarted/quick-start)

# Install JDK 8:
```
sudo apt-get install openjdk-8-jdk
```

# Configure FE:
```
cd apache-doris/fe/conf/
nano fe.conf
```

Inside the fe.conf file, add this at the very end of the file:
```
# Add JAVA_HOME and point it to your JDK8 runtime environment. Suppose your JDK8 is at /home/doris/jdk8, set it as follows:
JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/ (This points to the directory where JDK 8 is)

# The CIDR network segment of FE listening IP is empty by default. When started, Apache Doris will automatically select an available network segment. If you need to specify a segment, you can set priority_networks=192.168.0.0/24, for example.
# priority_networks =

# By default, FE metadata is stored in the doris-meta directory under DORIS_HOME. It is created already. You can change it to your specified path.
# meta_dir = ${DORIS_HOME}/doris-meta
```

# Configure BE:
```
cd apache-doris/be/conf/
nano be.conf
```

Inside the be.conf file, add this at the very end of the file:
```
# Add JAVA_HOME and point it to your JDK8 runtime environment. Suppose your JDK8 is at /home/doris/jdk8, set it as follows:
JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/ (This points to the directory where JDK 8 is)

# The CIDR network segment of BE listening IP is empty by default. When started, Doris will automatically select an available network segment. If you need to specify a segment, you can set priority_networks=192.168.0.0/24, for example.
# priority_networks =

# By default, BE data is stored in the storage directory under DORIS_HOME. It is created already. You can change it to your specified path.
# storage_root_path = ${DORIS_HOME}/storage
```

# Starting FE and BE (Front/Back end)

In the directory that contains apache-doris
```
./apache-doris/fe/bin/start_fe.sh --daemon
./apache-doris/be/bin/start_be.sh --daemon
```

When starting BE you may encounter suggestions link set vm.max_map_count to be 2000000
```
sudo sysctl -w vm.max_map_count=2000000
sudo swapoff -a
```

# Stopping FE and BE
```
./apache-doris/fe/bin/stop_fe.sh
./apache-doris/be/bin/stop_be.sh
```

