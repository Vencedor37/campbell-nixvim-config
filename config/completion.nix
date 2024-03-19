{
  # Completion
  plugins.nvim-cmp = {
    enable = true;
    snippet.expand = "luasnip";
    completion = { completeopt = "menu,menuone"; };
    sources = [
      { name = "nvim_lsp"; }
      { name = "luasnip"; }
      { name = "buffer"; }
      { name = "nvim_lua"; }
      { name = "path"; }
    ];
    preselect =
      "None"; # Don't preselect to avoid tabs completing things prematurely
    mappingPresets = [ "insert" ];
    mapping = {
      "<Tab>" = "cmp.mapping.confirm({ select = true })";
      "<C-Space>" = "cmp.mapping.complete()";
      "<C-j>" = "cmp.mapping.select_next_item()";
      "<C-k>" = "cmp.mapping.select_prev_item()";
    };
  };

  plugins.luasnip.enable = true;
  plugins.cmp_luasnip.enable = true;
  plugins.cmp-buffer.enable = true;
  plugins.cmp-path.enable = true;
  plugins.cmp-nvim-lua.enable = true;
  plugins.cmp-nvim-lsp.enable = true;
  plugins.cmp-nvim-lsp-document-symbol.enable = true;
  plugins.cmp-nvim-lsp-signature-help.enable = true;
  plugins.nvim-autopairs.enable = true;
}
