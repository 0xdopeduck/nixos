{ config, pkgs, ... }:

{

  home.packages = with pkgs;
  [

  	nmap
	gobuster
	seclists
	proxychains
	sshuttle
	exploitdb
	kerbrute
	crackmapexec
	ffuf
	feroxbuster
	evil-winrm
	bloodhound
	bloodhound-py
	ldapdomaindump
	smbmap


  ];

}
