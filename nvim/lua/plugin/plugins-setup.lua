local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return true
end
local packer_bootstrap = ensure_packer()

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
-- vim.cmd([[ 
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
--   augroup end
-- ]])
--
-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end


-- add list of plugins to install
return packer.startup(function(use)
  -- packer can manage itself
  use("wbthomason/packer.nvim")

  use({"neovim/nvim-lspconfig",
  requires = {
    "onsails/lspkind.nvim"
  },
  config = function()
    require("plugin/LspConfig")
  end
  })

  use({"simrat39/rust-tools.nvim",
  config = function()
    require("rust-tools").setup()
  end
  })



  use({"nvim-treesitter/nvim-treesitter",})

  use({"windwp/nvim-autopairs",
  config = function()
    require("nvim-autopairs").setup()
  end
})


  use({"hrsh7th/nvim-cmp",
  requires = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    'hrsh7th/cmp-nvim-lua',
    'octaltree/cmp-look',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-calc',
    'f3fora/cmp-spell',
    'hrsh7th/cmp-emoji',
    'L3MON4D3/LuaSnip'
    },
    config = function()
      require("plugin/Cmp")
    end
    })

  -- use({'tzachar/cmp-tabnine',
  -- run = './install.sh',
  -- requires = 'hrsh7th/nvim-cmp',
  -- config = function()
  --   require("plugin/Cmp")
  -- end
  -- })

  use("bluz71/vim-nightfly-colors") --colorscheme
  
  use({"alvan/vim-closetag"})

  use({"nvim-tree/nvim-tree.lua",
  requires = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup()
  end
  })
  use({
  "utilyre/barbecue.nvim",
  branch = "dev", -- omit this if you only want stable updates
  requires = {
    "neovim/nvim-lspconfig",
    "smiteshp/nvim-navic",
    "kyazdani42/nvim-web-devicons", -- optional dependency
  },
  after = "nvim-web-devicons", -- keep this if you're using NvChad
  config = function()
    require("barbecue").setup()
  end,
  })
  use({"numToStr/Comment.nvim", 
  config = function()
	  require("plugin/Comment")
  end
  })

  use({"nvim-telescope/telescope.nvim",
  requires = {
    "nvim-treesitter/nvim-treesitter",
    "sharkdp/fd",
    "nvim-lua/plenary.nvim"
  },
  config = function()
    require("telescope").setup()
  end
  })

  use("lukas-reineke/indent-blankline.nvim")

  use({"akinsho/bufferline.nvim", 
  requires = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("bufferline").setup()
  end
  })

  use({"nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup()
  end
  })

  use({"ap/vim-css-color"})

  use("glepnir/dashboard-nvim")

  if packer_bootstrap then
    require("packer").sync()
  end
end)
