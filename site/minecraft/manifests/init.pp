class minecraft (
  $url = 'https://launcher.mojang.com/v1/objects/e00c4052dac1d59a1188b2aa9d5a87113aaf1122/server.jar',
  $install_dir = '/opt/minecraft'
){
  file {$install_dir:
    ensure => directory,
  }
  file {"${install_dir}/minecraft_server.1.19.jar":
    ensure => file,
    source => $url,
    before => Service['minecraft'],
  }
  package {'java-17':
    ensure => preset,
  }
  file {"${install_dir}/eula.txt":
    ensure => file,
    content => 'eula=true',
  }
  file {'/etc/systemd/system/minecraft.service':
    ensure => file,
    content => epp('minecraft/minecraft.service',{
    install_dir => $install_dir,
    })
  }
  service {'minecraft':
    ensure => running,
    enable => true,
    require => [Package['java-17'],File["${install_dir}/eula.txt"],File['/etc/systemd/system/minecraft.service']],
  }
}
