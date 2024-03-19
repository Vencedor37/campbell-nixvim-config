{
  plugins.lsp = {
    enable = true;
    servers.phpactor.enable = true;
    servers.nil_ls.enable = true;
    servers.tsserver.enable = true;
    servers.cssls.enable = true;
    servers.html.enable = true;

    keymaps = {
      silent = true;
      diagnostic = {
        "<leader>cd" = {
          action = "open_float";
          desc = "Line Diagnostics";
        };
        "[d" = {
          action = "goto_next";
          desc = "Next Diagnostic";
        };
        "]d" = {
          action = "goto_prev";
          desc = "Previous Diagnostic";
        };
      };
      lspBuf = {
        "K" = "hover";
        "<C-k>" = "signature_help";
        "gr" = "references";
        "gd" = "definition";
        "gi" = "implementation";
        "<leader>la" = "code_action";
        "<leader>lr" = "rename";
      };
    };
  };
}
