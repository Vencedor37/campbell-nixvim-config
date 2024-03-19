{ pkgs, ... }: {
  #### Formatting
  plugins.conform-nvim = {
    enable = true;
    formatters = {
      codespell.command = "${pkgs.codespell}/bin/codespell";
      nixfmt.command = "${pkgs.nixfmt}/bin/nixfmt";
      php-codesniffer.command = "${pkgs.php82Packages.php-codesniffer}/bin/php-codesniffer";
      eslint_d.command = "${pkgs.nodePackages.eslint_d}/bin/eslint_d";
    };
    formattersByFt = {
      php = [ "php-codesniffer" ];
      nix = [ "nixfmt" ];
      "*" = [ "codespell" ];
    };

    extraOptions = {
      format_on_save = {
        __raw = ''
          function(bufnr)
            -- Disable with a global or buffer-local variable
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
              return
            end
            return { timeout_ms = 500, lsp_fallback = true }
          end
        '';
      };
    };
  };

  userCommands = {
    FormatDisable = {
      command = "lua _format_disable()<CR>";
      desc = "Disable autoformat-on-save";
      # bang = true;
    };
    FormatEnable = {
      command = "lua _format_enable()<CR>";
      desc = "Re-enable autoformat-on-save";
    };
    Format = {
      command =
        "lua require('conform').format({ timeout_ms = 500, lsp_fallback = true })<CR>";
      desc = "Autoformat this file";
    };
  };

  extraConfigLua = ''
    function _format_enable()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
    end

    function _format_disable() 
      --if v:operator == "!" then
        -- FormatDisable! will disable formatting just for this buffer
        --vim.b.disable_autoformat = true
      --else
        vim.g.disable_autoformat = true
      --end
    end

  '';
}
