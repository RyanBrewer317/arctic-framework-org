-module(arctic@parse).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch]).

-export([new/0, add_inline_rule/4, add_prefix_rule/3, add_static_component/3, add_dynamic_component/2, wrap_inline/1, wrap_inline_with_attributes/2, wrap_prefix/1, wrap_prefix_with_attributes/2, parse/2]).
-export_type([parsed_page/0, parse_result/1, parse_error/0, arctic_parser/0, position/0, inline_rule/0, prefix_rule/0, component/0, parser_builder/0]).

-type parsed_page() :: {parsed_page,
        gleam@dict:dict(binary(), binary()),
        list(gleam@option:option(lustre@internals@vdom:element(nil)))}.

-type parse_result(TIP) :: {parse_result, TIP, list(parse_error())}.

-type parse_error() :: {parse_error, position(), binary()}.

-type arctic_parser() :: {arctic_parser,
        fun((binary(), position()) -> parse_result(gleam@option:option(lustre@internals@vdom:element(nil))))}.

-type position() :: {position, integer(), integer()}.

-type inline_rule() :: {inline_rule,
        binary(),
        binary(),
        fun((lustre@internals@vdom:element(nil), list(binary()), position()) -> {ok,
                lustre@internals@vdom:element(nil)} |
            {error, snag:snag()})}.

-type prefix_rule() :: {prefix_rule,
        binary(),
        fun((lustre@internals@vdom:element(nil), position()) -> {ok,
                lustre@internals@vdom:element(nil)} |
            {error, snag:snag()})}.

-type component() :: {static_component,
        binary(),
        fun((list(binary()), binary(), position()) -> {ok,
                lustre@internals@vdom:element(nil)} |
            {error, snag:snag()})} |
    {dynamic_component, binary()}.

-opaque parser_builder() :: {parser_builder,
        list(inline_rule()),
        list(prefix_rule()),
        list(component())}.

-spec new() -> parser_builder().
new() ->
    {parser_builder, [], [], []}.

-spec add_inline_rule(
    parser_builder(),
    binary(),
    binary(),
    fun((lustre@internals@vdom:element(nil), list(binary()), position()) -> {ok,
            lustre@internals@vdom:element(nil)} |
        {error, snag:snag()})
) -> parser_builder().
add_inline_rule(P, Left, Right, Action) ->
    {parser_builder,
        [{inline_rule, Left, Right, Action} | erlang:element(2, P)],
        erlang:element(3, P),
        erlang:element(4, P)}.

-spec add_prefix_rule(
    parser_builder(),
    binary(),
    fun((lustre@internals@vdom:element(nil), position()) -> {ok,
            lustre@internals@vdom:element(nil)} |
        {error, snag:snag()})
) -> parser_builder().
add_prefix_rule(P, Prefix, Action) ->
    {parser_builder,
        erlang:element(2, P),
        [{prefix_rule, Prefix, Action} | erlang:element(3, P)],
        erlang:element(4, P)}.

-spec add_static_component(
    parser_builder(),
    binary(),
    fun((list(binary()), binary(), position()) -> {ok,
            lustre@internals@vdom:element(nil)} |
        {error, snag:snag()})
) -> parser_builder().
add_static_component(P, Name, Action) ->
    {parser_builder,
        erlang:element(2, P),
        erlang:element(3, P),
        [{static_component, Name, Action} | erlang:element(4, P)]}.

-spec add_dynamic_component(parser_builder(), binary()) -> parser_builder().
add_dynamic_component(P, Name) ->
    {parser_builder,
        erlang:element(2, P),
        erlang:element(3, P),
        [{dynamic_component, Name} | erlang:element(4, P)]}.

-spec wrap_inline(
    fun((list(lustre@internals@vdom:attribute(any())), list(lustre@internals@vdom:element(nil))) -> lustre@internals@vdom:element(nil))
) -> fun((lustre@internals@vdom:element(nil), any(), any()) -> {ok,
        lustre@internals@vdom:element(nil)} |
    {error, any()}).
wrap_inline(W) ->
    fun(El, _, _) -> {ok, W([], [El])} end.

