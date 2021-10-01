
# ndt-client

Here is the client use to test either manually or automatically monitor.uac.bj

# Go Install
 - [Install golang correctly according to your platform](
    https://golang.org/doc/install
);

# ndt7 Go client


## Installing

You need Go >= 1.12. We use modules. Make sure Go knows that:

```bash
export GO111MODULE=on
```

Clone the repository wherever you want with

```bash
git clone https://github.com/Abousidikou/ndt7-monitor.git
```

From inside the repository, use `go get ./cmd/ndt7-client` to
build the client. Binaries will be placed in `$GOPATH/bin`, if
`GOPATH` is set, and in `$HOME/go/bin` otherwise.

If you're into a one-off install, this

```bash
go get -v https://github.com/Abousidikou/ndt7-monitor.git
```

is equivalent to cloning the repository, running `go get ./cmd/ndt7-client`,
and then cancelling the repository directory.

# Installation verification
- Type
```bash
ndt7-client -v
```
The result must be:
```bash
flag provided but not defined: -v
Usage of ndt7-client:
  -anonymize.ip value
    	Valid values are "none" and "netblock". (default none)
  -batch
    	emit JSON events on stdout (DEPRECATED, please use -format=json)
  -download
    	perform download measurement (default true)
  -format value
    	output format to use: 'human' or 'json' for batch processing (default human)
  -locate.url value
    	The base url for the Locate API (default https://locate.measurementlab.net/v2/nearest/)
  -no-verify
    	skip TLS certificate verification
  -profile string
    	file where to store pprof profile (see https://blog.golang.org/pprof)
  -quiet
    	emit summary and errors only
  -scheme value
    	WebSocket scheme to use: either "wss" or "ws" (default wss)
  -server string
    	optional ndt7 server hostname
  -service-url value
    	Service URL specifies target hostname and other URL fields like access token. Overrides -server.
  -timeout duration
    	time after which the test is aborted (default 55s)
  -upload
    	perform upload measurement (default true)
```
- If the result for your command ``` ndt7-client -v ``` is the one above, you can skip this phase

  Go insallation without exporting path  can cause ndt7-client not be seen. 
- Reinstalling go 
  - Download the Go language binary archive file using following link. To find and download latest version available or 32 bit version go to official download page.
  ```bash
  wget https://dl.google.com/go/go1.16.4.linux-amd64.tar.gz
  ``` 
  - Now extract the downloaded archive and install it to the desired location on the system. Let's install it under /usr/local directory. You can also put this under the home directory (for shared hosting) or other location.
  ```bash
  sudo tar -xvf go1.16.4.linux-amd64.tar.gz   
  sudo mv go /usr/local  
  ```
  - Export GOROOT (GOROOT is the location where Go package is installed on your system)
  ```bash
  export GOROOT=/usr/local/go
  ```
  - Export GOPATH (GOPATH is the location of your work directory. For example my project directory is ~/Projects)
  ```bash
  export GOPATH=$HOME/Projects
  ```
  - Set PATH (to access go binary system wide)
  ```bash
  export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
  ```
  - All the above environment will be set for your current session only. To make it permanent add above commands in ~/.profile file
  ```bash
  nano ~/.profile
  ```
  Add this at the end of ~/.profile
  ```bash
  export GOROOT=/usr/local/go
  export GOPATH=$HOME/Projects
  export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
  ```
  - Update it
  ```bash
  source ~/.profile
  ```
  - Verify the installation 
  ```bash
  go version
    
  go version go1.16.4 linux/amd64
  ```
  - Now retry ``` ndt7-client -v ```

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
