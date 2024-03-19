{ pkgs, ... }: {
  # Telescope:
  plugins.telescope = {
    enable = true;
    extensions = {
      fzf-native = {
        enable = true;
        caseMode = "smart_case";
        fuzzy = true;
      };
    };
    defaults = {
      layout_config = {
        horizontal = {
          prompt_position = "top";
        };
      };
      sorting_strategy = "ascending";
    };
    extraOptions = {
      defaults = {
        vimgrep_arguments = [
          "${pkgs.ripgrep}/bin/rg"
          "--color=never"
          "--no-heading"
          "--with-filename"
          "--line-number"
          "--column"
          "--smart-case"
        ];
      };
    };
    keymaps = {
      "<leader>fg" = {
        action = "git_files";
        desc = "Telescope Git Files";
      };
      "<leader>ff" = {
        action = "find_files";
        desc = "Telescope Find Files";
      };
      "<leader>/" = {
        action = "live_grep";
        desc = "Telescope Live Grep";
      };
      "<leader><space>" = {
        action = "buffers";
        desc = "Telescope Buffers";
      };
    };
  };

  extraConfigLua = ''
    require "telescope".setup {
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
          },    
        },
      },
    }
  '';
}