-spec wrap_inline_with_attributes(
    fun((list(lustre@internals@vdom:attribute(TJI)), list(lustre@internals@vdom:element(nil))) -> lustre@internals@vdom:element(nil)),
    list(lustre@internals@vdom:attribute(TJI))
) -> fun((lustre@internals@vdom:element(nil), any(), any()) -> {ok,
        lustre@internals@vdom:element(nil)} |
    {error, any()}).
wrap_inline_with_attributes(W, Attrs) ->
    fun(El, _, _) -> {ok, W(Attrs, [El])} end.

-spec wrap_prefix(
    fun((list(lustre@internals@vdom:attribute(any())), list(lustre@internals@vdom:element(nil))) -> lustre@internals@vdom:element(nil))
) -> fun((lustre@internals@vdom:element(nil), any()) -> {ok,
        lustre@internals@vdom:element(nil)} |
    {error, any()}).
wrap_prefix(W) ->
    fun(El, _) -> {ok, W([], [El])} end.

-spec wrap_prefix_with_attributes(
    fun((list(lustre@internals@vdom:attribute(TJY)), list(lustre@internals@vdom:element(nil))) -> lustre@internals@vdom:element(nil)),
    list(lustre@internals@vdom:attribute(TJY))
) -> fun((lustre@internals@vdom:element(nil), any()) -> {ok,
        lustre@internals@vdom:element(nil)} |
    {error, any()}).
wrap_prefix_with_attributes(W, Attrs) ->
    fun(El, _) -> {ok, W(Attrs, [El])} end.

-spec parse_metadata(gleam@dict:dict(binary(), binary())) -> party:parser(gleam@dict:dict(binary(), binary()), snag:snag()).
parse_metadata(Start_dict) ->
    party:do(
        party:perhaps(party:satisfy(fun(C) -> C /= <<"\n"/utf8>> end)),
        fun(Res) -> case Res of
                {ok, Key_first} ->
                    party:do(
                        party:until(
                            party:satisfy(fun(_) -> true end),
                            party:seq(
                                party:whitespace(),
                                party:char(<<":"/utf8>>)
                            )
                        ),
                        fun(Key_rest) ->
                            party:do(
                                party:whitespace(),
                                fun(_) ->
                                    party:do(
                                        party:until(
                                            party:satisfy(fun(_) -> true end),
                                            party:char(<<"\n"/utf8>>)
                                        ),
                                        fun(Val) ->
                                            Key_str = gleam@string:concat(
                                                [Key_first | Key_rest]
                                            ),
                                            Val_str = gleam@string:concat(Val),
                                            D = gleam@dict:insert(
                                                Start_dict,
                                                Key_str,
                                                Val_str
                                            ),
                                            parse_metadata(D)
                                        end
                                    )
                                end
                            )
                        end
                    );

                {error, nil} ->
                    party:return(Start_dict)
            end end
    ).

-spec parse_prefix() -> party:parser(binary(), snag:snag()).
parse_prefix() ->
    party:many_concat(
        party:satisfy(
            fun(_capture) ->
                gleam_stdlib:contains_string(
                    <<"~`!#$%^&*-_=+{[|;:<>,./?]}"/utf8>>,
                    _capture
                )
            end
        )
    ).

