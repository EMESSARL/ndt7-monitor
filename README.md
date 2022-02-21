
# ndt-client

Here is the client use to test either manually or automatically monitor.uac.bj and emes.bj

# Go Install
  Login to your Ubuntu system using ssh and upgrade to apply latest security updates there.
  ```bash
  sudo apt-get update  
  sudo apt-get -y upgrade  
  ```

  Now download the Go language binary archive file using following link. To find and download latest version available or 32 bit version go to official [download page](
      https://golang.org/dl/
  )
  ```bash
  wget https://dl.google.com/go/go1.16.4.linux-amd64.tar.gz   
  ```

  Now extract the downloaded archive and install it to the desired location on the system. For this tutorial, I am installing it under /usr/local directory.
  ```bash
  sudo tar -xvf go1.16.4.linux-amd64.tar.gz  
  sudo rm -r /usr/local/go
  sudo mv go /usr/local 
  ```
  
Now you need to setup Go language environment variables for your project. Commonly you need to set 3 environment variables as GOROOT, GOPATH and PATH.
Create go directory
```bash
mkdir ~/go
```
Edit ~/.bashrc file
```bash 
nano ~/.bashrc
```
Add this below at the end of file
```bash
export GOROOT=/usr/local/go 
export GOPATH=$HOME/go 
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH 
```
Refresh profile file to 
```bash
source ~/.bashrc
```

    
Verify the installation 
```bash
go version
```
Result
```bash
go version go1.16.4 linux/amd64
```

# QUIC-CLient

Before continue, install [QUIC-CLient](https://github.com/Abousidikou/quic-client) 
    
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
ndt7-client -server emes.bj:4444
quic-client -u monitor.uac.bj
quic-client -u  emes.bj
```

Result must be like this
```bash
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
 
QUIC Testing
Server :  173.249.45.104:4447
Msg Size:  262144
Nombre de stream:  30
Upload Testing
Upload Complete
Download Testing
Download Complete
Results:
         Avg. Download Speed:  12.992  Mbps
         Avg. Upload Speed: 5.245 Mbps
```

#  Having UDP-Receive-Buffer-Size Problem
Experiments have shown that QUIC transfers on high-bandwidth connections can be limited by the size of the UDP receive buffer.This buffer holds packets that have been received by the kernel, but not yet read by the application (quic-go in this case). Once this buffer fills up, the kernel will drop any new incoming packet. Unfortunately, on Linux this value is rather small, too small for high-bandwidth QUIC transfers. See (UDP Receive Buffer)[https://github.com/lucas-clemente/quic-go/wiki/UDP-Receive-Buffer-Size]
```bash
sysctl -w net.core.rmem_max=2500000
```
# Setting automatic testing

- Start by making autoTest.sh executable
```bash
chmod +x autoTest.sh
cp autoTest.sh ~/go/bin
```
- Install cron
    - Debian/Ubuntu 
    ```bash
    apt-get update & apt-get -y upgrade
    apt-get install cron
    ```
    - Fedora/CentOS
    ```bash
    yum -y update
    yum install vixie-cron
    ```
- Configure crontab
```bash
crontab -e
```
- Select your editor
- Write this on top of the file by replacing "username" by your username
```bash
PATH=/usr/bin:/bin:/home/username/go/bin
```
- Write this on the bottom to execute test every 10mn. DON'T FORGET ADDING A NEW LINE AT THE END
```bash
10 * * * * autoTest.sh >> /home/username/go/logTest.file
```
    
