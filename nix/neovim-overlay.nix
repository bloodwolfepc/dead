{ inputs }: final: prev:
with final.pkgs.lib; let
  pkgs = final;

  mkNvimPlugin = src: pname:
    pkgs.vimUtils.buildVimPlugin {
      inherit pname src;
      version = src.lastModifiedDate;
    };
  mkNeovim = pkgs.callPackage ./mkNeovim.nix

  all-plugins = with pkgs.vimPlugins; [ 
    lualine-nvim
    telescope-nvim
  ];

  extraPackages = with pkgs; [
    lua-language-server
    nil
    ripgrep
  ];
in {
  nvim-pkg = mkNeovim {
    plugins = all-plugins;
    inherit extraPackages;
  };

  nvim-luarc-json = final.mk-luarc-json {
    plugins = all-plugins;
  };
}
