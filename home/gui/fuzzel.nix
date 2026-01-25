{ pkgs, styling, ... }: # <-- Принимаем myTheme

{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = styling.font.family;
        prompt = "\"> \"";
        layer = "overlay";
        width = 40;
      };
    };
  };
}
