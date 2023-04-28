# rgear - Generate R helper files

The aim of `rgear` is to provide simple tooling to create helper files for R based content.

The files it creates allow you to serve R based content (Shiny apps, plumber APIs or RMarkdown html outputs) from the command line.

Originally created for use with Domino Data Lab, `rgear` can be used wherever R is and therefore also makes a great complement to other projects such as [R4Pi](https://r4pi.org).

Supported content types:

* Shiny apps
* Rmarkdown html output
* Plumber APIs


## Installation

`rgear` is written in Python, and can be installed directly from PyPI:

```bash
# python3 -m pip install rgear
```


## Usage

```bash
rgear --help
```

```output
usage: rgear [-h] [-f] [-p PORT] [-v] [--version]
             {shiny,plumber,rmarkdown} path

Generates helper scripts for starting R based content servers

positional arguments:
  {shiny,plumber,rmarkdown}
                        choose the application type you want to serve
  path                  path to the content to serve

optional arguments:
  -h, --help            show this help message and exit
  -f, --force           force overwrite if the output file(s) already exist
  -p PORT, --port PORT  override the default port setting. [default: 8888]
  -v, --verbose         enable verbose output
  --version             print the version and exit

For detailed help, please see https://github.com/sellorm/rgear
```

Using the above options, various files -- mostly `app.sh` -- will be written to the working directory with the required parameters already populated.

The `app.sh` file created by rgear can be used to start the specified content from the command line. This makes it an ideal complement to all command-line uses of R.

For example, to generate a script to serve a plumber API:

```bash
# rgear plumber plumber.R
```


## Using with Domino Data Lab

Domino Data Lab can then use these files to serve your content as a DDL
"(app)[https://docs.dominodatalab.com/en/latest/user_guide/71635d/publish-apps/]".

The "app.sh" files created by `rgear` have sensible defaults for Domino and allows users to generate the file(s) they need without too much effort.

Use `rgear` to generate the "app.sh" file you need for your specific content type and then configure Domino to use that file to serve your content.


## Using with command line R (Including R4Pi)

Use `rgear` to generate startup scripts for your Shiny apps, plumber APIs or RMarkdown reports.

For example, if you have a Shiny app in an "app.R" file, run:

```bash
# rgear shiny app.R
```

Then you can run the app with:

```bash
# ./app.sh
```

Then visit the app in your browser using either http://localhost:8888 or http://<IP ADDRESS>:8888.

Use ctrl+c to stop the app from running.

You can run the "app.sh" script in the background with:

```bash
# nohup ./app.sh &
```

You'll need to use `ps` and `kill` to stop an application started this way.


## License

MIT License Copyright (c) 2023 Mark Sellors

See the `LICENSE` file for the full text of the license.

