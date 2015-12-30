:- module(main, [
              start/0,
              stop/0
          ]).

/** <module> Main
The main entry point for the web application/consult
web server commands.

  @author Matthew Carter <m@ahungry.com>
  @copyright Copyright (C) 2015,2016 Matthew Carter <m@ahungry.com>
  @license AGPLv3

;; Semblance - The barest trace (a framework for web apps)
;; Copyright (C) 2015,2016 Matthew Carter <m@ahungry.com>
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU Affero General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU Affero General Public License for more details.
;;
;; You should have received a copy of the GNU Affero General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

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
