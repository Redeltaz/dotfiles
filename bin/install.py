#!/usr/bin/env python

import os
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("action", nargs="?", choices=["install", "uninstall", "update"],
                    help="Chose what action to execute")
parser.add_argument('--skip', "-s", nargs="*", default=False,
                    help='If set, software choosed while not be affected by the action.')

args = parser.parse_args()
print(args)

if not args.action:
    print("You need to choose an action")
    exit(1)

softwares = [
    "alacritty",
    "dunst",
    "firefox",
    "git",
    "i3",
    "nvim",
    "picom",
    "polybar",
    "rofi",
    "tmux",
    "zsh"
]
