{
  colorschemes.catppuccin = {
    enable = true;
  };

  plugins.treesitter = {
    enable = true;
    ensureInstalled = [ "php" "css" "html" "typescript" "nix" ];
    indent = true;
  };
  plugins.lualine = {
    enable = true;
    globalstatus = true;
    sections = {
      lualine_a = [ "mode" ];
      lualine_b = [
        "branch"
        {
          name = "diff";
          extraConfig = {
            symbols = {
              added = " ";
              modified = " ";
              removed = " ";
            };
          };
        }
      ];
      lualine_c = [
        "filetype"
        {
          name = {
            __raw = ''
              function()
                local msg = "No Active Lsp"
                local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
                local clients = vim.lsp.get_active_clients()
                if next(clients) == nil then
                  return msg
                end
                for _, client in ipairs(clients) do
                  local filetypes = client.config.filetypes
                  if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                    return client.name
                  end
                end
                return msg
              end'';
          };
        }
      ];
      lualine_z = [
        "hostname"
        {
          icon = "";
          name = "os.date('%R')";
        }
      ];
    };
    componentSeparators = {
      left = "";
      right = "";
    };
    sectionSeparators = {
      left = "";
      right = "";
    };
  };
}
