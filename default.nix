inputs: { lib, config, ... }: 
let
  inherit (inputs) stylix neovim;
  inherit (lib) mkIf mkEnableOption;

  cfg = config.targets.danknil.neovim;
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
