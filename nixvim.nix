{ pkgs, ... }:

{
  programs.nixvim = {
    enable = true;

    viAlias = true;
    vimAlias = true;

    opts = {
      number = true;
      relativenumber = true;

      tabstop = 4;
      shiftwidth = 4;
      expandtab = true;

      smartindent = true;

      wrap = false;

      termguicolors = true;

      ignorecase = true;
      smartcase = true;

      cursorline = true;

      scrolloff = 8;
    };

    globals.mapleader = " ";

    keymaps = [
      {
        key = "<leader>w";
        action = "<cmd>w<cr>";
        mode = "n";
        options.desc = "Save";
      }

      {
        key = "<leader>q";
        action = "<cmd>q<cr>";
        mode = "n";
        options.desc = "Quit";
      }
    ];
  };
}
