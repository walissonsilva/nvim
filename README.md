# NVIM

This repository contains my personal setup to use Neovim as my IDE. This setup includes support to JavaScript, Python, TypeScript, C#, ReactJS, Next.js, Node.js, .NET and more.

With this setup I can use Neovim as my IDE daily, in my personal projects as well as in my job.

I am using Lazy to manage plugins. Besides there are a lot of remaps that helps me to improve my productivity. All the plugins configurations are inside of a folder (`plugins`) which makes easy to add/manage my plugins.

## What do you need to use this Neovim setup?

First of all, you need to have Vim and Neovim installed in your machine, of course. Furthermore, you need to have the tools listed above:

- `gcc` (used by `treesitter` plugin)
- `make` (in order to build `telescope-fzf-native` plugin)
- `ripgrep` (used by `telescope` in "File Grep" option)
- Node.js (to allow Mason to create `tsserver` setup)

After install those tools, you can clone this folder inside of `.config` folder (UNIX users). To finish, navigate to the cloned folder and open it inside of Neovim using the command `nvim .`. The Lazy should be trigger to install all plugins.

That's it! Your setup must be ready to do some code! 💻
