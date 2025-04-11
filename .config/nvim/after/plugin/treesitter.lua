require("lazy").setup({{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { 
		  "vim", 
		  "vimdoc", 
		  "help",
		  "query", 
		  "bash",
		  "lua",
		  "html",
		  "markdown",
		  "javascript", 
		  "typescript",
		  "c",
		  "rust"
	  },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
 }})
