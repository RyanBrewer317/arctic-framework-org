-module(lustre@element@html).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch]).

-export([html/2, text/1, base/1, head/2, link/1, meta/1, style/2, title/2, body/2, address/2, article/2, aside/2, footer/2, header/2, h1/2, h2/2, h3/2, h4/2, h5/2, h6/2, hgroup/2, main/2, nav/2, section/2, search/2, blockquote/2, dd/2, 'div'/2, dl/2, dt/2, figcaption/2, figure/2, hr/1, li/2, menu/2, ol/2, p/2, pre/2, ul/2, a/2, abbr/2, b/2, bdi/2, bdo/2, br/1, cite/2, code/2, data/2, dfn/2, em/2, i/2, kbd/2, mark/2, q/2, rp/2, rt/2, ruby/2, s/2, samp/2, small/2, span/2, strong/2, sub/2, sup/2, time/2, u/2, var/2, wbr/1, area/1, audio/2, img/1, map/2, track/1, video/2, embed/1, iframe/1, object/1, picture/2, portal/1, source/1, svg/2, math/2, canvas/1, noscript/2, script/2, del/2, ins/2, caption/2, col/1, colgroup/2, table/2, tbody/2, td/2, tfoot/2, th/2, thead/2, tr/2, button/2, datalist/2, fieldset/2, form/2, input/1, label/2, legend/2, meter/2, optgroup/2, option/2, output/2, progress/2, select/2, textarea/2, details/2, dialog/2, summary/2, slot/1, template/2]).

-spec html(
    list(lustre@internals@vdom:attribute(PVD)),
    list(lustre@internals@vdom:element(PVD))
) -> lustre@internals@vdom:element(PVD).
html(Attrs, Children) ->
    lustre@element:element(<<"html"/utf8>>, Attrs, Children).

-spec text(binary()) -> lustre@internals@vdom:element(any()).
text(Content) ->
    lustre@element:text(Content).

-spec base(list(lustre@internals@vdom:attribute(PVL))) -> lustre@internals@vdom:element(PVL).
base(Attrs) ->
    lustre@element:element(<<"base"/utf8>>, Attrs, []).

-spec head(
    list(lustre@internals@vdom:attribute(PVP)),
    list(lustre@internals@vdom:element(PVP))
) -> lustre@internals@vdom:element(PVP).
head(Attrs, Children) ->
    lustre@element:element(<<"head"/utf8>>, Attrs, Children).

-spec link(list(lustre@internals@vdom:attribute(PVV))) -> lustre@internals@vdom:element(PVV).
link(Attrs) ->
    lustre@element:element(<<"link"/utf8>>, Attrs, []).

-spec meta(list(lustre@internals@vdom:attribute(PVZ))) -> lustre@internals@vdom:element(PVZ).
meta(Attrs) ->
    lustre@element:element(<<"meta"/utf8>>, Attrs, []).

-spec style(list(lustre@internals@vdom:attribute(PWD)), binary()) -> lustre@internals@vdom:element(PWD).
style(Attrs, Css) ->
    lustre@element:element(<<"style"/utf8>>, Attrs, [text(Css)]).

-spec title(list(lustre@internals@vdom:attribute(PWH)), binary()) -> lustre@internals@vdom:element(PWH).
title(Attrs, Content) ->
    lustre@element:element(<<"title"/utf8>>, Attrs, [text(Content)]).

-spec body(
    list(lustre@internals@vdom:attribute(PWL)),
    list(lustre@internals@vdom:element(PWL))
) -> lustre@internals@vdom:element(PWL).
body(Attrs, Children) ->
    lustre@element:element(<<"body"/utf8>>, Attrs, Children).

-spec address(
    list(lustre@internals@vdom:attribute(PWR)),
    list(lustre@internals@vdom:element(PWR))
) -> lustre@internals@vdom:element(PWR).
address(Attrs, Children) ->
    lustre@element:element(<<"address"/utf8>>, Attrs, Children).

-spec article(
    list(lustre@internals@vdom:attribute(PWX)),
    list(lustre@internals@vdom:element(PWX))
) -> lustre@internals@vdom:element(PWX).
article(Attrs, Children) ->
    lustre@element:element(<<"article"/utf8>>, Attrs, Children).

