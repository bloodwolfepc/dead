# This overlay, when applied to nixpkgs, adds the final neovim derivation to nixpkgs.
{inputs}: final: prev:
with final.pkgs.lib; let
  pkgs = final;

  # Use this to create a plugin from a flake input
  mkNvimPlugin = src: pname:
    pkgs.vimUtils.buildVimPlugin {
      inherit pname src;
      version = src.lastModifiedDate;
    };

  # This is the helper function that builds the Neovim derivation.
  mkNeovim = pkgs.callPackage ./mkNeovim.nix {};

  # A plugin can either be a package or an attrset, such as
  # { plugin = <plugin>; # the package, e.g. pkgs.vimPlugins.nvim-cmp
  #   config = <config>; # String; a config that will be loaded with the plugin
  #   # Boolean; Whether to automatically load the plugin as a 'start' plugin,
  #   # or as an 'opt' plugin, that can be loaded with `:packadd!`
  #   optional = <true|false>; # Default: false
  #   ...
  # }
  all-plugins = with pkgs.vimPlugins; [
    #TODO alphabetise
    telescope-nvim
    telescope-fzf-native-nvim
    telescope-project-nvim
    telescope-media-files-nvim
    telescope-undo-nvim
    telescope-vim-bookmarks-nvim
    marks-nvim
    project-nvim

    yanky-nvim
    nvim-colorizer-lua
    indent-blankline-nvim
    vim-illuminate
    fidget-nvim #what if this was used for lrx?
    bufferline-nvim
    alpha-nvim

    undotree
    todo-comments-nvim
    vim-tmux-navigator
    vim-tmux-clipboard
    comment-nvim
    better-escape-nvim

    ChatGPT-nvim
    #package gp
    oil-nvim
    #vim-wakatime
    nvim-surround
    wilder-nvim

    neogit

    which-key-nvim
    lualine-nvim
    #cmp for clipboard?

    nvim-treesitter.withAllGrammars

    luasnip
    lspkind-nvim

    nvim-cmp
    cmp_luasnip
    cmp-nvim-lsp
    cmp-nvim-lsp-signature-help
    cmp-buffer
    cmp-emoji
    cmp-calc
    cmp-path
    cmp-nvim-lua
    cmp-cmdline
    cmp-cmdline-history

    friendly-snippets


    nvim-navic
    nvim-treesitter-context
    eyeliner-nvim
    nvim-treesitter-textobjects
    nvim-ts-context-commentstring
    #ts-autotag ?

    harpoon

    sqlite-lua
    plenary-nvim
    vim-repeat

    none-ls-nvim
    #flake8-vim

  ];

  extraPackages = with pkgs; [
    # language servers, etc.
    lua-language-server
    nil # nix LSP

    stylua
    pls
  ];
in {
  # This is the neovim derivation
  # returned by the overlay
  nvim-pkg = mkNeovim {
    plugins = all-plugins;
    inherit extraPackages;
  };

  # This can be symlinked in the devShell's shellHook
  nvim-luarc-json = final.mk-luarc-json {
    plugins = all-plugins;
  };

  # You can add as many derivations as you like.
  # Use `ignoreConfigRegexes` to filter out config
  # files you would not like to include.
  #
  # For example:
  #
  # nvim-pkg-no-telescope = mkNeovim {
  #   plugins = [];
  #   ignoreConfigRegexes = [
  #     "^plugin/telescope.lua"
  #     "^ftplugin/.*.lua"
  #   ];
  #   inherit extraPackages;
  # };
}
