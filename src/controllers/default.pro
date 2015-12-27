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
                a('href=/templated.htm', 'templated.htm'),
                p('or'),
                a('href=/blub.htm', 'blub.htm')
            ]).

:- http_handler(root('templated.htm'), templated_page, [id(templated)]).
templated_page(Request) :-
    h:render(Request, my_template,
                _{
                        title: 'Templated',
                        items: [
                            _{ title: 'Item 1', content: 'Abc 1' },
                            _{ title: 'Item 1', content: 'Abc 2' }
                        ]
                    }).

:- http_handler(root('blub.htm'), blub, [id(blub)]).
blub(Request) :-
    h:render(Request, blub, _{ name: 'Your Name' }).
