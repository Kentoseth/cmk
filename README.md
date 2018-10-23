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

 * Create a folder at your default user path: `mkdir ~/.comcek`
 * Create a YAML file: `touch cmd.yaml`
 * Download the binary and store it in: `~/.comcek/`
 * Export the PATH in your .profile or other file: `export PATH=/home/user/.comcek:$PATH`

## Releases

Available at: https://github.com/Kentoseth/cmk/releases

Release will contain:

 * `cmk` binary
 * Example `cmd.yaml` file

## Usage

Comcek currently has 3 supported commands: display_all , display , execute

 * `cmk display_all` OR `cmk all` - Will display everything stored in cmd.yaml
 * `cmk display --category=<category-name>` OR `cmk display -c=<category-name>` - Will display entries for a specific category
 * `cmk display --id=<id-value>` OR `cmk display -i=<id-value>` - Will display entries for a specific ID
 * `cmk execute --id=<id-value>` OR `cmk exec -i=<id-value>` - Will execute the command at the specified ID

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
 * Test it locally to make sure it works
 * If the code is not readable, the PR may be rejected

This project follows the UNIX philosophy of doing one thing only and (hopefully) doing it well.

## License

This package is licensed under the open-source "GNU GPL, Version 3".

The full license text is available in the file LICENSE

## Queries

Open an Issue to discuss