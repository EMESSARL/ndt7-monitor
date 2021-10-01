
> If you are using ndt7-client.exe to target specific M-Lab servers, please
contact support@measurementlab.net. These clients should be scheduled
randomly rather than synchronously to improve server & client measurements.
We are deploying changes to the ndt-server to require access tokens in the
near future.

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
