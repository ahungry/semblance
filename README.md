# Semblance - The barest trace

Semblance aims to be a quickly installable and usable framework for
creating a Prolog web application.

You can think of it as the prologue to your Prolog web application.

As the Prolog community is quite small (and the application end,
such as SWI-Prolog, or GProlog is as well), the project name seemed
quite fitting.

Please refer to and understand the license ([GNU AGPL](https://gnu.org/licenses/agpl.html)) before
implementing as the base of your own project.

GNU AGPL is a copyleft license - similar to using a GPL license in
distributed software, the GNU AGPL aims to invoke the same freedoms to
the end user of Software as a Service - the right to receive, analyze,
and modify the source code responsible for the program/website they
are using.

As such, you may find this framework unsuitable for a project in which
you wish to keep your code private/proprietary.

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

# License

GNU AGPL
