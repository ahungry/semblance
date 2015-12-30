:- module(default, []).

/**  <module> default
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
:- use_module(library(debug)).
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_log)).
:- use_module(library(http/html_head)).
:- use_module(library(http/http_files)).
:- use_module(library(http/http_parameters)).
:- use_module(library(http/http_wrapper)).

:- http_handler(root(.), redir_to_index, [id(indexroot)]).
redir_to_index(Request) :- http_redirect(moved_temporary, location_by_id(index), Request).

:- http_handler(root('index.htm'), index_page, [id(index)]).
index_page(Request) :-
    http_current_request(Request),
    http_parameters(Request, [
                        % Pulling in and assigning the query string hello_name=X if present
                        hello_name(Name, [ optional(true), default('Anonymous') ])
                    ]),
    reply_html_page(
            title('Welcome to Semblance'),
            [
                h1(['Welcome to Semblance ', Name]),
                p('Your name? '),
                form('action="#" method="get"', [
                            input('type="text" name="hello_name"'),
                            input('type="submit"')
                        ]),
                i('Don\'t worry, we won\'t track you'),
                p('You can view a sample template page at'),
                a('href="/templated.htm"', 'Template Sample'),
                p('or'),
                a('href="/classic-templated.htm"', 'Classic Template Sample'),
                p('View the project page at:'),
                a('href=https://github.com/ahungry/semblance', 'https://github.com/ahungry/semblance')
            ]).

:- http_handler(root('classic-templated.htm'), classic_templated_page, [id(classic_templated)]).
classic_templated_page(Request) :-
    h:render_classic(Request, render_classic,
                     _{
                             title: 'Classic Templated',
                             items: [
                                 _{ title: 'Item 1', content: 'Abc 1' },
                                 _{ title: 'Item 1', content: 'Abc 2' }
                             ]
                         }).

:- http_handler(root('templated.htm'), templated_page, [id(templated)]).
templated_page(Request) :-
    h:render(Request, render,
             _{
                     title: 'Templated',
                     items: [
                         _{ title: 'Item 1', content: 'Abc 1' },
                         _{ title: 'Item 1', content: 'Abc 2' }
                     ]
                 }).
