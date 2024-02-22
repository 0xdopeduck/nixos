{ config, lib, ...}:

{
	home.file = {
        #"wordlists/seclists".source = "${pkgs.seclists}/share/wordlists/seclists";
        ".commands.txt" = { text = ''
nmap -A -T4 -v -p               #Top 1000 ports TCP All scan
nmap -T4 -v -p-                 #All ports TCP open port scan
sudo nmap -v -sU                #Top 1000 ports UDP Scan
ffuf -ac -H "Host: FUZZ.        #VHOST Fuzzing
ffuf -ac                        #General Web Fuzzing CMD
                '';
                            executable = false;};
                            # Command to search and copy the above commands to clipboard
                            # cat .commands.txt | cut -d"#" -f1 | tr -d '\t\n' | xclip --selection clipboard

  };
	  home.shellAliases = {
		cmd = "cat $HOME/.commands.txt| fzf |cut -d'#' -f1 |  tr -d '\t\n' | xclip -i -selection clipboard";
	  };

}
