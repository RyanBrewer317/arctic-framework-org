-module(lustre@ssg@atom).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch]).

-export([feed/2, entry/2, id/2, title/2, updated/2, published/2, author/2, contributor/2, source/2, link/1, name/2, email/2, uri/2, category/1, generator/2, icon/2, logo/2, rights/2, subtitle/2, summary/2, content/2]).

-spec feed(
    list(lustre@internals@vdom:attribute(QAR)),
    list(lustre@internals@vdom:element(QAR))
) -> lustre@internals@vdom:element(QAR).
feed(Attrs, Children) ->
    lustre@element:element(
        <<"feed"/utf8>>,
        [lustre@attribute:attribute(
                <<"xmlns"/utf8>>,
                <<"http://www.w3.org/2005/Atom"/utf8>>
            ) |
            Attrs],
        Children
    ).

-spec entry(
    list(lustre@internals@vdom:attribute(QAX)),
    list(lustre@internals@vdom:element(QAX))
) -> lustre@internals@vdom:element(QAX).
entry(Attrs, Children) ->
    lustre@element:element(<<"entry"/utf8>>, Attrs, Children).

-spec id(list(lustre@internals@vdom:attribute(QBD)), binary()) -> lustre@internals@vdom:element(QBD).
id(Attrs, Uri) ->
    lustre@element:element(<<"id"/utf8>>, Attrs, [lustre@element:text(Uri)]).

-spec title(list(lustre@internals@vdom:attribute(QBH)), binary()) -> lustre@internals@vdom:element(QBH).
title(Attrs, Title) ->
    lustre@element:element(
        <<"title"/utf8>>,
        [lustre@attribute:attribute(<<"type"/utf8>>, <<"html"/utf8>>) | Attrs],
        [lustre@element:text(Title)]
    ).

-spec updated(list(lustre@internals@vdom:attribute(QBL)), binary()) -> lustre@internals@vdom:element(QBL).
updated(Attrs, Iso_timestamp) ->
    lustre@element:element(
        <<"updated"/utf8>>,
        Attrs,
        [lustre@element:text(Iso_timestamp)]
    ).

-spec published(list(lustre@internals@vdom:attribute(QBP)), binary()) -> lustre@internals@vdom:element(QBP).
published(Attrs, Iso_timestamp) ->
    lustre@element:element(
        <<"published"/utf8>>,
        Attrs,
        [lustre@element:text(Iso_timestamp)]
    ).

-spec author(
    list(lustre@internals@vdom:attribute(QBT)),
    list(lustre@internals@vdom:element(QBT))
) -> lustre@internals@vdom:element(QBT).
author(Attrs, Children) ->
    lustre@element:element(<<"author"/utf8>>, Attrs, Children).

-spec contributor(
    list(lustre@internals@vdom:attribute(QBZ)),
    list(lustre@internals@vdom:element(QBZ))
) -> lustre@internals@vdom:element(QBZ).
contributor(Attrs, Children) ->
    lustre@element:element(<<"contributor"/utf8>>, Attrs, Children).

-spec source(
    list(lustre@internals@vdom:attribute(QCF)),
    list(lustre@internals@vdom:element(QCF))
) -> lustre@internals@vdom:element(QCF).
source(Attrs, Children) ->
    lustre@element:element(<<"source"/utf8>>, Attrs, Children).

-spec link(list(lustre@internals@vdom:attribute(QCL))) -> lustre@internals@vdom:element(QCL).
link(Attrs) ->
    lustre@element:advanced(
        <<""/utf8>>,
        <<"link"/utf8>>,
        Attrs,
        [],
        true,
        false
    ).

-spec name(list(lustre@internals@vdom:attribute(QCP)), binary()) -> lustre@internals@vdom:element(QCP).
name(Attrs, Name) ->
    lustre@element:element(<<"name"/utf8>>, Attrs, [lustre@element:text(Name)]).

-spec email(list(lustre@internals@vdom:attribute(QCT)), binary()) -> lustre@internals@vdom:element(QCT).
email(Attrs, Email) ->
    lustre@element:element(
        <<"email"/utf8>>,
        Attrs,
        [lustre@element:text(Email)]
    ).

-spec uri(list(lustre@internals@vdom:attribute(QCX)), binary()) -> lustre@internals@vdom:element(QCX).
uri(Attrs, Uri) ->
    lustre@element:element(<<"uri"/utf8>>, Attrs, [lustre@element:text(Uri)]).

-spec category(list(lustre@internals@vdom:attribute(QDB))) -> lustre@internals@vdom:element(QDB).
category(Attrs) ->
    lustre@element:advanced(
        <<""/utf8>>,
        <<"category"/utf8>>,
        Attrs,
        [],
        true,
        false
    ).

-spec generator(list(lustre@internals@vdom:attribute(QDF)), binary()) -> lustre@internals@vdom:element(QDF).
generator(Attrs, Name) ->
    lustre@element:element(
        <<"generator"/utf8>>,
        Attrs,
        [lustre@element:text(Name)]
    ).

-spec icon(list(lustre@internals@vdom:attribute(QDJ)), binary()) -> lustre@internals@vdom:element(QDJ).
icon(Attrs, Path) ->
    lustre@element:element(<<"icon"/utf8>>, Attrs, [lustre@element:text(Path)]).

-spec logo(list(lustre@internals@vdom:attribute(QDN)), binary()) -> lustre@internals@vdom:element(QDN).
logo(Attrs, Path) ->
    lustre@element:element(<<"logo"/utf8>>, Attrs, [lustre@element:text(Path)]).

-spec rights(list(lustre@internals@vdom:attribute(QDR)), binary()) -> lustre@internals@vdom:element(QDR).
rights(Attrs, Rights) ->
    lustre@element:element(
        <<"rights"/utf8>>,
        Attrs,
        [lustre@element:text(Rights)]
    ).

-spec subtitle(list(lustre@internals@vdom:attribute(QDV)), binary()) -> lustre@internals@vdom:element(QDV).
subtitle(Attrs, Subtitle) ->
    lustre@element:element(
        <<"subtitle"/utf8>>,
        [lustre@attribute:attribute(<<"type"/utf8>>, <<"html"/utf8>>) | Attrs],
        [lustre@element:text(Subtitle)]
    ).

-spec summary(list(lustre@internals@vdom:attribute(QDZ)), binary()) -> lustre@internals@vdom:element(QDZ).
summary(Attrs, Summary) ->
    lustre@element:element(
        <<"summary"/utf8>>,
        [lustre@attribute:attribute(<<"type"/utf8>>, <<"html"/utf8>>) | Attrs],
        [lustre@element:text(Summary)]
    ).

-spec content(list(lustre@internals@vdom:attribute(QED)), binary()) -> lustre@internals@vdom:element(QED).
content(Attrs, Content) ->
    lustre@element:element(
        <<"content"/utf8>>,
        [lustre@attribute:attribute(<<"type"/utf8>>, <<"html"/utf8>>) | Attrs],
        [lustre@element:text(Content)]
    ).
