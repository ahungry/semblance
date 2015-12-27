:- module(h, [
              render/3
          ]).

/**  <module> Helpers
Various helpers to obfuscate away some of the boilerplate

  @author Matthew Carter
  @copyright Copyright (c) 2015, Matthew Carter
  @license AGPLv3
*/

render(_Request, Template, Binds) :-
    config:c(templateDirectory, TemplateDir),
    working_directory(_, TemplateDir),
    format('Content-type: text/html~n~n'),
    current_output(Out),
    st_render:st_render_file(Template, Binds, Out, []).
