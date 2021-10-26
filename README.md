
# ndt-client

Here is the client use to test either manually or automatically monitor.uac.bj

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
Edit ~/.profile file
```bash 
nano ~/.profile
```
Add this below at the end of file
```bash
export GOROOT=/usr/local/go 
export GOPATH=$HOME/go 
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH 
```
Refresh profile file to 
```bash
source ~/.profile
```

    
Verify the installation 
```bash
go version
```
Result
```bash
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
```
Result
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
```

# Setting automatic testing

- Start by making autoTest.sh executable
```bash
chmod +x autoTest.sh
cp autoTest.sh ~/go
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
- Write this on top of the file
```bash
PATH=/usr/bin:/bin:/home/go/autoTest.sh
```
- Write this on the bottom to execute test all 2 hours and DON'T FORGET ADDING A NEW LINE AT THE END
```bash
0 */2 * * * autotest.sh >> log.file
```
    
