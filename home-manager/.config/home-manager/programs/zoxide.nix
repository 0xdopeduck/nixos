{ config, lib, ...}:

{
	programs.zoxide = {
		enable = true;
		enableZshIntegration = true;
	};

}
