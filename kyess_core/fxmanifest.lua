shared_script '@WaveShield/resource/waveshield.lua' --this line was automatically written by WaveShield

fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'rst'
version '1.0'

client_scripts {
    'config.lua',
    'client/esx_client.lua',
    'client/*.lua'
}
server_scripts {
    'config.lua',
    'server/esx_server.lua',
    'server/*.lua',
    '@oxmysql/lib/MySQL.lua'
}

files {
    'stream/fonts/*.gfx'
}

ui_page 'html/index.html'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
    '@es_extended/imports.lua'
}


server_exports {
    'GetEmployeCount',
    'DeleteCharacterIdentifier',
    "sendToDiscord"
}