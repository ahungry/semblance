:- module(bootstrap_kernel, [
              boot/0,
              configDebug/0
          ]).

/**  <module> Bootstrap Kernel
The main entry point for laying out the application.

Consulting this file will invoke the application.

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