-spec aside(
    list(lustre@internals@vdom:attribute(PXD)),
    list(lustre@internals@vdom:element(PXD))
) -> lustre@internals@vdom:element(PXD).
aside(Attrs, Children) ->
    lustre@element:element(<<"aside"/utf8>>, Attrs, Children).

-spec footer(
    list(lustre@internals@vdom:attribute(PXJ)),
    list(lustre@internals@vdom:element(PXJ))
) -> lustre@internals@vdom:element(PXJ).
footer(Attrs, Children) ->
    lustre@element:element(<<"footer"/utf8>>, Attrs, Children).

-spec header(
    list(lustre@internals@vdom:attribute(PXP)),
    list(lustre@internals@vdom:element(PXP))
) -> lustre@internals@vdom:element(PXP).
header(Attrs, Children) ->
    lustre@element:element(<<"header"/utf8>>, Attrs, Children).

-spec h1(
    list(lustre@internals@vdom:attribute(PXV)),
    list(lustre@internals@vdom:element(PXV))
) -> lustre@internals@vdom:element(PXV).
h1(Attrs, Children) ->
    lustre@element:element(<<"h1"/utf8>>, Attrs, Children).

-spec h2(
    list(lustre@internals@vdom:attribute(PYB)),
    list(lustre@internals@vdom:element(PYB))
) -> lustre@internals@vdom:element(PYB).
h2(Attrs, Children) ->
    lustre@element:element(<<"h2"/utf8>>, Attrs, Children).

-spec h3(
    list(lustre@internals@vdom:attribute(PYH)),
    list(lustre@internals@vdom:element(PYH))
) -> lustre@internals@vdom:element(PYH).
h3(Attrs, Children) ->
    lustre@element:element(<<"h3"/utf8>>, Attrs, Children).

-spec h4(
    list(lustre@internals@vdom:attribute(PYN)),
    list(lustre@internals@vdom:element(PYN))
) -> lustre@internals@vdom:element(PYN).
h4(Attrs, Children) ->
    lustre@element:element(<<"h4"/utf8>>, Attrs, Children).

-spec h5(
    list(lustre@internals@vdom:attribute(PYT)),
    list(lustre@internals@vdom:element(PYT))
) -> lustre@internals@vdom:element(PYT).
h5(Attrs, Children) ->
    lustre@element:element(<<"h5"/utf8>>, Attrs, Children).

-spec h6(
    list(lustre@internals@vdom:attribute(PYZ)),
    list(lustre@internals@vdom:element(PYZ))
) -> lustre@internals@vdom:element(PYZ).
h6(Attrs, Children) ->
    lustre@element:element(<<"h6"/utf8>>, Attrs, Children).

-spec hgroup(
    list(lustre@internals@vdom:attribute(PZF)),
    list(lustre@internals@vdom:element(PZF))
) -> lustre@internals@vdom:element(PZF).
hgroup(Attrs, Children) ->
    lustre@element:element(<<"hgroup"/utf8>>, Attrs, Children).

-spec main(
    list(lustre@internals@vdom:attribute(PZL)),
    list(lustre@internals@vdom:element(PZL))
) -> lustre@internals@vdom:element(PZL).
main(Attrs, Children) ->
    lustre@element:element(<<"main"/utf8>>, Attrs, Children).

-spec nav(
    list(lustre@internals@vdom:attribute(PZR)),
    list(lustre@internals@vdom:element(PZR))
) -> lustre@internals@vdom:element(PZR).
nav(Attrs, Children) ->
    lustre@element:element(<<"nav"/utf8>>, Attrs, Children).

-spec section(
    list(lustre@internals@vdom:attribute(PZX)),
    list(lustre@internals@vdom:element(PZX))
) -> lustre@internals@vdom:element(PZX).
section(Attrs, Children) ->
    lustre@element:element(<<"section"/utf8>>, Attrs, Children).

-spec search(
    list(lustre@internals@vdom:attribute(QAD)),
    list(lustre@internals@vdom:element(QAD))
) -> lustre@internals@vdom:element(QAD).
search(Attrs, Children) ->
    lustre@element:element(<<"search"/utf8>>, Attrs, Children).

-spec blockquote(
    list(lustre@internals@vdom:attribute(QAJ)),
    list(lustre@internals@vdom:element(QAJ))
) -> lustre@internals@vdom:element(QAJ).
blockquote(Attrs, Children) ->
    lustre@element:element(<<"blockquote"/utf8>>, Attrs, Children).

