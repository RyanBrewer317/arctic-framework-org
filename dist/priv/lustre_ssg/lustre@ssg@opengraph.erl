-module(lustre@ssg@opengraph).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch]).

-export([title/1, website/0, url/1, description/1, site_name/1, image/1, image_type/1, image_width/1, image_height/1, image_alt/1]).

-spec title(binary()) -> lustre@internals@vdom:element(any()).
title(Text) ->
    lustre@element@html:meta(
        [lustre@attribute:attribute(<<"property"/utf8>>, <<"og:title"/utf8>>),
            lustre@attribute:content(Text)]
    ).

-spec website() -> lustre@internals@vdom:element(any()).
website() ->
    lustre@element@html:meta(
        [lustre@attribute:attribute(<<"property"/utf8>>, <<"og:type"/utf8>>),
            lustre@attribute:content(<<"website"/utf8>>)]
    ).

-spec url(gleam@uri:uri()) -> lustre@internals@vdom:element(any()).
url(Content) ->
    lustre@element@html:meta(
        [lustre@attribute:attribute(<<"property"/utf8>>, <<"og:url"/utf8>>),
            lustre@attribute:content(gleam@uri:to_string(Content))]
    ).

-spec description(binary()) -> lustre@internals@vdom:element(any()).
description(Content) ->
    lustre@element@html:meta(
        [lustre@attribute:attribute(
                <<"property"/utf8>>,
                <<"og:description"/utf8>>
            ),
            lustre@attribute:content(Content)]
    ).

-spec site_name(binary()) -> lustre@internals@vdom:element(any()).
site_name(Content) ->
    lustre@element@html:meta(
        [lustre@attribute:attribute(
                <<"property"/utf8>>,
                <<"og:site_name"/utf8>>
            ),
            lustre@attribute:content(Content)]
    ).

-spec image(gleam@uri:uri()) -> lustre@internals@vdom:element(any()).
image(Content) ->
    lustre@element@html:meta(
        [lustre@attribute:attribute(<<"property"/utf8>>, <<"og:image"/utf8>>),
            lustre@attribute:content(gleam@uri:to_string(Content))]
    ).

-spec image_type(binary()) -> lustre@internals@vdom:element(any()).
image_type(Content) ->
    lustre@element@html:meta(
        [lustre@attribute:attribute(
                <<"property"/utf8>>,
                <<"og:image:type"/utf8>>
            ),
            lustre@attribute:content(Content)]
    ).

-spec image_width(integer()) -> lustre@internals@vdom:element(any()).
image_width(Content) ->
    lustre@element@html:meta(
        [lustre@attribute:attribute(
                <<"property"/utf8>>,
                <<"og:image:width"/utf8>>
            ),
            lustre@attribute:content(erlang:integer_to_binary(Content))]
    ).

-spec image_height(integer()) -> lustre@internals@vdom:element(any()).
image_height(Content) ->
    lustre@element@html:meta(
        [lustre@attribute:attribute(
                <<"property"/utf8>>,
                <<"og:image:height"/utf8>>
            ),
            lustre@attribute:content(erlang:integer_to_binary(Content))]
    ).

-spec image_alt(binary()) -> lustre@internals@vdom:element(any()).
image_alt(Content) ->
    lustre@element@html:meta(
        [lustre@attribute:attribute(
                <<"property"/utf8>>,
                <<"og:image:alt"/utf8>>
            ),
            lustre@attribute:content(Content)]
    ).
