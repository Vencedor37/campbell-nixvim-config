{
  globals.mapleader = " ";
  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>Oil --float<CR>";
      options = {
        silent = true;
        desc = "Open FileTree";
      };
    }

    {
      mode = "n";
      key = "\\";
      action = "<C-W>s";
      options = {
        silent = true;
        desc = "Split window below";
      };
    }

    {
      mode = "n";
      key = "|";
      action = "<C-W>v";
      options = {
        silent = true;
        desc = "Split window right";
      };
    }
  ];
}