-spec dd(
    list(lustre@internals@vdom:attribute(QAP)),
    list(lustre@internals@vdom:element(QAP))
) -> lustre@internals@vdom:element(QAP).
dd(Attrs, Children) ->
    lustre@element:element(<<"dd"/utf8>>, Attrs, Children).

-spec 'div'(
    list(lustre@internals@vdom:attribute(QAV)),
    list(lustre@internals@vdom:element(QAV))
) -> lustre@internals@vdom:element(QAV).
'div'(Attrs, Children) ->
    lustre@element:element(<<"div"/utf8>>, Attrs, Children).

-spec dl(
    list(lustre@internals@vdom:attribute(QBB)),
    list(lustre@internals@vdom:element(QBB))
) -> lustre@internals@vdom:element(QBB).
dl(Attrs, Children) ->
    lustre@element:element(<<"dl"/utf8>>, Attrs, Children).

-spec dt(
    list(lustre@internals@vdom:attribute(QBH)),
    list(lustre@internals@vdom:element(QBH))
) -> lustre@internals@vdom:element(QBH).
dt(Attrs, Children) ->
    lustre@element:element(<<"dt"/utf8>>, Attrs, Children).

-spec figcaption(
    list(lustre@internals@vdom:attribute(QBN)),
    list(lustre@internals@vdom:element(QBN))
) -> lustre@internals@vdom:element(QBN).
figcaption(Attrs, Children) ->
    lustre@element:element(<<"figcaption"/utf8>>, Attrs, Children).

-spec figure(
    list(lustre@internals@vdom:attribute(QBT)),
    list(lustre@internals@vdom:element(QBT))
) -> lustre@internals@vdom:element(QBT).
figure(Attrs, Children) ->
    lustre@element:element(<<"figure"/utf8>>, Attrs, Children).

-spec hr(list(lustre@internals@vdom:attribute(QBZ))) -> lustre@internals@vdom:element(QBZ).
hr(Attrs) ->
    lustre@element:element(<<"hr"/utf8>>, Attrs, []).

-spec li(
    list(lustre@internals@vdom:attribute(QCD)),
    list(lustre@internals@vdom:element(QCD))
) -> lustre@internals@vdom:element(QCD).
li(Attrs, Children) ->
    lustre@element:element(<<"li"/utf8>>, Attrs, Children).

-spec menu(
    list(lustre@internals@vdom:attribute(QCJ)),
    list(lustre@internals@vdom:element(QCJ))
) -> lustre@internals@vdom:element(QCJ).
menu(Attrs, Children) ->
    lustre@element:element(<<"menu"/utf8>>, Attrs, Children).

-spec ol(
    list(lustre@internals@vdom:attribute(QCP)),
    list(lustre@internals@vdom:element(QCP))
) -> lustre@internals@vdom:element(QCP).
ol(Attrs, Children) ->
    lustre@element:element(<<"ol"/utf8>>, Attrs, Children).

-spec p(
    list(lustre@internals@vdom:attribute(QCV)),
    list(lustre@internals@vdom:element(QCV))
) -> lustre@internals@vdom:element(QCV).
p(Attrs, Children) ->
    lustre@element:element(<<"p"/utf8>>, Attrs, Children).

-spec pre(
    list(lustre@internals@vdom:attribute(QDB)),
    list(lustre@internals@vdom:element(QDB))
) -> lustre@internals@vdom:element(QDB).
pre(Attrs, Children) ->
    lustre@element:element(<<"pre"/utf8>>, Attrs, Children).

-spec ul(
    list(lustre@internals@vdom:attribute(QDH)),
    list(lustre@internals@vdom:element(QDH))
) -> lustre@internals@vdom:element(QDH).
ul(Attrs, Children) ->
    lustre@element:element(<<"ul"/utf8>>, Attrs, Children).

-spec a(
    list(lustre@internals@vdom:attribute(QDN)),
    list(lustre@internals@vdom:element(QDN))
) -> lustre@internals@vdom:element(QDN).
a(Attrs, Children) ->
    lustre@element:element(<<"a"/utf8>>, Attrs, Children).

