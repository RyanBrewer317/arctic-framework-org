-module(lustre@ssg@djot).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch]).

-export([frontmatter/1, metadata/1, content/1, default_renderer/0, render/2, render_with_metadata/2]).
-export_type([renderer/1]).

-type renderer(QHH) :: {renderer,
        fun((gleam@dict:dict(binary(), binary()), gleam@option:option(binary()), binary()) -> QHH),
        fun((list(QHH)) -> QHH),
        fun((gleam@dict:dict(binary(), binary()), integer(), list(QHH)) -> QHH),
        fun((jot:destination(), gleam@dict:dict(binary(), binary()), list(QHH)) -> QHH),
        fun((gleam@dict:dict(binary(), binary()), list(QHH)) -> QHH),
        fun((list(QHH)) -> QHH),
        fun((binary()) -> QHH),
        fun((binary()) -> QHH),
        fun((jot:destination(), binary()) -> QHH),
        QHH,
        QHH}.

-spec frontmatter(binary()) -> {ok, binary()} | {error, nil}.
frontmatter(Document) ->
    gleam@bool:guard(
        not gleam_stdlib:string_starts_with(Document, <<"---"/utf8>>),
        {error, nil},
        fun() ->
            Options = {options, false, true},
            _assert_subject = gleam@regexp:compile(
                <<"^---\\n[\\s\\S]*?\\n---"/utf8>>,
                Options
            ),
            {ok, Re} = case _assert_subject of
                {ok, _} -> _assert_subject;
                _assert_fail ->
                    erlang:error(#{gleam_error => let_assert,
                                message => <<"Assertion pattern match failed"/utf8>>,
                                value => _assert_fail,
                                module => <<"lustre/ssg/djot"/utf8>>,
                                function => <<"frontmatter"/utf8>>,
                                line => 137})
            end,
            case gleam@regexp:scan(Re, Document) of
                [{match, Frontmatter, _} | _] ->
                    {ok,
                        begin
                            _pipe = Frontmatter,
                            _pipe@1 = gleam@string:drop_start(_pipe, 4),
                            gleam@string:drop_end(_pipe@1, 4)
                        end};

                _ ->
                    {error, nil}
            end
        end
    ).

-spec metadata(binary()) -> {ok, gleam@dict:dict(binary(), tom:toml())} |
    {error, tom:parse_error()}.
metadata(Document) ->
    case frontmatter(Document) of
        {ok, Frontmatter} ->
            tom:parse(Frontmatter);

        {error, _} ->
            {ok, maps:new()}
    end.

-spec content(binary()) -> binary().
content(Document) ->
    Toml = frontmatter(Document),
    case Toml of
        {ok, Toml@1} ->
            gleam@string:replace(
                Document,
                <<<<"---\n"/utf8, Toml@1/binary>>/binary, "\n---"/utf8>>,
                <<""/utf8>>
            );

        {error, _} ->
            Document
    end.

-spec linkify(binary()) -> binary().
linkify(Text) ->
    _assert_subject = gleam@regexp:from_string(<<" +"/utf8>>),
    {ok, Re} = case _assert_subject of
        {ok, _} -> _assert_subject;
        _assert_fail ->
            erlang:error(#{gleam_error => let_assert,
                        message => <<"Assertion pattern match failed"/utf8>>,
                        value => _assert_fail,
                        module => <<"lustre/ssg/djot"/utf8>>,
                        function => <<"linkify"/utf8>>,
                        line => 290})
    end,
    _pipe = Text,
    _pipe@1 = gleam@regexp:split(Re, _pipe),
    gleam@string:join(_pipe@1, <<"-"/utf8>>).

-spec default_renderer() -> renderer(lustre@internals@vdom:element(any())).
default_renderer() ->
    To_attributes = fun(Attrs) ->
        gleam@dict:fold(
            Attrs,
            [],
            fun(Attrs@1, Key, Val) ->
                [lustre@attribute:attribute(Key, Val) | Attrs@1]
            end
        )
    end,
    {renderer,
        fun(Attrs@2, Lang, Code) ->
            Lang@1 = gleam@option:unwrap(Lang, <<"text"/utf8>>),
            lustre@element@html:pre(
                To_attributes(Attrs@2),
                [lustre@element@html:code(
                        [lustre@attribute:attribute(
                                <<"data-lang"/utf8>>,
                                Lang@1
                            )],
                        [lustre@element:text(Code)]
                    )]
            )
        end,
        fun(Content) -> lustre@element@html:em([], Content) end,
        fun(Attrs@3, Level, Content@1) -> case Level of
                1 ->
                    lustre@element@html:h1(To_attributes(Attrs@3), Content@1);

                2 ->
                    lustre@element@html:h2(To_attributes(Attrs@3), Content@1);

                3 ->
                    lustre@element@html:h3(To_attributes(Attrs@3), Content@1);

                4 ->
                    lustre@element@html:h4(To_attributes(Attrs@3), Content@1);

                5 ->
                    lustre@element@html:h5(To_attributes(Attrs@3), Content@1);

                6 ->
                    lustre@element@html:h6(To_attributes(Attrs@3), Content@1);

                _ ->
                    lustre@element@html:p(To_attributes(Attrs@3), Content@1)
            end end,
        fun(Destination, References, Content@2) -> case Destination of
                {reference, Ref} ->
                    case gleam_stdlib:map_get(References, Ref) of
                        {ok, Url} ->
                            lustre@element@html:a(
                                [lustre@attribute:href(Url)],
                                Content@2
                            );

                        {error, _} ->
                            lustre@element@html:a(
                                [lustre@attribute:href(
                                        <<"#"/utf8, (linkify(Ref))/binary>>
                                    ),
                                    lustre@attribute:id(
                                        linkify(<<"back-to-"/utf8, Ref/binary>>)
                                    )],
                                Content@2
                            )
                    end;

                {url, Url@1} ->
                    lustre@element@html:a(
                        [lustre@attribute:attribute(<<"href"/utf8>>, Url@1)],
                        Content@2
                    )
            end end,
        fun(Attrs@4, Content@3) ->
            lustre@element@html:p(To_attributes(Attrs@4), Content@3)
        end,
        fun(Content@4) -> lustre@element@html:strong([], Content@4) end,
        fun(Text) -> lustre@element:text(Text) end,
        fun(Content@5) ->
            lustre@element@html:code([], [lustre@element:text(Content@5)])
        end,
        fun(Destination@1, Alt) -> case Destination@1 of
                {reference, Ref@1} ->
                    lustre@element@html:img(
                        [lustre@attribute:src(
                                <<"#"/utf8, (linkify(Ref@1))/binary>>
                            ),
                            lustre@attribute:alt(Alt)]
                    );

                {url, Url@2} ->
                    lustre@element@html:img(
                        [lustre@attribute:src(Url@2), lustre@attribute:alt(Alt)]
                    )
            end end,
        lustre@element@html:br([]),
        lustre@element@html:hr([])}.

