{ pkgs, ... }: {
  plugins.oil = {
    enable = false;
    viewOptions = { showHidden = true; };
  };
  plugins.neo-tree = {
    enable = true;
    filesystem.filteredItems.visible = true;
    window.position = "float";
  };
}
