function ColourMyPencils(colour)
  -- Diff higlighting
  vim.cmd [[
  highlight DiffAdd    guifg=#2ECC71 gui=bold
    highlight DiffDelete guifg=#D75A49 gui=bold
  ]]
  if colour == "rosepine" then
    -- Line number highlighting, specificly fits rosepine
    vim.cmd [[
          highlight LineNr guifg=#ff8800 gui=bold
          highlight CursorLineNr guifg=#ff8800 gui=bold
      ]]
    vim.cmd.colorscheme 'rose-pine-moon'
  elseif colour == "tokionight" then
    vim.cmd.colorscheme 'tokyonight-night'
  elseif colour == "onedark" then
    vim.cmd.colorscheme 'onedark'
  elseif colour == "catppuccin" then
    vim.cmd.colorscheme 'catppuccin'
  elseif colour == "oxocarbon" then
    vim.cmd.colorscheme 'oxocarbon'
  elseif colour == "everforest" then
    vim.cmd.colorscheme 'everforest'
  else
    -- Default
    vim.cmd.colorscheme 'rose-pine-moon'
  end
end

local rosepine = { -- You can easily change to a different colorscheme.
  -- Change the name of the colorscheme plugin below, and then
  -- change the command in the config to whatever the name of that colorscheme is.
  --
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  'rose-pine/neovim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('rose-pine').setup {
      disable_background = true,
      styles = {
        italic = false,
        bold = false,
      },
    }
    ColourMyPencils("rosepine")
  end,
}

local tokionight = {
  -- You can easily change to a different colorscheme.
  -- Change the name of the colorscheme plugin below, and then
  -- change the command in the config to whatever the name of that colorscheme is.
  --
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  'folke/tokyonight.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('tokyonight').setup {
      transparent = false,
      styles = {
        italic = false,
        bold = false,
      },
    }
  end,
}

local onedark = {
  'navarasu/onedark.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('onedark').setup {
      transparent = false,
      disable_background = false,
    }
  end,
}

local catppuccin = {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "frappe", -- or "latte", "frappe", "macchiato"
      transparent_background = true,
    })
  end,
}

local oxocarbon = {
  "nyoom-engineering/oxocarbon.nvim",
  lazy = false,
  priority = 1000,
  transparent_background = true,
}

local everforest = {
  "sainnhe/everforest",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.everforest_background = "soft" -- "soft" "medium", "hard"
    vim.g.everforest_transparent_background = true
  end,
}


return {
  rosepine,
  tokionight,
  onedark,
  catppuccin,
  oxocarbon,
  everforest,
}
