{ self, pkgs, ... }: {
  config = {
    options = {
      updatetime = 50; # faster completion (4000ms default)

      # Change cursor options
      guicursor = [
        "n-v-c:block" # Normal, visual, command-line: block cursor
        "i-ci-ve:block" # Insert, command-line insert, visual-exclude: vertical bar cursor with block cursor, use "ver25" for 25% width
        "r-cr:hor20" # Replace, command-line replace: horizontal bar cursor with 20% height
        "o:hor50" # Operator-pending: horizontal bar cursor with 50% height
        "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor" # All modes: blinking settings
        "sm:block-blinkwait175-blinkoff150-blinkon175" # Showmatch: block cursor with specific blinking settings
      ];

      # Set fold settings
      # These options were reccommended by nvim-ufo
      # See: https://github.com/kevinhwang91/nvim-ufo#minimal-configuration
      foldcolumn = "0";
      foldlevel = 99;
      foldlevelstart = 99;
      foldenable = true;


      # Set completeopt to have a better completion experience
      completeopt = ["menuone" "noselect" "noinsert"]; # mostly just for cmp

      number = true;
      relativenumber = true;
      cursorline = true;

      # set tabs to 2 spaces
      tabstop = 2;
      expandtab = true;

      # Enable incremental searching
      hlsearch = true;
      incsearch = true;


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

      # Better splitting
      splitbelow = true;
      splitright = true;
      termguicolors = true;
      timeoutlen = 300;

      # Enable persistent undo history
      undofile = true;
      undolevels = 10000;
      swapfile = false;
      backup = false;

      wildmode = "longest:full,full";
      winminwidth = 5;
      wrap = false;

    };
    luaLoader.enable = true;
  };
  imports = [
    ./bufferline.nix
    ./ui.nix
    ./keymaps.nix
    ./lsp.nix
    ./navigation.nix
    ./telescope.nix
    ./completion.nix
    ./other-plugins.nix
    ./autocmds.nix
    #./formatting.nix
    ./nvim-surround.nix
    ./mini.nix
    ./phpactor.nix
  ];
}
