game 'gta5'
fx_version 'bodacious'

lua54 'yes'
author 'MATTEO-SCRIPTS'
ui_page 'html/index.html'

files {
    'html/*.html',
    'html/js/*.js',
    'html/css/*.css',
}


shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}
client_scripts {
    'client/*.lua'
}


