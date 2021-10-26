
# ndt-client

Here is the client use to test either manually or automatically monitor.uac.bj

# Go Install
 - [Install golang correctly according to your platform](
    https://golang.org/doc/install
);

 - Verify the installation 
  ```bash
  go version
    
  go version go1.16.4 linux/amd64
  ```
  
# ndt7 Go client


## Installing

You need Go >= 1.12. We use modules. Make sure Go knows that:

```bash
export GO111MODULE=on
```

Clone the repository wherever you want with

```bash
git clone https://github.com/Abousidikou/ndt7-monitor.git && cd ndt7-monitor
```

Install ndt7-client
```bash
go get ./cmd/ndt7-client
```

Verify the installation 
```bash
ndt7-client -server monitor.uac.bj:4444

download in progress with monitor.uac.bj
Avg. speed  :    16.4 Mbit/s
download: complete
upload in progress with monitor.uac.bj
Avg. speed  :     5.9 Mbit/s
upload: complete
         Server: monitor.uac.bj
         Client: 41.85.179.160
        Latency:     2.9 ms
       Download:    16.4 Mbit/s
         Upload:     5.9 Mbit/s
 Retransmission:   10.22 %
```


# Setting automatic testing

- Start by making autoTest.sh executable
```bash
chmod +x autoTest.sh
```
- Install cron
    - Debian/Ubuntu 
    ```bash
    # apt-get update & apt-get -y upgrade
    # apt-get install cron
    ```
    - Fedora/CentOS
    ```bash
    # yum -y update
    # yum install vixie-cron
    ```
- Configure crontab
    ```bash
    crontab -e
    ```
    - Select your editor
    - Write on top replacing (path_to_autoTest.sh by the real path)
    ```bash
    PATH=/usr/bin:/bin:/home/path_to_autoTest.sh>
    ```
    - Write this on the bottom to execute test all 2 hours
    ```bash
    * */2 * * * autotest.sh >> log.file
    ```
- You can execute the test manually with:
```bash
./autoTest.sh
```
