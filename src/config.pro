:- module(config, [
              c/2
          ]).

/**  <module> config
Configuration settings and definitions

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

% Modify these settings as needed
c(templateDirectory, '/home/mcarter/src/prolog/semblance/src/tpl').
c(port, 8765).

% Add your module dependencies here for the use_module calls
:- prolog_load_context(directory, Dir),
   asserta(user:file_search_path(semblance, Dir)).

user:file_search_path(lib, semblance('lib')).
user:file_search_path(controller, semblance('controllers')).
user:file_search_path(vendor, semblance('vendor')).

% Turn on the logger
%:- ensure_loaded(library(http/http_log)).
% Turn on sessions
:- ensure_loaded(library(http/http_session)).
% Needed for http:location/3, don't remove even if red
:- use_module(library(http/http_path)).
