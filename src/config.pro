:- module(config, [
              c/2
          ]).

/**  <module> config
Configuration settings and definitions

  @author Matthew Carter
  @copyright Copyright (c) 2015, Matthew Carter
  @license AGPLv3
  @note:
    Modified via code in load.pl at https://github.com/anniepoo/weblog
    Copyright (c) 2012, University of Houston
    Which has released it under the terms of the LGPL
*/

% Modify these settings as needed
c(templateDirectory, '/home/mcarter/src/prolog/semblance/src/tpl').
c(port, 8765).

% Add your module dependencies here for the use_module calls
init_config :-
  source_file(init_config, FWD),
  file_directory_name(FWD, PWD),
  assert(user:file_search_path(semblance, PWD)),
  assert(user:file_search_path(lib, semblance('lib'))),
  assert(user:file_search_path(controller, semblance('controllers'))),
  assert(user:file_search_path(vendor, semblance('vendor'))).

:- init_config.

% Turn on the logger
:- ensure_loaded(library(http/http_log)).
% Turn on sessions
:- ensure_loaded(library(http/http_session)).
% Needed for http:location/3, don't remove even if red
:- use_module(library(http/http_path)).