-spec escaped_char() -> party:parser(binary(), snag:snag()).
escaped_char() ->
    party:do(
        party:char(<<"\\"/utf8>>),
        fun(_) ->
            party:do(party:satisfy(fun(_) -> true end), fun(C) -> case C of
                        <<"n"/utf8>> ->
                            party:return(<<"\n"/utf8>>);

                        <<"t"/utf8>> ->
                            party:return(<<"\t"/utf8>>);

                        <<"f"/utf8>> ->
                            party:return(<<"\f"/utf8>>);

                        <<"r"/utf8>> ->
                            party:return(<<"\r"/utf8>>);

                        <<"u"/utf8>> ->
                            party:do(
                                party:char(<<"{"/utf8>>),
                                fun(_) ->
                                    party:do(
                                        party:whitespace(),
                                        fun(_) ->
                                            party:do(
                                                party:many1_concat(
                                                    party:satisfy(
                                                        fun(_capture) ->
                                                            gleam_stdlib:contains_string(
                                                                <<"1234567890abcdefABCDEF"/utf8>>,
                                                                _capture
                                                            )
                                                        end
                                                    )
                                                ),
                                                fun(Code_str) ->
                                                    party:do(
                                                        party:whitespace(),
                                                        fun(_) ->
                                                            party:do(
                                                                party:char(
                                                                    <<"}"/utf8>>
                                                                ),
                                                                fun(_) ->
                                                                    _assert_subject = gleam@int:base_parse(
                                                                        Code_str,
                                                                        16
                                                                    ),
                                                                    {ok, Code} = case _assert_subject of
                                                                        {ok, _} -> _assert_subject;
                                                                        _assert_fail ->
                                                                            erlang:error(
                                                                                    #{gleam_error => let_assert,
                                                                                        message => <<"Assertion pattern match failed"/utf8>>,
                                                                                        value => _assert_fail,
                                                                                        module => <<"arctic/parse"/utf8>>,
                                                                                        function => <<"escaped_char"/utf8>>,
                                                                                        line => 353}
                                                                                )
                                                                    end,
                                                                    party:do(
                                                                        party:'try'(
                                                                            party:return(
                                                                                nil
                                                                            ),
                                                                            fun(
                                                                                _
                                                                            ) ->
                                                                                _pipe = gleam@string:utf_codepoint(
                                                                                    Code
                                                                                ),
                                                                                gleam@result:map_error(
                                                                                    _pipe,
                                                                                    fun(
                                                                                        _
                                                                                    ) ->
                                                                                        snag:new(
                                                                                            <<<<"unknown unicode codepoint `\\u{"/utf8,
                                                                                                    Code_str/binary>>/binary,
                                                                                                "}"/utf8>>
                                                                                        )
                                                                                    end
                                                                                )
                                                                            end
                                                                        ),
                                                                        fun(
                                                                            Codepoint
                                                                        ) ->
                                                                            party:return(
                                                                                gleam_stdlib:utf_codepoint_list_to_string(
                                                                                    [Codepoint]
                                                                                )
                                                                            )
                                                                        end
                                                                    )
                                                                end
                                                            )
                                                        end
                                                    )
                                                end
                                            )
                                        end
                                    )
                                end
                            );

                        _ ->
                            party:return(C)
                    end end)
        end
    ).

-spec parse_markup(list(inline_rule()), binary(), position()) -> party:parser(lustre@internals@vdom:element(nil), snag:snag()).
parse_markup(Inline_rules, Terminator, Pos) ->
    party:choice(
        begin
            _pipe = gleam@list:map(
                Inline_rules,
                fun(Rule) ->
                    party:do(
                        party:string(erlang:element(2, Rule)),
                        fun(_) ->
                            party:do(
                                party:pos(),
                                fun(Party_pos) ->
                                    Pos2 = {position,
                                        erlang:element(2, Pos) + erlang:element(
                                            2,
                                            Party_pos
                                        ),
                                        erlang:element(3, Pos) + erlang:element(
                                            3,
                                            Party_pos
                                        )},
                                    party:do(
                                        party:lazy(
                                            fun() ->
                                                parse_markup(
                                                    Inline_rules,
                                                    erlang:element(3, Rule),
                                                    Pos2
                                                )
                                            end
                                        ),
                                        fun(Middle) ->
                                            party:do(
                                                party:perhaps(
                                                    party:char(<<"("/utf8>>)
                                                ),
                                                fun(Res) -> party:do(case Res of
                                                            {ok, _} ->
                                                                party:do(
                                                                    party:sep(
                                                                        party:many_concat(
                                                                            party:satisfy(
                                                                                fun(
                                                                                    C
                                                                                ) ->
                                                                                    (C
                                                                                    /= <<","/utf8>>)
                                                                                    andalso (C
                                                                                    /= <<")"/utf8>>)
                                                                                end
                                                                            )
                                                                        ),
                                                                        party:char(
                                                                            <<","/utf8>>
                                                                        )
                                                                    ),
                                                                    fun(Args) ->
                                                                        party:do(
                                                                            party:char(
                                                                                <<")"/utf8>>
                                                                            ),
                                                                            fun(
                                                                                _
                                                                            ) ->
                                                                                party:return(
                                                                                    Args
                                                                                )
                                                                            end
                                                                        )
                                                                    end
                                                                );

                                                            {error, nil} ->
                                                                party:return([])
                                                        end, fun(Args@1) ->
                                                            party:'try'(
                                                                party:return(
                                                                    nil
                                                                ),
                                                                fun(_) ->
                                                                    (erlang:element(
                                                                        4,
                                                                        Rule
                                                                    ))(
                                                                        Middle,
                                                                        Args@1,
                                                                        Pos2
                                                                    )
                                                                end
                                                            )
                                                        end) end
                                            )
                                        end
                                    )
                                end
                            )
                        end
                    )
                end
            ),
            lists:append(
                _pipe,
                [begin
                        _pipe@1 = party:until(
                            party:either(
                                escaped_char(),
                                party:satisfy(fun(_) -> true end)
                            ),
                            party:string(Terminator)
                        ),
                        party:map(
                            _pipe@1,
                            fun(Chars) ->
                                lustre@element@html:span(
                                    [],
                                    begin
                                        _pipe@2 = gleam@string:concat(Chars),
                                        _pipe@3 = gleam@string:split(
                                            _pipe@2,
                                            <<"\n"/utf8>>
                                        ),
                                        _pipe@4 = gleam@list:map(
                                            _pipe@3,
                                            fun lustre@element:text/1
                                        ),
                                        gleam@list:intersperse(
                                            _pipe@4,
                                            lustre@element@html:br([])
                                        )
                                    end
                                )
                            end
                        )
                    end]
            )
        end
    ).

