{ config, lib, ...}:

{
	programs.git = {
		enable = true;
		userEmail =  "0xdopeduck@example.com";
		userName =  "0xdopeduck";
	};

}
