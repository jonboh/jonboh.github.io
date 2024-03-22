---
title: "Take your formatters anywhere"
date: 2024-03-22
---
Did you know that you can take your formatters along wherever
you install or use your `neovim` editor by configuring it with [`nixvim`](https://github.com/nix-community/nixvim)?

It's really simple actually, you just need to refer to the formatter package
in your configuration and Nix will make sure that the formatters are installed.
```nix
{pkgs, ...}: {
  plugins.conform-nvim = {
    enable = true;
    formattersByFt = {
      nix = ["alejandra"];
      rust = ["rustfmt"];
      python = ["isort" "ruff_format"];
      json = ["jq"];
      toml = ["taplo"];
      yaml = ["yamlfmt"];
      lua = ["stylua"];
      "*" = ["trim_whitespace"];
    };
    formatters = {
      alejandra.command = "${pkgs.alejandra}/bin/alejandra";
      rustfmt.command = "${pkgs.rustfmt}/bin/rustfmt";
      isort.command = "${pkgs.python311Packages.isort}/bin/isort";
      ruff_format.command = "${pkgs.ruff}/bin/ruff";
      jq.command = "${pkgs.jq}/bin/jq";
      taplo.command = "${pkgs.taplo}/bin/taplo";
      yamlfmt.command = "${pkgs.yamlfmt}/bin/yamlfmt";
      stylua.command = "${pkgs.stylua}/bin/stylua";
    };

    # ...extra config, like format on save | format command setup
  }
}
```

With [`nixvim`](https://github.com/nix-community/nixvim) you don't really need things like
[`mason.nvim`](https://github.com/williamboman/mason.nvim) or
[`lazy.nvim`](https://github.com/folke/lazy.nvim)

Check the rest of my `nixvim` [flake](https://github.com/jonboh/nixvim) for the rest of my NeoVim configuration.