-spec parse_text(list(inline_rule()), list(prefix_rule())) -> arctic_parser().
parse_text(Inline_rules, Prefix_rules) ->
    {arctic_parser,
        fun(Src, Pos) ->
            Res = party:go(
                (party:do(
                    parse_prefix(),
                    fun(Prefix) ->
                        party:do(
                            party:many(
                                party:either(
                                    party:char(<<" "/utf8>>),
                                    party:char(<<"\t"/utf8>>)
                                )
                            ),
                            fun(_) ->
                                party:do(
                                    party:pos(),
                                    fun(Party_pos) ->
                                        Pos2 = {position,
                                            erlang:element(2, Pos) + erlang:element(
                                                2,
                                                Party_pos
                                            ),
                                            erlang:element(3, Pos) + erlang:element(
                                                3,
                                                Party_pos
                                            )},
                                        party:do(
                                            parse_markup(
                                                Inline_rules,
                                                <<"\n\n"/utf8>>,
                                                Pos2
                                            ),
                                            fun(Rest) ->
                                                party:do(
                                                    case gleam@list:find(
                                                        Prefix_rules,
                                                        fun(Rule) ->
                                                            erlang:element(
                                                                2,
                                                                Rule
                                                            )
                                                            =:= Prefix
                                                        end
                                                    ) of
                                                        {ok, Rule@1} ->
                                                            party:do(
                                                                party:pos(),
                                                                fun(Party_pos@1) ->
                                                                    Pos3 = {position,
                                                                        erlang:element(
                                                                            2,
                                                                            Pos
                                                                        )
                                                                        + erlang:element(
                                                                            2,
                                                                            Party_pos@1
                                                                        ),
                                                                        erlang:element(
                                                                            3,
                                                                            Pos
                                                                        )
                                                                        + erlang:element(
                                                                            3,
                                                                            Party_pos@1
                                                                        )},
                                                                    party:do(
                                                                        party:'try'(
                                                                            party:return(
                                                                                nil
                                                                            ),
                                                                            fun(
                                                                                _
                                                                            ) ->
                                                                                (erlang:element(
                                                                                    3,
                                                                                    Rule@1
                                                                                ))(
                                                                                    Rest,
                                                                                    Pos3
                                                                                )
                                                                            end
                                                                        ),
                                                                        fun(El) ->
                                                                            party:return(
                                                                                El
                                                                            )
                                                                        end
                                                                    )
                                                                end
                                                            );

                                                        {error, nil} ->
                                                            party:return(
                                                                lustre@element@html:'div'(
                                                                    [],
                                                                    [lustre@element:text(
                                                                            Prefix
                                                                        ),
                                                                        Rest]
                                                                )
                                                            )
                                                    end,
                                                    fun(El@1) ->
                                                        party:return(
                                                            {some, El@1}
                                                        )
                                                    end
                                                )
                                            end
                                        )
                                    end
                                )
                            end
                        )
                    end
                )),
                Src
            ),
            case Res of
                {ok, T} ->
                    {parse_result, T, []};

                {error, Err} ->
                    case Err of
                        {unexpected, Party_pos@2, S} ->
                            {parse_result,
                                none,
                                [{parse_error,
                                        {position,
                                            erlang:element(2, Party_pos@2) + erlang:element(
                                                2,
                                                Pos
                                            ),
                                            erlang:element(3, Party_pos@2) + erlang:element(
                                                3,
                                                Pos
                                            )},
                                        S}]};

                        {user_error, Party_pos@3, Err@1} ->
                            {parse_result,
                                none,
                                [{parse_error,
                                        {position,
                                            erlang:element(2, Party_pos@3) + erlang:element(
                                                2,
                                                Pos
                                            ),
                                            erlang:element(3, Party_pos@3) + erlang:element(
                                                3,
                                                Pos
                                            )},
                                        erlang:element(2, Err@1)}]}
                    end
            end
        end}.

