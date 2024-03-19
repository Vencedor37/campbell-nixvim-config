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
  extraConfigLua = ''
    local _border = "rounded"

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = _border
      }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help, {
        border = _border
      }
    )

    vim.diagnostic.config{
      float={border=_border}
    };

    require('lspconfig.ui.windows').default_options = {
      border = _border
    }

    require'lspconfig'.phpactor.setup{}
  '';
}
