Syslog Client for Windows
=========================

## Download

[syslog-client.exe](https://github.com/shokai/syslog-client-for-windows/raw/master/syslog-client.exe)

put into C:/WINDOWS/system32/


## Use

    % syslog-client -help
    % syslog-client -host syslog.example.com hello world
    % syslog-client -hostsyslog.example.com -tag WARN -pid 100 hello world