-spec parse_component(list(component())) -> arctic_parser().
parse_component(Components) ->
    {arctic_parser,
        fun(Src, Pos) ->
            Res@1 = party:go(
                (party:do(
                    party:char(<<"@"/utf8>>),
                    fun(_) ->
                        party:choice(
                            gleam@list:map(
                                Components,
                                fun(Component) ->
                                    party:do(
                                        party:string(
                                            erlang:element(2, Component)
                                        ),
                                        fun(_) ->
                                            party:do(
                                                party:whitespace(),
                                                fun(_) ->
                                                    party:do(
                                                        party:perhaps(
                                                            party:char(
                                                                <<"("/utf8>>
                                                            )
                                                        ),
                                                        fun(Res) ->
                                                            party:do(case Res of
                                                                    {ok, _} ->
                                                                        party:do(
                                                                            party:whitespace(
                                                                                
                                                                            ),
                                                                            fun(
                                                                                _
                                                                            ) ->
                                                                                party:do(
                                                                                    party:sep(
                                                                                        party:many1_concat(
                                                                                            party:satisfy(
                                                                                                fun(
                                                                                                    C
                                                                                                ) ->
                                                                                                    (C
                                                                                                    /= <<","/utf8>>)
                                                                                                    andalso (C
                                                                                                    /= <<")"/utf8>>)
                                                                                                end
                                                                                            )
                                                                                        ),
                                                                                        party:all(
                                                                                            [party:whitespace(
                                                                                                    
                                                                                                ),
                                                                                                party:char(
                                                                                                    <<","/utf8>>
                                                                                                ),
                                                                                                party:whitespace(
                                                                                                    
                                                                                                )]
                                                                                        )
                                                                                    ),
                                                                                    fun(
                                                                                        A
                                                                                    ) ->
                                                                                        party:do(
                                                                                            party:whitespace(
                                                                                                
                                                                                            ),
                                                                                            fun(
                                                                                                _
                                                                                            ) ->
                                                                                                party:do(
                                                                                                    party:char(
                                                                                                        <<")"/utf8>>
                                                                                                    ),
                                                                                                    fun(
                                                                                                        _
                                                                                                    ) ->
                                                                                                        party:return(
                                                                                                            A
                                                                                                        )
                                                                                                    end
                                                                                                )
                                                                                            end
                                                                                        )
                                                                                    end
                                                                                )
                                                                            end
                                                                        );

                                                                    {error, nil} ->
                                                                        party:return(
                                                                            []
                                                                        )
                                                                end, fun(Args) ->
                                                                    party:do(
                                                                        party:many(
                                                                            party:either(
                                                                                party:char(
                                                                                    <<" "/utf8>>
                                                                                ),
                                                                                party:char(
                                                                                    <<"\t"/utf8>>
                                                                                )
                                                                            )
                                                                        ),
                                                                        fun(_) ->
                                                                            party:do(
                                                                                party:char(
                                                                                    <<"\n"/utf8>>
                                                                                ),
                                                                                fun(
                                                                                    _
                                                                                ) ->
                                                                                    party:do(
                                                                                        party:until(
                                                                                            party:satisfy(
                                                                                                fun(
                                                                                                    _
                                                                                                ) ->
                                                                                                    true
                                                                                                end
                                                                                            ),
                                                                                            party:string(
                                                                                                <<"\n\n"/utf8>>
                                                                                            )
                                                                                        ),
                                                                                        fun(
                                                                                            Body
                                                                                        ) ->
                                                                                            case Component of
                                                                                                {static_component,
                                                                                                    _,
                                                                                                    Action} ->
                                                                                                    party:do(
                                                                                                        party:pos(
                                                                                                            
                                                                                                        ),
                                                                                                        fun(
                                                                                                            Party_pos
                                                                                                        ) ->
                                                                                                            Pos2 = {position,
                                                                                                                erlang:element(
                                                                                                                    2,
                                                                                                                    Pos
                                                                                                                )
                                                                                                                + erlang:element(
                                                                                                                    2,
                                                                                                                    Party_pos
                                                                                                                ),
                                                                                                                erlang:element(
                                                                                                                    3,
                                                                                                                    Pos
                                                                                                                )
                                                                                                                + erlang:element(
                                                                                                                    3,
                                                                                                                    Party_pos
                                                                                                                )},
                                                                                                            party:do(
                                                                                                                party:'try'(
                                                                                                                    party:return(
                                                                                                                        nil
                                                                                                                    ),
                                                                                                                    fun(
                                                                                                                        _
                                                                                                                    ) ->
                                                                                                                        Action(
                                                                                                                            Args,
                                                                                                                            gleam@string:concat(
                                                                                                                                Body
                                                                                                                            ),
                                                                                                                            Pos2
                                                                                                                        )
                                                                                                                    end
                                                                                                                ),
                                                                                                                fun(
                                                                                                                    El
                                                                                                                ) ->
                                                                                                                    party:return(
                                                                                                                        {some,
                                                                                                                            El}
                                                                                                                    )
                                                                                                                end
                                                                                                            )
                                                                                                        end
                                                                                                    );

                                                                                                {dynamic_component,
                                                                                                    _} ->
                                                                                                    party:return(
                                                                                                        {some,
                                                                                                            lustre@element:element(
                                                                                                                erlang:element(
                                                                                                                    2,
                                                                                                                    Component
                                                                                                                ),
                                                                                                                [lustre@attribute:attribute(
                                                                                                                        <<"data-parameters"/utf8>>,
                                                                                                                        gleam@string:join(
                                                                                                                            Args,
                                                                                                                            <<","/utf8>>
                                                                                                                        )
                                                                                                                    ),
                                                                                                                    lustre@attribute:attribute(
                                                                                                                        <<"data-body"/utf8>>,
                                                                                                                        gleam@string:concat(
                                                                                                                            Body
                                                                                                                        )
                                                                                                                    )],
                                                                                                                []
                                                                                                            )}
                                                                                                    )
                                                                                            end
                                                                                        end
                                                                                    )
                                                                                end
                                                                            )
                                                                        end
                                                                    )
                                                                end)
                                                        end
                                                    )
                                                end
                                            )
                                        end
                                    )
                                end
                            )
                        )
                    end
                )),
                Src
            ),
            case Res@1 of
                {ok, T} ->
                    {parse_result, T, []};

                {error, Err} ->
                    case Err of
                        {unexpected, Party_pos@1, S} ->
                            {parse_result,
                                none,
                                [{parse_error,
                                        {position,
                                            erlang:element(2, Pos) + erlang:element(
                                                2,
                                                Party_pos@1
                                            ),
                                            erlang:element(3, Pos) + erlang:element(
                                                3,
                                                Party_pos@1
                                            )},
                                        S}]};

                        {user_error, Party_pos@2, Err@1} ->
                            {parse_result,
                                none,
                                [{parse_error,
                                        {position,
                                            erlang:element(2, Pos) + erlang:element(
                                                2,
                                                Party_pos@2
                                            ),
                                            erlang:element(3, Pos) + erlang:element(
                                                3,
                                                Party_pos@2
                                            )},
                                        erlang:element(2, Err@1)}]}
                    end
            end
        end}.

