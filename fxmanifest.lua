fx_version 'cerulean'
game 'gta5'

author 'THUNDER'
description 'Car Repair Script'
version '1.0.0'

lua54 'yes'

shared_script {
	'@es_extended/imports.lua',
	'config.lua',
	'@ox_lib/init.lua',
}

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

dependencies {
    'es_extended'
}
