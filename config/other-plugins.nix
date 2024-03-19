{ pkgs, ... }: {
  plugins.comment-nvim.enable = true;
  plugins.gitsigns.enable = true;
  plugins.indent-blankline = {
    enable = true;
    exclude.filetypes = [
      "lspinfo"
      "checkhealth"
      "help"
      "man"
      "gitcommit"
      "TelescopePrompt"
      "TelescopeResults"
      "''"
      "startify"
      "toggleterm"
    ];
  };
  plugins.which-key.enable = true;
}
