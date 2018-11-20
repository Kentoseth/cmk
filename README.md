# Comcek : Common command Executor

Comcek (cmk for short) is a commandline program that enables the storage of common/frequent commands in a YAML file for execution.

With Comcek you no longer need: advanced configurations for your bash_history, using lots of commands to search your bash history or storing your commands in multiple TXT files.

Comcek is a self-contained binary written in the Nim programming language. All you need is the binary and a YAML file to make it run.

## Contents
 * [Requirements](#requirements)
 * [Compiling](#compile)
 * [Installation](#installation)
 * [Releases](#releases)
 * [Usage](#usage)
 * [Example YAML file](#yaml)
 * [Contribute](#contribute)
 * [License](#license)
 * [Queries](#queries)

## Requirements

 * Comcek binary (available under "Releases")
 * YAML file storing all your common commands

## Compile

 * Run the `cmk.nimble` file to install the dependencies
 * Dependencies: yaml, cligen
 * `cd src`
 * `nim c -d:release cmk.nim`

## Installation

 * Create a folder to store the binary file in, example: `mkdir ~/cmk-bin`
 * Place the binary file in `~/cmk-bin`
 * Export the PATH in your .profile or other file: `export PATH=/home/user/cmk-bin:$PATH`
 * Determine the configuration path for your system by running: `cmk upath`
 * `cd` into the folder shown above (on UNIX it is generally: `~/.config/comcek` )
 * If the `/comcek` folder doesn't exist, create it so that it matches `cmk upath`
 * Create a YAML file: `touch cmd.yaml` inside `/comcek`

## Releases

Available at: https://github.com/Kentoseth/cmk/releases

Release will contain:

 * `cmk` binary
 * Example `cmd.yaml` file

## Usage

Comcek currently has 4 supported commands: display_all , display , execute, upath

 * `cmk display_all` OR `cmk all` - Will display everything stored in cmd.yaml
 * `cmk display --category=<category-name>` OR `cmk display -c=<category-name>` - Will display entries for a specific category
 * `cmk display --id=<id-value>` OR `cmk display -i=<id-value>` - Will display entries for a specific ID
 * `cmk execute --id=<id-value>` OR `cmk exec -i=<id-value>` - Will execute the command at the specified ID
 *  `cmk upath` - Will show the configuration file path where the YAML file will be stored

Use `cmk --help` for more information.

## Yaml

Below is an example YAML file to get you started:

```
ls:
  - id: 1.1
    cmd: ls
    des: Displays some files in a specific folder
  - id: 1.2
    cmd: ls -la
    des: Displays all files in a specific folder, including hidden files
pwd:
  - id: 2.1
    cmd: pwd
    des: Tells me the entire path/location of where I am
```

## Contribute

You can create a PR or discuss it first by opening an Issue

PR Rules:

 * Make sure the program compiles
 * Test it locally to make sure the program runs
 * If the code is not readable, the PR may be rejected

This project follows the UNIX philosophy of doing one thing only and (hopefully) doing it well.

## License

This package is licensed under the open-source "GNU GPL, Version 3".

The full license text is available in the file LICENSE

## Queries

Open an Issue to discuss

-----

If you find this project interesting or useful, please star it and share it with colleagues and friends.