# Semblance - The barest trace

Semblance aims to be a quickly installable and usable framework for
creating a Prolog web application.

You can think of it as the prologue to your Prolog web application.

As the Prolog community is quite small (and the application end,
such as SWI-Prolog, or GProlog is as well), the project name seemed
quite fitting.

# Usage

To begin, clone the repository from git, then change into that
directory and start your REPL.

Next, before initializing, pull the Djula style template repository
into your src/vendor/ directory via:

```sh
git clone https://github.com/ahungry/simple-template.git
```

Next, consult the "bootstrap_kernel.pro" file, and run 'boot.' in the REPL
to begin the web server.

At this point, you should be able to start navigating the files and
see where each goes.

It should be pretty self explanatory in how to organize your files (I
like the MVC pattern), but you can adjust to your needs.

You may find projects are easier to maintain if you fully qualify your
library calls by module\_name:function call, rather than including
use\_module at the top of many files (instead, include it once in bootstrap_kernel.pro).

# Contact

Reach out to me at [the GitHub
page](https://github.com/ahungry/semblance) for more help.

# Soon

Plan to see a tutorial at http://ahungry.com/blog/ that will go over
the full process, as well as a much more robust initial setup process
to begin with, including a run once wizard to layout the file
structure etc.

# Thanks

Thanks to Anniepoo for her work on
[weblog](https://github.com/Anniepoo/weblog) which aims to be a
collection of useful HTML widgets and add-ons, as well as her Prolog
web tutorial, which inspired this project.

Thanks to RLA for his work on
[simple-template](https://github.com/rla/simple-template), which gave
me a headstart and fork candidate for implementing a Djula like syntax
for the render call to templates.

# License

AGPLv3 or later