-spec parse_page(
    list(inline_rule()),
    list(prefix_rule()),
    list(component()),
    binary()
) -> {ok, parse_result(parsed_page())} | {error, snag:snag()}.
parse_page(Inline_rules, Prefix_rules, Components, Src) ->
    Graphemes = gleam@string:to_graphemes(Src),
    {Last_sec, Sections_rev, Last_sec_line, _, _} = gleam@list:fold(
        Graphemes,
        {<<""/utf8>>, [], 0, 0, false},
        fun(So_far, C) ->
            {Sec, Secs, Sec_line, Curr_line, Was_newline} = So_far,
            case C of
                <<"\n"/utf8>> when Was_newline ->
                    {<<""/utf8>>,
                        [{Sec_line, Sec} | Secs],
                        Curr_line + 1,
                        Curr_line + 1,
                        true};

                <<"\n"/utf8>> ->
                    {<<Sec/binary, "\n"/utf8>>,
                        Secs,
                        Sec_line,
                        Curr_line + 1,
                        true};

                _ ->
                    {<<Sec/binary, C/binary>>, Secs, Sec_line, Curr_line, false}
            end
        end
    ),
    Sections = case Last_sec of
        <<""/utf8>> ->
            lists:reverse(Sections_rev);

        _ ->
            lists:reverse([{Last_sec_line, Last_sec} | Sections_rev])
    end,
    gleam@result:'try'(case Sections of
            [] ->
                snag:error(<<"empty page"/utf8>>);

            [H | T] ->
                {ok, {H, T}}
        end, fun(_use0) ->
            {{_, Meta_sec}, Body} = _use0,
            Meta_res = party:go(parse_metadata(gleam@dict:new()), Meta_sec),
            Body_res = gleam@list:map(
                Body,
                fun(Sec@1) ->
                    {Line, Str} = Sec@1,
                    case gleam@string:starts_with(Str, <<"@"/utf8>>) of
                        true ->
                            (erlang:element(2, parse_component(Components)))(
                                Str,
                                {position, Line, 0}
                            );

                        false ->
                            (erlang:element(
                                2,
                                parse_text(Inline_rules, Prefix_rules)
                            ))(Str, {position, Line, 0})
                    end
                end
            ),
            {Body_ast_rev, Body_errors_rev} = gleam@list:fold(
                Body_res,
                {[], []},
                fun(So_far@1, Res) ->
                    {Ast_so_far, Errors_so_far} = So_far@1,
                    {[erlang:element(2, Res) | Ast_so_far],
                        lists:append(erlang:element(3, Res), Errors_so_far)}
                end
            ),
            Metadata = case Meta_res of
                {ok, Sec@2} ->
                    {parse_result, Sec@2, []};

                {error, Err} ->
                    case Err of
                        {unexpected, Pos, S} ->
                            {parse_result,
                                gleam@dict:new(),
                                [{parse_error,
                                        {position,
                                            erlang:element(2, Pos),
                                            erlang:element(3, Pos)},
                                        S}]};

                        {user_error, Pos@1, Err@1} ->
                            {parse_result,
                                gleam@dict:new(),
                                [{parse_error,
                                        {position,
                                            erlang:element(2, Pos@1),
                                            erlang:element(3, Pos@1)},
                                        erlang:element(2, Err@1)}]}
                    end
            end,
            {ok,
                {parse_result,
                    {parsed_page,
                        erlang:element(2, Metadata),
                        lists:reverse(Body_ast_rev)},
                    lists:append(
                        erlang:element(3, Metadata),
                        lists:reverse(Body_errors_rev)
                    )}}
        end).

