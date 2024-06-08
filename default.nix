inputs: { lib, config, pkgs, ... }: 
let
  inherit (inputs) stylix neovim;
  inherit (lib) mkIf mkEnableOption;

  cfg = config.targets.danknil.neovim;
  
  stylixColorscheme = with config.lib.stylix.colors; ''{
    base00 = ${base00},
    base01 = ${base01},
    base02 = ${base02},
    base03 = ${base03},
    base04 = ${base04},
    base05 = ${base05},
    base06 = ${base06},
    base07 = ${base07},
    base08 = ${base08},
    base09 = ${base09},
    base0A = ${base0A},
    base0B = ${base0B},
    base0C = ${base0C},
    base0D = ${base0D},
    base0E = ${base0E},
    base0F = ${base0F},
  }'';
in
{
  options.targets.danknil.neovim = {
    enable = mkEnableOption "Custom danknil neovim config";
  };

  config = mkIf cfg.enable {
    home.sessionVariables = {
      EDITOR = "nvim";
    };

    # disable auto styling from stylix
    stylix.targets.vim.enable = false;

    programs.neovim = {
      enable = true;
      vimAlias = true;
      vimdiffAlias = true;
      withNodeJs = true;

      # nightly neovim
      package = neovim.packages.${pkgs.system}.default;

      extraLuaConfig = ''
        -- theming
        _G.colorscheme = ${stylixColorscheme}

        -- setting up vanilla settings
        require 'autocmds'
        require 'options'

        -- installing lazy.nvim
        require("lazy").setup({
          spec = {
            { imports = "plugins" },
          },
          performance = {
            reset_packpath = false,
            rtp = {
                reset = false,
              }
            },
          dev = {
            path = "${pkgs.vimUtils.packDir config.home-manager.users.USERNAME.programs.neovim.finalPackage.passthru.packpathDirs}/pack/myNeovimPackages/start",
            patterns = { "folke" },
          },
          install = {
            -- Safeguard in case we forget to install a plugin with Nix
            missing = false,
          },
        })

        -- setting up vanilla binds
        require('mappings'):load_mappings('general', { noremap = true })
      '';
    };

    xdg.configFile."nvim/lua" = {
      recursive = true;
      source = ./lua;
    };

    xdg.configFile."nvim/after" = {
      recursive = true;
      source = ./after;
    };

    xdg.configFile."nvim/query" = {
      recursive = true;
      source = ./query;
    };
  };
}
