:- module(main, [
              start/0,
              stop/0
          ]).

/** <module> Main
The main entry point for the web application/consult
web server commands.

  @author Matthew Carter
  @copyright Copyright (c) 2015, Matthew Carter
  @license AGPLv3
*/


% Builtin SWI-Prolog modules
:- use_module(library(debug)).
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_log)).
:- use_module(library(http/html_head)).
:- use_module(library(http/http_files)).

:- dynamic started/0.

%% start is nondet
%
%  Start the server
start :-
    started, !,
    config:c(port, Port),
    format(user_error, 'Already running on ~w\n', [Port]).

start :-
    config:c(port, Port),
    http_server(http_dispatch, [port(Port), timeout(3600)]),
    assert(started),
    http_log('Begin on port ~w~n', [Port]).

stop :-
    config:c(port, Port),
    http_stop_server(Port, []),
    format(user_error, 'Server stopped on ~w~n', [Port]).
