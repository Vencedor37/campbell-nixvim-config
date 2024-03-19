{
  autoGroups = { YankHighlight = { clear = true; }; };
  autoCmd = [{
    event = [ "TextYankPost" ];
    callback = { __raw = "function () vim.highlight.on_yank() end"; };
    group = "YankHighlight";
  }];
}
