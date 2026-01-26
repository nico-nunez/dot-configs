return {
  {
    -- dir = "~/dev/nvim-plugins/remind-meh",
    -- name = "remind-meh",
    "nico-nunez/remind-meh.nvim",
    config = function()
      require("remind-meh").setup()
    end,
  }
}
