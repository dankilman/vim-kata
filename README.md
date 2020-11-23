# vim-kata

A vimscript to help you improve your Vim muscle memory.

## Description

I wrote `vim-kata` to help me improve my Vim skills, I'm hoping it will do the same for others.

It is basically a scripted version of [Vim-Katas](https://github.com/adomokos/Vim-Katas)
which in turn is heavily inspired by and mostly extracted from
[Practical Vim](https://pragprog.com/book/dnvim/practical-vim).

In addition to taking some of the katas directly from Vim Katas, I also borrowed extensively from
[VimGolf](https://www.vimgolf.com/) and added a few of my own.

The katas in this repo are not meant to be hard to solve. Quite the opposite. For each, there are usually
several techniques that can be employed to simplify the task greatly. I believe that going over them
frequently can help build muscle memory.

I intend on adding a new kata every time I run into some new trick.

Contributions of new katas and fixes/improvements to the script are most welcome!

## Demo

![Screencast](https://github.com/dankilman/vim-kata/raw/master/doc/demo.gif)

## Requirements

I'm using neovim on macOS but I don't think I'm using anything neovim specific or very new features.

That being said, the script may need some fixes to work in different setups.

Specifically, windows is not supported but I'll gladly accept PRs that add windows support.

## Usage

* Clone this repo.
* from terminal, `cd` into repo directory.
* from terminal, run `./run.sh`

After `vim-kata` is loaded, the first kata should appear (first being the first in the newly shuffled order).

`vim-kata` uses the Vim diff display mode.

The upper window is the input text. This is where you edit the text.

The lower window is the output text. This is what your editing should look like. This buffer is `'unmodifiable'`.

Once you are done with a kata:

* `<C-J>` to load the next kata.
* `<C-K>` to reload the previous kata.
* `<C-G>` to load a specific kata by directory name (thanks [@oflisback](https://github.com/oflisback)).
* `ZQ` to quit (mapped to `qa!`).

## Tips

Each kata in the `katas` dir includes an additional `tips` file.

This file gives an informal description of the key sequences I tend to use when doing the kata.

The tips are usually trying to strike a balance between fewer keystrokes, while remaining pragmatic and
easier to reuse across different similar situations.
They are not optimizing for minimal keystrokes like VimGolf does.

Type `g?` to display tips for the current kata.

## Configuration

The `config.vim` file contains the configuration options for `vim-kata`.

## Adding Katas

All katas are stored in the `katas` directory.

Each kata is a directory comprised of 4 files: `in`, `out`, `ext` and `tips`.
The `in` and `out` are self explanatory.

The `ext` file is optional. It contains the file extension that should be used.
This is relevent when you want a certain kata to have syntax highlighting.
If `ext` doesn't exist, `txt` extension is used.

If `tips` exists, it will display when typing `g?`.

To add a kata, simply create a new directory with this structure.

### Custom cursor start location

To have a kata start with the cursor positioned at a custom location,
add a literal `<C-K>` (`^K`) to the `in` document (not the `out`!). The kata will load with the cursor
at that position, and the literal `<C-K>` will be removed.
