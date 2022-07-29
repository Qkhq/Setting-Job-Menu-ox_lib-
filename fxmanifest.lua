fx_version 'adamant'
author 'Fancy'
game { 'gta5' }

shared_scripts {
  'config.lua'
}

server_scripts {
   '@oxmysql/lib/MySQL.lua',
   'server.lua'
}

dependency {
  'ox_inventory',
  'oxmysql'
}
