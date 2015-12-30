:- module(h, [
              render/3,
              render_classic/3
          ]).

/**  <module> Helpers
Various helpers to obfuscate away some of the boilerplate

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

render(_Request, Template, Binds) :-
    config:c(templateDirectory, TemplateDir),
    working_directory(_, TemplateDir),
    format('Content-type: text/html~n~n'),
    current_output(Out),
    st_render:st_render_file(Template, Binds, Out, _{frontend: semblance}).

render_classic(_Request, Template, Binds) :-
    config:c(templateDirectory, TemplateDir),
    working_directory(_, TemplateDir),
    format('Content-type: text/html~n~n'),
    current_output(Out),
    st_render:st_render_file(Template, Binds, Out, []).
