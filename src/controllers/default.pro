:- module(default, []).

:- use_module(library(debug)).
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_log)).
:- use_module(library(http/html_head)).
:- use_module(library(http/http_files)).

:- http_handler(root(.), redir_to_index, [id(indexroot)]).
redir_to_index(Request) :- http_redirect(moved_temporary, location_by_id(index), Request).

:- http_handler(root('index.htm'), index_page, [id(index)]).
index_page(_Request) :-
    reply_html_page(
            title('Welcome to Semblance'),
            [
                h1('Welcome to Semblance'),
                p('You can view a sample template page at'),
                a('href=/templated.htm', 'Template Sample'),
                p('or'),
                a('href=/classic-templated.htm', 'Classic Template Sample'),
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
