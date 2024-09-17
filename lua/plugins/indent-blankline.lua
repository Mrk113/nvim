return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufReadPre" },
  main = "ibl",
  config = function()
    require("ibl").setup({
      indent = { char = "│" },
      scope = { char = "│", highlight = "Comment" },
    })
  end,
}