-spec parse(parser_builder(), binary()) -> {ok, arctic:page()} |
    {error, snag:snag()}.
parse(P, Src) ->
    gleam@result:'try'(
        parse_page(
            erlang:element(2, P),
            erlang:element(3, P),
            erlang:element(4, P),
            Src
        ),
        fun(Parsed) -> case erlang:element(3, Parsed) of
                [First_e | Rest] ->
                    snag:error(
                        <<<<"parse errors in `___` ("/utf8,
                                (gleam@list:fold(
                                    Rest,
                                    <<<<<<<<<<"unexpected "/utf8,
                                                        (erlang:element(
                                                            3,
                                                            First_e
                                                        ))/binary>>/binary,
                                                    " at "/utf8>>/binary,
                                                (gleam@int:to_string(
                                                    erlang:element(
                                                        2,
                                                        erlang:element(
                                                            2,
                                                            First_e
                                                        )
                                                    )
                                                ))/binary>>/binary,
                                            ":"/utf8>>/binary,
                                        (gleam@int:to_string(
                                            erlang:element(
                                                3,
                                                erlang:element(2, First_e)
                                            )
                                        ))/binary>>,
                                    fun(S, E) ->
                                        <<<<<<<<<<<<S/binary,
                                                                ", unexpected "/utf8>>/binary,
                                                            (erlang:element(
                                                                3,
                                                                E
                                                            ))/binary>>/binary,
                                                        " at "/utf8>>/binary,
                                                    (gleam@int:to_string(
                                                        erlang:element(
                                                            2,
                                                            erlang:element(2, E)
                                                        )
                                                    ))/binary>>/binary,
                                                ":"/utf8>>/binary,
                                            (gleam@int:to_string(
                                                erlang:element(
                                                    3,
                                                    erlang:element(2, E)
                                                )
                                            ))/binary>>
                                    end
                                ))/binary>>/binary,
                            ")"/utf8>>
                    );

                [] ->
                    gleam@result:'try'(
                        begin
                            _pipe = gleam@dict:get(
                                erlang:element(2, erlang:element(2, Parsed)),
                                <<"id"/utf8>>
                            ),
                            gleam@result:map_error(
                                _pipe,
                                fun(_) ->
                                    snag:new(<<"no `id` field present"/utf8>>)
                                end
                            )
                        end,
                        fun(Id) ->
                            gleam@result:'try'(
                                case gleam@dict:get(
                                    erlang:element(2, erlang:element(2, Parsed)),
                                    <<"date"/utf8>>
                                ) of
                                    {ok, S@1} ->
                                        gleam@result:'try'(
                                            begin
                                                _pipe@1 = birl:parse(S@1),
                                                gleam@result:map_error(
                                                    _pipe@1,
                                                    fun(_) ->
                                                        snag:new(
                                                            <<<<"couldn't parse date `"/utf8,
                                                                    S@1/binary>>/binary,
                                                                "`"/utf8>>
                                                        )
                                                    end
                                                )
                                            end,
                                            fun(D) -> {ok, {some, D}} end
                                        );

                                    {error, nil} ->
                                        {ok, none}
                                end,
                                fun(Date) -> _pipe@2 = arctic@page:new(Id),
                                    _pipe@3 = arctic@page:with_blerb(
                                        _pipe@2,
                                        gleam@result:unwrap(
                                            gleam@dict:get(
                                                erlang:element(
                                                    2,
                                                    erlang:element(2, Parsed)
                                                ),
                                                <<"blerb"/utf8>>
                                            ),
                                            <<""/utf8>>
                                        )
                                    ),
                                    _pipe@4 = arctic@page:with_tags(
                                        _pipe@3,
                                        gleam@result:unwrap(
                                            gleam@result:map(
                                                gleam@dict:get(
                                                    erlang:element(
                                                        2,
                                                        erlang:element(
                                                            2,
                                                            Parsed
                                                        )
                                                    ),
                                                    <<"tags"/utf8>>
                                                ),
                                                fun(_capture) ->
                                                    gleam@string:split(
                                                        _capture,
                                                        <<","/utf8>>
                                                    )
                                                end
                                            ),
                                            []
                                        )
                                    ),
                                    _pipe@5 = (fun(P@1) -> case Date of
                                            {some, D@1} ->
                                                arctic@page:with_date(P@1, D@1);

                                            none ->
                                                P@1
                                        end end)(_pipe@4),
                                    _pipe@6 = arctic@page:with_title(
                                        _pipe@5,
                                        gleam@result:unwrap(
                                            gleam@dict:get(
                                                erlang:element(
                                                    2,
                                                    erlang:element(2, Parsed)
                                                ),
                                                <<"title"/utf8>>
                                            ),
                                            <<""/utf8>>
                                        )
                                    ),
                                    _pipe@7 = arctic@page:with_body(
                                        _pipe@6,
                                        gleam@list:map(
                                            erlang:element(
                                                3,
                                                erlang:element(2, Parsed)
                                            ),
                                            fun(Section) -> case Section of
                                                    {some, El} ->
                                                        El;

                                                    none ->
                                                        lustre@element@html:'div'(
                                                            [lustre@attribute:class(
                                                                    <<"arctic-failed-parse"/utf8>>
                                                                )],
                                                            []
                                                        )
                                                end end
                                        )
                                    ),
                                    {ok, _pipe@7} end
                            )
                        end
                    )
            end end
    ).
