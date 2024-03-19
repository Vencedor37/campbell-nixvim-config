{pkgs, ...}: {
  extraPlugins = [(pkgs.vimUtils.buildVimPlugin {
      name = "phpactor";
      src = pkgs.fetchFromGitHub {
          owner = "gbprod";
          repo = "phpactor.nvim";
          rev = "8bb5f0e290b7da7d778e5f7841e1d56e58c4a49e";
          hash = "sha256-qdvxgykuckLeZtnau3REE0qJ5JpRfV0y6xujZIJdqA4=";
      };
  })];

  extraConfigLua = ''
    require("phpactor").setup()
  '';

}
