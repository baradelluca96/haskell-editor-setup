# Haskell Editor Setup

An example project setup for Haskell using VSCode.
Fire those commands hoping for the best.

## Install Stack

Install stack

    wget -qO- https://get.haskellstack.org/ | sh

Install tools system wide (cd ~)

    stack install hlint phoityne-vscode hspec-discover

Build this project

    stack build

    stack test

You have to export Stack installed binaries if not already in your path

    export PATH=$PATH:~/.local/bin

## Install HIE

### With Nix

Install nix

    bash <(curl https://nixos.org/nix/install)

Install cachix client

    nix-env -iA cachix -f https://cachix.org/api/v1/install

Cache hie binaries

    cachix use all-hies

Install some HIE for lts-14.21(ghc-8.6.5)

    nix-env -iA selection --arg selector 'p: { inherit (p) ghc865; }' -f https://github.com/infinisil/all-hies/tarball/master

## Usefull links

### Heavily inspired by

- [Setting up Haskell in VS Code with Stack and the IDE Engine](https://medium.com/@dogwith1eyesetting-up-haskell-in-vs-code-with-stack-and-the-ide-engine-81d49eda3ecf)
- [My Project](https://github.com/dogwith1eye/my-project)

### Nix things

- [Haskell IDE Engine #Installation](https://github.com/haskell/haskell-ide-engine#installation)
- [Cached Haskell IDE](https://github.com/Infinisil/all-hies)

### Generally usefull

- [An opinionated guide to Haskell in 2018](https://lexi-lambda.github.io/blog/2018/02/10/an-opinionated-guide-to-haskell-in-2018/)