{ config, pkgs, ... }:

{

  home.packages = with pkgs;
  [

	#Network
  	nmap
	#proxychains
	sshuttle
	
	#Wordlist
	seclists

	#Web
	gobuster
	exploitdb
	ffuf
	feroxbuster

	#Windows
	kerbrute
	crackmapexec
	evil-winrm
	bloodhound
	bloodhound-py
	ldapdomaindump
	smbmap
	python3Packages.pypykatz
    	samba
    	smbmap
    	smbscan

	#password
	thc-hydra
	john
	#hashcat
	hash-identifier

	#C2
	metasploit

  ];

}
