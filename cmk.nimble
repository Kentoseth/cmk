# Package

version       = "0.0.1"
author        = "Kentoseth"
description   = "Comcek is a commandline program that enables the storage of common/frequent commands in a YAML file for execution."
license       = "GPL-3.0"
srcDir        = "src"
bin           = @["cmk"]


# Dependencies

requires "nim >= 0.19.0"
requires "cligen >= 0.9.17"
requires "yaml >= 0.11.0"