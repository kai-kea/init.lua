vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

require 'options'
require 'remap'

require 'lazy-bootstrap'
require('lazy').setup 'plugins'
