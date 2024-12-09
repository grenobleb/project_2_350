
# Starting FE and BE (Front/Back end)
From [Doris Quick Start Guide](https://doris.apache.org/docs/gettingStarted/quick-start)

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