-spec abbr(
    list(lustre@internals@vdom:attribute(QDT)),
    list(lustre@internals@vdom:element(QDT))
) -> lustre@internals@vdom:element(QDT).
abbr(Attrs, Children) ->
    lustre@element:element(<<"abbr"/utf8>>, Attrs, Children).

-spec b(
    list(lustre@internals@vdom:attribute(QDZ)),
    list(lustre@internals@vdom:element(QDZ))
) -> lustre@internals@vdom:element(QDZ).
b(Attrs, Children) ->
    lustre@element:element(<<"b"/utf8>>, Attrs, Children).

-spec bdi(
    list(lustre@internals@vdom:attribute(QEF)),
    list(lustre@internals@vdom:element(QEF))
) -> lustre@internals@vdom:element(QEF).
bdi(Attrs, Children) ->
    lustre@element:element(<<"bdi"/utf8>>, Attrs, Children).

-spec bdo(
    list(lustre@internals@vdom:attribute(QEL)),
    list(lustre@internals@vdom:element(QEL))
) -> lustre@internals@vdom:element(QEL).
bdo(Attrs, Children) ->
    lustre@element:element(<<"bdo"/utf8>>, Attrs, Children).

-spec br(list(lustre@internals@vdom:attribute(QER))) -> lustre@internals@vdom:element(QER).
br(Attrs) ->
    lustre@element:element(<<"br"/utf8>>, Attrs, []).

-spec cite(
    list(lustre@internals@vdom:attribute(QEV)),
    list(lustre@internals@vdom:element(QEV))
) -> lustre@internals@vdom:element(QEV).
cite(Attrs, Children) ->
    lustre@element:element(<<"cite"/utf8>>, Attrs, Children).

-spec code(
    list(lustre@internals@vdom:attribute(QFB)),
    list(lustre@internals@vdom:element(QFB))
) -> lustre@internals@vdom:element(QFB).
code(Attrs, Children) ->
    lustre@element:element(<<"code"/utf8>>, Attrs, Children).

-spec data(
    list(lustre@internals@vdom:attribute(QFH)),
    list(lustre@internals@vdom:element(QFH))
) -> lustre@internals@vdom:element(QFH).
data(Attrs, Children) ->
    lustre@element:element(<<"data"/utf8>>, Attrs, Children).

-spec dfn(
    list(lustre@internals@vdom:attribute(QFN)),
    list(lustre@internals@vdom:element(QFN))
) -> lustre@internals@vdom:element(QFN).
dfn(Attrs, Children) ->
    lustre@element:element(<<"dfn"/utf8>>, Attrs, Children).

-spec em(
    list(lustre@internals@vdom:attribute(QFT)),
    list(lustre@internals@vdom:element(QFT))
) -> lustre@internals@vdom:element(QFT).
em(Attrs, Children) ->
    lustre@element:element(<<"em"/utf8>>, Attrs, Children).

-spec i(
    list(lustre@internals@vdom:attribute(QFZ)),
    list(lustre@internals@vdom:element(QFZ))
) -> lustre@internals@vdom:element(QFZ).
i(Attrs, Children) ->
    lustre@element:element(<<"i"/utf8>>, Attrs, Children).

-spec kbd(
    list(lustre@internals@vdom:attribute(QGF)),
    list(lustre@internals@vdom:element(QGF))
) -> lustre@internals@vdom:element(QGF).
kbd(Attrs, Children) ->
    lustre@element:element(<<"kbd"/utf8>>, Attrs, Children).

-spec mark(
    list(lustre@internals@vdom:attribute(QGL)),
    list(lustre@internals@vdom:element(QGL))
) -> lustre@internals@vdom:element(QGL).
mark(Attrs, Children) ->
    lustre@element:element(<<"mark"/utf8>>, Attrs, Children).

-spec q(
    list(lustre@internals@vdom:attribute(QGR)),
    list(lustre@internals@vdom:element(QGR))
) -> lustre@internals@vdom:element(QGR).
q(Attrs, Children) ->
    lustre@element:element(<<"q"/utf8>>, Attrs, Children).

-spec rp(
    list(lustre@internals@vdom:attribute(QGX)),
    list(lustre@internals@vdom:element(QGX))
) -> lustre@internals@vdom:element(QGX).
rp(Attrs, Children) ->
    lustre@element:element(<<"rp"/utf8>>, Attrs, Children).

