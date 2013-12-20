Syslog Client for Windows
=========================
- testing on WinXP and Win7, with syslog-ng
- build exe using [ocra](https://github.com/larsch/ocra)

[![Travis-CI build status](https://travis-ci.org/shokai/syslog-client-for-windows.png)](https://travis-ci.org/shokai/syslog-client-for-windows)


Download
--------

- download [syslog-client.exe](https://github.com/shokai/syslog-client-for-windows/raw/master/syslog-client.exe)
- put into `C:/WINDOWS/system32/`


Use
---

    % syslog-client -help
    % syslog-client -host syslog.example.com hello world
    % syslog-client -host syslog.example.com hello world -tag WARN -pid 100


![cmd.exe](http://gyazo.com/f426d3b4cffe910292f776cb31c0d68c.png)


Build and Test
--------------

### Requirements

- Windows
- [RubyInstaller for Windows](http://rubyinstaller.org)
- [msysgit](https://code.google.com/p/msysgit)

### Clone this repository to your PC

    % git clone https://github.com/shokai/syslog-client-for-windows.git
    % cd syslog-client-for-windows

### Install Dependencies

    % gem install bundler
    % bundle install

### Test

    % rake test

### Build exe

    % rake build  ## windows only

=> syslog-client.exe


Contributing
------------
1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
