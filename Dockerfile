FROM microsoft/windowsservercore

RUN Invoke-Webrequest https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-windows-amd64.zip -OutFile ngrok.zip
RUN Expand-Archive ngrok.zip
RUN .\ngrok\ngrok.exe authtoken 24j29QwwTIbkSh2Fl9aZK1DSl4L_62UxeBTAM1wVZLvWYaodY
RUN Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server'-name "fDenyTSConnections" -Value 0
RUN Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
RUN Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -name "UserAuthentication" -Value 1
RUN Set-LocalUser -Name "runneradmin" -Password (ConvertTo-SecureString -AsPlainText "P@ssw0rd!" -Force)
RUN .\ngrok\ngrok.exe tcp 3389