-spec text_content(list(jot:inline())) -> binary().
text_content(Segments) ->
    gleam@list:fold(Segments, <<""/utf8>>, fun(Text, Inline) -> case Inline of
                {text, Content} ->
                    <<Text/binary, Content/binary>>;

                {link, Content@1, _} ->
                    <<Text/binary, (text_content(Content@1))/binary>>;

                {emphasis, Content@2} ->
                    <<Text/binary, (text_content(Content@2))/binary>>;

                {strong, Content@3} ->
                    <<Text/binary, (text_content(Content@3))/binary>>;

                {code, Content@4} ->
                    <<Text/binary, Content@4/binary>>;

                {image, _, _} ->
                    Text;

                linebreak ->
                    Text
            end end).

-spec render_inline(
    jot:inline(),
    gleam@dict:dict(binary(), binary()),
    renderer(QIH)
) -> QIH.
render_inline(Inline, References, Renderer) ->
    case Inline of
        {text, Text} ->
            (erlang:element(8, Renderer))(Text);

        {link, Content, Destination} ->
            (erlang:element(5, Renderer))(
                Destination,
                References,
                gleam@list:map(
                    Content,
                    fun(_capture) ->
                        render_inline(_capture, References, Renderer)
                    end
                )
            );

        {emphasis, Content@1} ->
            (erlang:element(3, Renderer))(
                gleam@list:map(
                    Content@1,
                    fun(_capture@1) ->
                        render_inline(_capture@1, References, Renderer)
                    end
                )
            );

        {strong, Content@2} ->
            (erlang:element(7, Renderer))(
                gleam@list:map(
                    Content@2,
                    fun(_capture@2) ->
                        render_inline(_capture@2, References, Renderer)
                    end
                )
            );

        {code, Content@3} ->
            (erlang:element(9, Renderer))(Content@3);

        {image, Alt, Destination@1} ->
            (erlang:element(10, Renderer))(Destination@1, text_content(Alt));

        linebreak ->
            erlang:element(11, Renderer)
    end.

-spec render_block(
    jot:container(),
    gleam@dict:dict(binary(), binary()),
    renderer(QID)
) -> QID.
render_block(Block, References, Renderer) ->
    case Block of
        {paragraph, Attrs, Inline} ->
            (erlang:element(6, Renderer))(
                Attrs,
                gleam@list:map(
                    Inline,
                    fun(_capture) ->
                        render_inline(_capture, References, Renderer)
                    end
                )
            );

        {heading, Attrs@1, Level, Inline@1} ->
            (erlang:element(4, Renderer))(
                Attrs@1,
                Level,
                gleam@list:map(
                    Inline@1,
                    fun(_capture@1) ->
                        render_inline(_capture@1, References, Renderer)
                    end
                )
            );

        {codeblock, Attrs@2, Language, Code} ->
            (erlang:element(2, Renderer))(Attrs@2, Language, Code);

        thematic_break ->
            erlang:element(12, Renderer)
    end.

-spec render(binary(), renderer(QHR)) -> list(QHR).
render(Document, Renderer) ->
    Content = content(Document),
    {document, Content@1, References} = jot:parse(Content),
    _pipe = Content@1,
    gleam@list:map(
        _pipe,
        fun(_capture) -> render_block(_capture, References, Renderer) end
    ).

-spec render_with_metadata(
    binary(),
    fun((gleam@dict:dict(binary(), tom:toml())) -> renderer(QHW))
) -> {ok, list(QHW)} | {error, tom:parse_error()}.
render_with_metadata(Document, Renderer) ->
    Toml = frontmatter(Document),
    gleam@result:'try'(
        begin
            _pipe = Toml,
            _pipe@1 = gleam@result:unwrap(_pipe, <<""/utf8>>),
            tom:parse(_pipe@1)
        end,
        fun(Metadata) ->
            Content = content(Document),
            Renderer@1 = Renderer(Metadata),
            {document, Content@1, References} = jot:parse(Content),
            _pipe@2 = Content@1,
            _pipe@3 = gleam@list:map(
                _pipe@2,
                fun(_capture) ->
                    render_block(_capture, References, Renderer@1)
                end
            ),
            {ok, _pipe@3}
        end
    ).
