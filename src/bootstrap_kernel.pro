:- module(bootstrap_kernel, [
              boot/0,
              configDebug/0
          ]).

/**  <module> Bootstrap Kernel
The main entry point for laying out the application.

Consulting this file will invoke the application.

  @author Matthew Carter
  @copyright Copyright (c) 2015, Matthew Carter
  @license AGPLv3
*/

% Our custom config
:- ensure_loaded('config.pro').

% List the vendor modules we plan to use in one single entry point
% TODO - See if there is some way to invoke dependency injection
% so that the dependencies can be loaded at the top level and passed
% down to the programs that require them
:- use_module(vendor('simple-template/prolog/st/st_render.pl')).

% Load our custom lib files
:- use_module(lib('helpers.pro')). % use as h:*

% Load the main route file
:- use_module(semblance('main.pro')).
:- use_module(controller('default.pro')).

configDebug :-
    config(templateDirectory, X),
    format('Template directory is ~w~n', X).

boot :-
    main:start.