-spec rt(
    list(lustre@internals@vdom:attribute(QHD)),
    list(lustre@internals@vdom:element(QHD))
) -> lustre@internals@vdom:element(QHD).
rt(Attrs, Children) ->
    lustre@element:element(<<"rt"/utf8>>, Attrs, Children).

-spec ruby(
    list(lustre@internals@vdom:attribute(QHJ)),
    list(lustre@internals@vdom:element(QHJ))
) -> lustre@internals@vdom:element(QHJ).
ruby(Attrs, Children) ->
    lustre@element:element(<<"ruby"/utf8>>, Attrs, Children).

-spec s(
    list(lustre@internals@vdom:attribute(QHP)),
    list(lustre@internals@vdom:element(QHP))
) -> lustre@internals@vdom:element(QHP).
s(Attrs, Children) ->
    lustre@element:element(<<"s"/utf8>>, Attrs, Children).

-spec samp(
    list(lustre@internals@vdom:attribute(QHV)),
    list(lustre@internals@vdom:element(QHV))
) -> lustre@internals@vdom:element(QHV).
samp(Attrs, Children) ->
    lustre@element:element(<<"samp"/utf8>>, Attrs, Children).

-spec small(
    list(lustre@internals@vdom:attribute(QIB)),
    list(lustre@internals@vdom:element(QIB))
) -> lustre@internals@vdom:element(QIB).
small(Attrs, Children) ->
    lustre@element:element(<<"small"/utf8>>, Attrs, Children).

-spec span(
    list(lustre@internals@vdom:attribute(QIH)),
    list(lustre@internals@vdom:element(QIH))
) -> lustre@internals@vdom:element(QIH).
span(Attrs, Children) ->
    lustre@element:element(<<"span"/utf8>>, Attrs, Children).

-spec strong(
    list(lustre@internals@vdom:attribute(QIN)),
    list(lustre@internals@vdom:element(QIN))
) -> lustre@internals@vdom:element(QIN).
strong(Attrs, Children) ->
    lustre@element:element(<<"strong"/utf8>>, Attrs, Children).

-spec sub(
    list(lustre@internals@vdom:attribute(QIT)),
    list(lustre@internals@vdom:element(QIT))
) -> lustre@internals@vdom:element(QIT).
sub(Attrs, Children) ->
    lustre@element:element(<<"sub"/utf8>>, Attrs, Children).

-spec sup(
    list(lustre@internals@vdom:attribute(QIZ)),
    list(lustre@internals@vdom:element(QIZ))
) -> lustre@internals@vdom:element(QIZ).
sup(Attrs, Children) ->
    lustre@element:element(<<"sup"/utf8>>, Attrs, Children).

-spec time(
    list(lustre@internals@vdom:attribute(QJF)),
    list(lustre@internals@vdom:element(QJF))
) -> lustre@internals@vdom:element(QJF).
time(Attrs, Children) ->
    lustre@element:element(<<"time"/utf8>>, Attrs, Children).

-spec u(
    list(lustre@internals@vdom:attribute(QJL)),
    list(lustre@internals@vdom:element(QJL))
) -> lustre@internals@vdom:element(QJL).
u(Attrs, Children) ->
    lustre@element:element(<<"u"/utf8>>, Attrs, Children).

-spec var(
    list(lustre@internals@vdom:attribute(QJR)),
    list(lustre@internals@vdom:element(QJR))
) -> lustre@internals@vdom:element(QJR).
var(Attrs, Children) ->
    lustre@element:element(<<"var"/utf8>>, Attrs, Children).

-spec wbr(list(lustre@internals@vdom:attribute(QJX))) -> lustre@internals@vdom:element(QJX).
wbr(Attrs) ->
    lustre@element:element(<<"wbr"/utf8>>, Attrs, []).

-spec area(list(lustre@internals@vdom:attribute(QKB))) -> lustre@internals@vdom:element(QKB).
area(Attrs) ->
    lustre@element:element(<<"area"/utf8>>, Attrs, []).

-spec audio(
    list(lustre@internals@vdom:attribute(QKF)),
    list(lustre@internals@vdom:element(QKF))
) -> lustre@internals@vdom:element(QKF).
audio(Attrs, Children) ->
    lustre@element:element(<<"audio"/utf8>>, Attrs, Children).

