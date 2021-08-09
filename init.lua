-- setup global user namespace
_G.my = {}

-- load basic editor configuration
require('config/editor').setup{}

-- setup plugins
require('config/plugins').setup{}

-- setup theme
require('config/theme').setup{}
