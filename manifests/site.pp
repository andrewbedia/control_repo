node default {
}
node 'puppet.home.pokemon-neogenesis.org' {
  include role::master_server
}

node /^web/ {
  include role::app_server
}

node /^db/ {
  include role::db_server
}