-spec img(list(lustre@internals@vdom:attribute(QKL))) -> lustre@internals@vdom:element(QKL).
img(Attrs) ->
    lustre@element:element(<<"img"/utf8>>, Attrs, []).

-spec map(
    list(lustre@internals@vdom:attribute(QKP)),
    list(lustre@internals@vdom:element(QKP))
) -> lustre@internals@vdom:element(QKP).
map(Attrs, Children) ->
    lustre@element:element(<<"map"/utf8>>, Attrs, Children).

-spec track(list(lustre@internals@vdom:attribute(QKV))) -> lustre@internals@vdom:element(QKV).
track(Attrs) ->
    lustre@element:element(<<"track"/utf8>>, Attrs, []).

-spec video(
    list(lustre@internals@vdom:attribute(QKZ)),
    list(lustre@internals@vdom:element(QKZ))
) -> lustre@internals@vdom:element(QKZ).
video(Attrs, Children) ->
    lustre@element:element(<<"video"/utf8>>, Attrs, Children).

-spec embed(list(lustre@internals@vdom:attribute(QLF))) -> lustre@internals@vdom:element(QLF).
embed(Attrs) ->
    lustre@element:element(<<"embed"/utf8>>, Attrs, []).

-spec iframe(list(lustre@internals@vdom:attribute(QLJ))) -> lustre@internals@vdom:element(QLJ).
iframe(Attrs) ->
    lustre@element:element(<<"iframe"/utf8>>, Attrs, []).

-spec object(list(lustre@internals@vdom:attribute(QLN))) -> lustre@internals@vdom:element(QLN).
object(Attrs) ->
    lustre@element:element(<<"object"/utf8>>, Attrs, []).

-spec picture(
    list(lustre@internals@vdom:attribute(QLR)),
    list(lustre@internals@vdom:element(QLR))
) -> lustre@internals@vdom:element(QLR).
picture(Attrs, Children) ->
    lustre@element:element(<<"picture"/utf8>>, Attrs, Children).

-spec portal(list(lustre@internals@vdom:attribute(QLX))) -> lustre@internals@vdom:element(QLX).
portal(Attrs) ->
    lustre@element:element(<<"portal"/utf8>>, Attrs, []).

-spec source(list(lustre@internals@vdom:attribute(QMB))) -> lustre@internals@vdom:element(QMB).
source(Attrs) ->
    lustre@element:element(<<"source"/utf8>>, Attrs, []).

-spec svg(
    list(lustre@internals@vdom:attribute(QMF)),
    list(lustre@internals@vdom:element(QMF))
) -> lustre@internals@vdom:element(QMF).
svg(Attrs, Children) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"svg"/utf8>>,
        Attrs,
        Children
    ).

-spec math(
    list(lustre@internals@vdom:attribute(QML)),
    list(lustre@internals@vdom:element(QML))
) -> lustre@internals@vdom:element(QML).
math(Attrs, Children) ->
    lustre@element:element(<<"math"/utf8>>, Attrs, Children).

-spec canvas(list(lustre@internals@vdom:attribute(QMR))) -> lustre@internals@vdom:element(QMR).
canvas(Attrs) ->
    lustre@element:element(<<"canvas"/utf8>>, Attrs, []).

-spec noscript(
    list(lustre@internals@vdom:attribute(QMV)),
    list(lustre@internals@vdom:element(QMV))
) -> lustre@internals@vdom:element(QMV).
noscript(Attrs, Children) ->
    lustre@element:element(<<"noscript"/utf8>>, Attrs, Children).

-spec script(list(lustre@internals@vdom:attribute(QNB)), binary()) -> lustre@internals@vdom:element(QNB).
script(Attrs, Js) ->
    lustre@element:element(<<"script"/utf8>>, Attrs, [text(Js)]).

-spec del(
    list(lustre@internals@vdom:attribute(QNF)),
    list(lustre@internals@vdom:element(QNF))
) -> lustre@internals@vdom:element(QNF).
del(Attrs, Children) ->
    lustre@element:element(<<"del"/utf8>>, Attrs, Children).

