{ self, pkgs, ... }: {
  config = {
    options = {
      number = true;
      relativenumber = true;
      cursorline = true;
      expandtab = true;
      formatoptions = "jcroqlnt";
      formatexpr = "v:lua.require'conform'.formatexpr()";
      grepformat = "%f:%l:%c:%m";
      grepprg = "rg --vimgrep";
      ignorecase = true;
      inccommand = "nosplit";
      laststatus = 0;
      list = true;
      mouse = "a";
      pumblend = 10;
      pumheight = 10;
      scrolloff = 4;
      sessionoptions = [ "buffers" "curdir" "tabpages" "winsize" ];
      shiftround = true;
      shiftwidth = 2;
      showmode = false;
      sidescrolloff = 8;
      signcolumn = "yes";
      smartcase = true;
      smartindent = true;
      autoindent = true;
      spelllang = [ "en" ];
      splitbelow = true;
      splitright = true;
      tabstop = 2;
      termguicolors = true;
      timeoutlen = 300;
      undofile = true;
      undolevels = 10000;
      updatetime = 200;
      wildmode = "longest:full,full";
      winminwidth = 5;
      wrap = false;

    };
    luaLoader.enable = true;
  };
  imports = [
    ./ui.nix
    ./keymaps.nix
    ./lsp.nix
    ./navigation.nix
    ./telescope.nix
    ./completion.nix
    ./other-plugins.nix
    ./autocmds.nix
    ./formatting.nix
    ./nvim-surround.nix
    ./mini.nix
  ];
}
