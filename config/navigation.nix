{ pkgs, ... }: {
  plugins.oil = {
    enable = true;
    viewOptions = { showHidden = true; };
  };
  plugins.neo-tree = {
    enable = false;
    filesystem.filteredItems.visible = true;
    window.position = "float";
  };
}