-spec ins(
    list(lustre@internals@vdom:attribute(QNL)),
    list(lustre@internals@vdom:element(QNL))
) -> lustre@internals@vdom:element(QNL).
ins(Attrs, Children) ->
    lustre@element:element(<<"ins"/utf8>>, Attrs, Children).

-spec caption(
    list(lustre@internals@vdom:attribute(QNR)),
    list(lustre@internals@vdom:element(QNR))
) -> lustre@internals@vdom:element(QNR).
caption(Attrs, Children) ->
    lustre@element:element(<<"caption"/utf8>>, Attrs, Children).

-spec col(list(lustre@internals@vdom:attribute(QNX))) -> lustre@internals@vdom:element(QNX).
col(Attrs) ->
    lustre@element:element(<<"col"/utf8>>, Attrs, []).

-spec colgroup(
    list(lustre@internals@vdom:attribute(QOB)),
    list(lustre@internals@vdom:element(QOB))
) -> lustre@internals@vdom:element(QOB).
colgroup(Attrs, Children) ->
    lustre@element:element(<<"colgroup"/utf8>>, Attrs, Children).

-spec table(
    list(lustre@internals@vdom:attribute(QOH)),
    list(lustre@internals@vdom:element(QOH))
) -> lustre@internals@vdom:element(QOH).
table(Attrs, Children) ->
    lustre@element:element(<<"table"/utf8>>, Attrs, Children).

-spec tbody(
    list(lustre@internals@vdom:attribute(QON)),
    list(lustre@internals@vdom:element(QON))
) -> lustre@internals@vdom:element(QON).
tbody(Attrs, Children) ->
    lustre@element:element(<<"tbody"/utf8>>, Attrs, Children).

-spec td(
    list(lustre@internals@vdom:attribute(QOT)),
    list(lustre@internals@vdom:element(QOT))
) -> lustre@internals@vdom:element(QOT).
td(Attrs, Children) ->
    lustre@element:element(<<"td"/utf8>>, Attrs, Children).

-spec tfoot(
    list(lustre@internals@vdom:attribute(QOZ)),
    list(lustre@internals@vdom:element(QOZ))
) -> lustre@internals@vdom:element(QOZ).
tfoot(Attrs, Children) ->
    lustre@element:element(<<"tfoot"/utf8>>, Attrs, Children).

-spec th(
    list(lustre@internals@vdom:attribute(QPF)),
    list(lustre@internals@vdom:element(QPF))
) -> lustre@internals@vdom:element(QPF).
th(Attrs, Children) ->
    lustre@element:element(<<"th"/utf8>>, Attrs, Children).

-spec thead(
    list(lustre@internals@vdom:attribute(QPL)),
    list(lustre@internals@vdom:element(QPL))
) -> lustre@internals@vdom:element(QPL).
thead(Attrs, Children) ->
    lustre@element:element(<<"thead"/utf8>>, Attrs, Children).

-spec tr(
    list(lustre@internals@vdom:attribute(QPR)),
    list(lustre@internals@vdom:element(QPR))
) -> lustre@internals@vdom:element(QPR).
tr(Attrs, Children) ->
    lustre@element:element(<<"tr"/utf8>>, Attrs, Children).

-spec button(
    list(lustre@internals@vdom:attribute(QPX)),
    list(lustre@internals@vdom:element(QPX))
) -> lustre@internals@vdom:element(QPX).
button(Attrs, Children) ->
    lustre@element:element(<<"button"/utf8>>, Attrs, Children).

-spec datalist(
    list(lustre@internals@vdom:attribute(QQD)),
    list(lustre@internals@vdom:element(QQD))
) -> lustre@internals@vdom:element(QQD).
datalist(Attrs, Children) ->
    lustre@element:element(<<"datalist"/utf8>>, Attrs, Children).

-spec fieldset(
    list(lustre@internals@vdom:attribute(QQJ)),
    list(lustre@internals@vdom:element(QQJ))
) -> lustre@internals@vdom:element(QQJ).
fieldset(Attrs, Children) ->
    lustre@element:element(<<"fieldset"/utf8>>, Attrs, Children).

-spec form(
    list(lustre@internals@vdom:attribute(QQP)),
    list(lustre@internals@vdom:element(QQP))
) -> lustre@internals@vdom:element(QQP).
form(Attrs, Children) ->
    lustre@element:element(<<"form"/utf8>>, Attrs, Children).

