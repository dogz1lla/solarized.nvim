local Colorscheme = require 'solarized.src.colorscheme'
local Config = require 'solarized.src.config'
local colors = require 'solarized.src.colors'
local vim_theme = require 'solarized.src.themes.vim'
local neovim_theme = require 'solarized.src.themes.neovim'
local vscode_theme = require 'solarized.src.themes.vscode'
local utils = require 'solarized.src.utils'

local config = Config:new {}
local solarized = Colorscheme:new({}, config)

function solarized.setup(user_config)
  if vim.g.colors_name then
    vim.cmd 'hi clear'
  end

  if vim.fn.exists 'syntax_on' then
    vim.cmd 'syntax reset'
  end

  vim.g.colors_name = 'solarized'

  if user_config then
    solarized.config:set_mode(user_config.mode)
    solarized.config:set_theme(user_config.theme)
    solarized.config:set_transparent(user_config.transparent)
    solarized.config:set_comments_style(user_config.comments)
    solarized.config:set_keywords_style(user_config.keywords)
    solarized.config:set_functions_style(user_config.functions)
  end

  solarized:set_colors(colors.dark, colors.light)
  solarized:set_highlights(vim_theme, neovim_theme, vscode_theme)

  local highlight_groups = solarized:get_highlights()

  utils.set_highlights(highlight_groups)
end

return solarized
