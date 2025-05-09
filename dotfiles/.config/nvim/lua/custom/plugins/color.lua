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
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

      vim.cmd.colorscheme 'rose-pine-moon'
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

      vim.cmd.colorscheme 'tokyonight-moon'
    end,
}

local onedark = {
    'navarasu/onedark.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('onedark').setup {
	      transparent = true,
        disable_background = false,
      }

      vim.cmd.colorscheme 'onedark'
    end,
}

local catppuccin = {
  "catppuccin/nvim",
  name = "catppuccin",
  disable_background = false,
  transparent_background = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme = 'catppuccin'
  end
}

return{
  rosepine
}