-spec input(list(lustre@internals@vdom:attribute(QQV))) -> lustre@internals@vdom:element(QQV).
input(Attrs) ->
    lustre@element:element(<<"input"/utf8>>, Attrs, []).

-spec label(
    list(lustre@internals@vdom:attribute(QQZ)),
    list(lustre@internals@vdom:element(QQZ))
) -> lustre@internals@vdom:element(QQZ).
label(Attrs, Children) ->
    lustre@element:element(<<"label"/utf8>>, Attrs, Children).

-spec legend(
    list(lustre@internals@vdom:attribute(QRF)),
    list(lustre@internals@vdom:element(QRF))
) -> lustre@internals@vdom:element(QRF).
legend(Attrs, Children) ->
    lustre@element:element(<<"legend"/utf8>>, Attrs, Children).

-spec meter(
    list(lustre@internals@vdom:attribute(QRL)),
    list(lustre@internals@vdom:element(QRL))
) -> lustre@internals@vdom:element(QRL).
meter(Attrs, Children) ->
    lustre@element:element(<<"meter"/utf8>>, Attrs, Children).

-spec optgroup(
    list(lustre@internals@vdom:attribute(QRR)),
    list(lustre@internals@vdom:element(QRR))
) -> lustre@internals@vdom:element(QRR).
optgroup(Attrs, Children) ->
    lustre@element:element(<<"optgroup"/utf8>>, Attrs, Children).

-spec option(list(lustre@internals@vdom:attribute(QRX)), binary()) -> lustre@internals@vdom:element(QRX).
option(Attrs, Label) ->
    lustre@element:element(
        <<"option"/utf8>>,
        Attrs,
        [lustre@element:text(Label)]
    ).

-spec output(
    list(lustre@internals@vdom:attribute(QSB)),
    list(lustre@internals@vdom:element(QSB))
) -> lustre@internals@vdom:element(QSB).
output(Attrs, Children) ->
    lustre@element:element(<<"output"/utf8>>, Attrs, Children).

-spec progress(
    list(lustre@internals@vdom:attribute(QSH)),
    list(lustre@internals@vdom:element(QSH))
) -> lustre@internals@vdom:element(QSH).
progress(Attrs, Children) ->
    lustre@element:element(<<"progress"/utf8>>, Attrs, Children).

-spec select(
    list(lustre@internals@vdom:attribute(QSN)),
    list(lustre@internals@vdom:element(QSN))
) -> lustre@internals@vdom:element(QSN).
select(Attrs, Children) ->
    lustre@element:element(<<"select"/utf8>>, Attrs, Children).

-spec textarea(list(lustre@internals@vdom:attribute(QST)), binary()) -> lustre@internals@vdom:element(QST).
textarea(Attrs, Content) ->
    lustre@element:element(
        <<"textarea"/utf8>>,
        Attrs,
        [lustre@element:text(Content)]
    ).

-spec details(
    list(lustre@internals@vdom:attribute(QSX)),
    list(lustre@internals@vdom:element(QSX))
) -> lustre@internals@vdom:element(QSX).
details(Attrs, Children) ->
    lustre@element:element(<<"details"/utf8>>, Attrs, Children).

-spec dialog(
    list(lustre@internals@vdom:attribute(QTD)),
    list(lustre@internals@vdom:element(QTD))
) -> lustre@internals@vdom:element(QTD).
dialog(Attrs, Children) ->
    lustre@element:element(<<"dialog"/utf8>>, Attrs, Children).

-spec summary(
    list(lustre@internals@vdom:attribute(QTJ)),
    list(lustre@internals@vdom:element(QTJ))
) -> lustre@internals@vdom:element(QTJ).
summary(Attrs, Children) ->
    lustre@element:element(<<"summary"/utf8>>, Attrs, Children).

-spec slot(list(lustre@internals@vdom:attribute(QTP))) -> lustre@internals@vdom:element(QTP).
slot(Attrs) ->
    lustre@element:element(<<"slot"/utf8>>, Attrs, []).

-spec template(
    list(lustre@internals@vdom:attribute(QTT)),
    list(lustre@internals@vdom:element(QTT))
) -> lustre@internals@vdom:element(QTT).
template(Attrs, Children) ->
    lustre@element:element(<<"template"/utf8>>, Attrs, Children).
