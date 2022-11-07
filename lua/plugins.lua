local packer = require("packer")

packer.startup({
  function(use) 
    use ("wbthomason/packer.nvim")
    use("ful1e5/onedark.nvim")
    use ({ "nvim-tree/nvim-tree.lua", requires = {"nvim-tree/nvim-web-devicons"}})
    use({ "akinsho/bufferline.nvim", requires = { "nvim-tree/nvim-web-devicons", "moll/vim-bbye" }})
    use({ "nvim-lualine/lualine.nvim", requires = { "nvim-tree/nvim-web-devicons" } })
    use({ 'junegunn/fzf', run = './install --bin' })
    use { 'ibhagwan/fzf-lua', requires = { 'nvim-tree/nvim-web-devicons' }
}
  end,
  config = {
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end
    }
  }
})

-- 每次保存 plugins.lua 自动安装插件
pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
