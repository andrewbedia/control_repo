class profile::ssh_server {
	package {'openssh-server':
		ensure => present,
	}
	service { 'sshd':
		ensure => 'running',
		enable => 'true',
	}
	ssh_authorized_key { 'rocky@master.puppet.vm':
		ensure => present,
		user   => 'rocky',
		type   => 'ssh-ed25519',
		key    => 'AAAAC3NzaC1lZDI1NTE5AAAAIDkzabne0d1VtXT24rAIkdvteGBAOLSjKa4hKdKP6U+E',
	}  
}
