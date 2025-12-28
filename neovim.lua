local function has_catppuccin_in_user_plugins()
  local plugins_dir = vim.fn.expand("~/.config/nvim/lua/plugins")
  if vim.fn.isdirectory(plugins_dir) ~= 1 then
    return false
  end
  local plugin_files = vim.fn.glob(plugins_dir .. "/**/*.lua", true, true)
  for _, file in ipairs(plugin_files) do
    local ok, lines = pcall(vim.fn.readfile, file)
    if ok then
      for _, line in ipairs(lines) do
        if line:find("catppuccin/nvim", 1, true) then
          return true
        end
      end
    end
  end
  return false
end

if has_catppuccin_in_user_plugins() then
  return {
    {
      "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000,
      opts = {
        flavour = "frappe",
        color_overrides = {
          frappe = {
            rosewater = "#f2d5cf",
            flamingo = "#eebebe",
            pink = "#f4b8e4",
            mauve = "#ca9ee6",
            red = "#e78284",
            maroon = "#ea999c",
            peach = "#ef9f76",
            yellow = "#e5c890",
            green = "#a6d189",
            teal = "#81c8be",
            sky = "#99d1db",
            sapphire = "#85c1dc",
            blue = "#8caaee",
            lavender = "#babbf1",
            text = "#c6d0f5",
            subtext1 = "#b5bfe2",
            subtext0 = "#a5adce",
            overlay2 = "#949cbb",
            overlay1 = "#838ba7",
            overlay0 = "#737994",
            surface2 = "#626880",
            surface1 = "#51576d",
            surface0 = "#414559",
            base = "#303446",
            mantle = "#292c3c",
            crust = "#232634",
          },
        },
      },
      config = function(_, opts)
        require("catppuccin").setup(opts)
        vim.cmd.colorscheme("catppuccin")
      end,
    },
    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "catppuccin",
      },
    },
  }
end

return {
  {
    "bjarneo/aether.nvim",
    name = "aether",
    priority = 1000,
    opts = {
      disable_italics = false,
      colors = {
        -- Monotone shades (base00-base07)
        base00 = "#222222", -- Default background
        base01 = "#666666", -- Lighter background (status bars)
        base02 = "#e5c47b", -- Selection background
        base03 = "#666666", -- Comments, invisibles
        base04 = "#c2c2b0", -- Dark foreground
        base05 = "#c2c2b0", -- Default foreground
        base06 = "#d7c483", -- Light foreground
        base07 = "#ffffff", -- Light background

        -- Accent colors (base08-base0F)
        base08 = "#b96f6f", -- Variables, errors, red
        base09 = "#685742", -- Integers, constants, orange
        base0A = "#b36d43", -- Classes, types, yellow
        base0B = "#5f875f", -- Strings, green
        base0C = "#c9a554", -- Support, regex, cyan
        base0D = "#78824b", -- Functions, keywords, blue
        base0E = "#bb7744", -- Keywords, storage, magenta
        base0F = "#b36d43", -- Deprecated, brown/yellow
      },
    },
    config = function(_, opts)
      require("aether").setup(opts)
      vim.cmd.colorscheme("aether")

      -- Enable hot reload
      require("aether.hotreload").setup()
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "aether",
    },
  },
}
