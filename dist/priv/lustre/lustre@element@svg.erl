-module(lustre@element@svg).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch]).

-export([animate/1, animate_motion/1, animate_transform/1, mpath/1, set/1, circle/1, ellipse/1, line/1, polygon/1, polyline/1, rect/1, a/2, defs/2, g/2, marker/2, mask/2, missing_glyph/2, pattern/2, svg/2, switch/2, symbol/2, desc/2, metadata/2, title/2, fe_blend/1, fe_color_matrix/1, fe_component_transfer/1, fe_composite/1, fe_convolve_matrix/1, fe_diffuse_lighting/2, fe_displacement_map/1, fe_drop_shadow/1, fe_flood/1, fe_func_a/1, fe_func_b/1, fe_func_g/1, fe_func_r/1, fe_gaussian_blur/1, fe_image/1, fe_merge/2, fe_merge_node/1, fe_morphology/1, fe_offset/1, fe_specular_lighting/2, fe_tile/2, fe_turbulence/1, linear_gradient/2, radial_gradient/2, stop/1, image/1, path/1, text/2, use_/1, fe_distant_light/1, fe_point_light/1, fe_spot_light/1, clip_path/2, script/2, style/2, foreign_object/2, text_path/2, tspan/2]).

-spec animate(list(lustre@internals@vdom:attribute(RAW))) -> lustre@internals@vdom:element(RAW).
animate(Attrs) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"animate"/utf8>>,
        Attrs,
        []
    ).

-spec animate_motion(list(lustre@internals@vdom:attribute(RBA))) -> lustre@internals@vdom:element(RBA).
animate_motion(Attrs) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"animateMotion"/utf8>>,
        Attrs,
        []
    ).

-spec animate_transform(list(lustre@internals@vdom:attribute(RBE))) -> lustre@internals@vdom:element(RBE).
animate_transform(Attrs) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"animateTransform"/utf8>>,
        Attrs,
        []
    ).

-spec mpath(list(lustre@internals@vdom:attribute(RBI))) -> lustre@internals@vdom:element(RBI).
mpath(Attrs) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"mpath"/utf8>>,
        Attrs,
        []
    ).

-spec set(list(lustre@internals@vdom:attribute(RBM))) -> lustre@internals@vdom:element(RBM).
set(Attrs) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"set"/utf8>>,
        Attrs,
        []
    ).

-spec circle(list(lustre@internals@vdom:attribute(RBQ))) -> lustre@internals@vdom:element(RBQ).
circle(Attrs) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"circle"/utf8>>,
        Attrs,
        []
    ).

-spec ellipse(list(lustre@internals@vdom:attribute(RBU))) -> lustre@internals@vdom:element(RBU).
ellipse(Attrs) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"ellipse"/utf8>>,
        Attrs,
        []
    ).

-spec line(list(lustre@internals@vdom:attribute(RBY))) -> lustre@internals@vdom:element(RBY).
line(Attrs) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"line"/utf8>>,
        Attrs,
        []
    ).

-spec polygon(list(lustre@internals@vdom:attribute(RCC))) -> lustre@internals@vdom:element(RCC).
polygon(Attrs) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"polygon"/utf8>>,
        Attrs,
        []
    ).

-spec polyline(list(lustre@internals@vdom:attribute(RCG))) -> lustre@internals@vdom:element(RCG).
polyline(Attrs) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"polyline"/utf8>>,
        Attrs,
        []
    ).

-spec rect(list(lustre@internals@vdom:attribute(RCK))) -> lustre@internals@vdom:element(RCK).
rect(Attrs) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"rect"/utf8>>,
        Attrs,
        []
    ).

-spec a(
    list(lustre@internals@vdom:attribute(RCO)),
    list(lustre@internals@vdom:element(RCO))
) -> lustre@internals@vdom:element(RCO).
a(Attrs, Children) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"a"/utf8>>,
        Attrs,
        Children
    ).

-spec defs(
    list(lustre@internals@vdom:attribute(RCU)),
    list(lustre@internals@vdom:element(RCU))
) -> lustre@internals@vdom:element(RCU).
defs(Attrs, Children) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"defs"/utf8>>,
        Attrs,
        Children
    ).

-spec g(
    list(lustre@internals@vdom:attribute(RDA)),
    list(lustre@internals@vdom:element(RDA))
) -> lustre@internals@vdom:element(RDA).
g(Attrs, Children) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"g"/utf8>>,
        Attrs,
        Children
    ).

-spec marker(
    list(lustre@internals@vdom:attribute(RDG)),
    list(lustre@internals@vdom:element(RDG))
) -> lustre@internals@vdom:element(RDG).
marker(Attrs, Children) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"marker"/utf8>>,
        Attrs,
        Children
    ).

-spec mask(
    list(lustre@internals@vdom:attribute(RDM)),
    list(lustre@internals@vdom:element(RDM))
) -> lustre@internals@vdom:element(RDM).
mask(Attrs, Children) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"mask"/utf8>>,
        Attrs,
        Children
    ).

-spec missing_glyph(
    list(lustre@internals@vdom:attribute(RDS)),
    list(lustre@internals@vdom:element(RDS))
) -> lustre@internals@vdom:element(RDS).
missing_glyph(Attrs, Children) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"missing-glyph"/utf8>>,
        Attrs,
        Children
    ).

-spec pattern(
    list(lustre@internals@vdom:attribute(RDY)),
    list(lustre@internals@vdom:element(RDY))
) -> lustre@internals@vdom:element(RDY).
pattern(Attrs, Children) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"pattern"/utf8>>,
        Attrs,
        Children
    ).

-spec svg(
    list(lustre@internals@vdom:attribute(REE)),
    list(lustre@internals@vdom:element(REE))
) -> lustre@internals@vdom:element(REE).
svg(Attrs, Children) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"svg"/utf8>>,
        Attrs,
        Children
    ).

-spec switch(
    list(lustre@internals@vdom:attribute(REK)),
    list(lustre@internals@vdom:element(REK))
) -> lustre@internals@vdom:element(REK).
switch(Attrs, Children) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"switch"/utf8>>,
        Attrs,
        Children
    ).

-spec symbol(
    list(lustre@internals@vdom:attribute(REQ)),
    list(lustre@internals@vdom:element(REQ))
) -> lustre@internals@vdom:element(REQ).
symbol(Attrs, Children) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"symbol"/utf8>>,
        Attrs,
        Children
    ).

-spec desc(
    list(lustre@internals@vdom:attribute(REW)),
    list(lustre@internals@vdom:element(REW))
) -> lustre@internals@vdom:element(REW).
desc(Attrs, Children) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"desc"/utf8>>,
        Attrs,
        Children
    ).

-spec metadata(
    list(lustre@internals@vdom:attribute(RFC)),
    list(lustre@internals@vdom:element(RFC))
) -> lustre@internals@vdom:element(RFC).
metadata(Attrs, Children) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"metadata"/utf8>>,
        Attrs,
        Children
    ).

-spec title(
    list(lustre@internals@vdom:attribute(RFI)),
    list(lustre@internals@vdom:element(RFI))
) -> lustre@internals@vdom:element(RFI).
title(Attrs, Children) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"title"/utf8>>,
        Attrs,
        Children
    ).

-spec fe_blend(list(lustre@internals@vdom:attribute(RFO))) -> lustre@internals@vdom:element(RFO).
fe_blend(Attrs) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"feBlend"/utf8>>,
        Attrs,
        []
    ).

-spec fe_color_matrix(list(lustre@internals@vdom:attribute(RFS))) -> lustre@internals@vdom:element(RFS).
fe_color_matrix(Attrs) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"feColorMatrix"/utf8>>,
        Attrs,
        []
    ).

-spec fe_component_transfer(list(lustre@internals@vdom:attribute(RFW))) -> lustre@internals@vdom:element(RFW).
fe_component_transfer(Attrs) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"feComponentTransfer"/utf8>>,
        Attrs,
        []
    ).

-spec fe_composite(list(lustre@internals@vdom:attribute(RGA))) -> lustre@internals@vdom:element(RGA).
fe_composite(Attrs) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"feComposite"/utf8>>,
        Attrs,
        []
    ).

-spec fe_convolve_matrix(list(lustre@internals@vdom:attribute(RGE))) -> lustre@internals@vdom:element(RGE).
fe_convolve_matrix(Attrs) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"feConvolveMatrix"/utf8>>,
        Attrs,
        []
    ).

-spec fe_diffuse_lighting(
    list(lustre@internals@vdom:attribute(RGI)),
    list(lustre@internals@vdom:element(RGI))
) -> lustre@internals@vdom:element(RGI).
fe_diffuse_lighting(Attrs, Children) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"feDiffuseLighting"/utf8>>,
        Attrs,
        Children
    ).

-spec fe_displacement_map(list(lustre@internals@vdom:attribute(RGO))) -> lustre@internals@vdom:element(RGO).
fe_displacement_map(Attrs) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"feDisplacementMap"/utf8>>,
        Attrs,
        []
    ).

-spec fe_drop_shadow(list(lustre@internals@vdom:attribute(RGS))) -> lustre@internals@vdom:element(RGS).
fe_drop_shadow(Attrs) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"feDropShadow"/utf8>>,
        Attrs,
        []
    ).

-spec fe_flood(list(lustre@internals@vdom:attribute(RGW))) -> lustre@internals@vdom:element(RGW).
fe_flood(Attrs) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"feFlood"/utf8>>,
        Attrs,
        []
    ).

-spec fe_func_a(list(lustre@internals@vdom:attribute(RHA))) -> lustre@internals@vdom:element(RHA).
fe_func_a(Attrs) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"feFuncA"/utf8>>,
        Attrs,
        []
    ).

-spec fe_func_b(list(lustre@internals@vdom:attribute(RHE))) -> lustre@internals@vdom:element(RHE).
fe_func_b(Attrs) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"feFuncB"/utf8>>,
        Attrs,
        []
    ).

-spec fe_func_g(list(lustre@internals@vdom:attribute(RHI))) -> lustre@internals@vdom:element(RHI).
fe_func_g(Attrs) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"feFuncG"/utf8>>,
        Attrs,
        []
    ).

-spec fe_func_r(list(lustre@internals@vdom:attribute(RHM))) -> lustre@internals@vdom:element(RHM).
fe_func_r(Attrs) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"feFuncR"/utf8>>,
        Attrs,
        []
    ).

-spec fe_gaussian_blur(list(lustre@internals@vdom:attribute(RHQ))) -> lustre@internals@vdom:element(RHQ).
fe_gaussian_blur(Attrs) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"feGaussianBlur"/utf8>>,
        Attrs,
        []
    ).

-spec fe_image(list(lustre@internals@vdom:attribute(RHU))) -> lustre@internals@vdom:element(RHU).
fe_image(Attrs) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"feImage"/utf8>>,
        Attrs,
        []
    ).

-spec fe_merge(
    list(lustre@internals@vdom:attribute(RHY)),
    list(lustre@internals@vdom:element(RHY))
) -> lustre@internals@vdom:element(RHY).
fe_merge(Attrs, Children) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"feMerge"/utf8>>,
        Attrs,
        Children
    ).

-spec fe_merge_node(list(lustre@internals@vdom:attribute(RIE))) -> lustre@internals@vdom:element(RIE).
fe_merge_node(Attrs) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"feMergeNode"/utf8>>,
        Attrs,
        []
    ).

-spec fe_morphology(list(lustre@internals@vdom:attribute(RII))) -> lustre@internals@vdom:element(RII).
fe_morphology(Attrs) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"feMorphology"/utf8>>,
        Attrs,
        []
    ).

-spec fe_offset(list(lustre@internals@vdom:attribute(RIM))) -> lustre@internals@vdom:element(RIM).
fe_offset(Attrs) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"feOffset"/utf8>>,
        Attrs,
        []
    ).

-spec fe_specular_lighting(
    list(lustre@internals@vdom:attribute(RIQ)),
    list(lustre@internals@vdom:element(RIQ))
) -> lustre@internals@vdom:element(RIQ).
fe_specular_lighting(Attrs, Children) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"feSpecularLighting"/utf8>>,
        Attrs,
        Children
    ).

-spec fe_tile(
    list(lustre@internals@vdom:attribute(RIW)),
    list(lustre@internals@vdom:element(RIW))
) -> lustre@internals@vdom:element(RIW).
fe_tile(Attrs, Children) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"feTile"/utf8>>,
        Attrs,
        Children
    ).

-spec fe_turbulence(list(lustre@internals@vdom:attribute(RJC))) -> lustre@internals@vdom:element(RJC).
fe_turbulence(Attrs) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"feTurbulence"/utf8>>,
        Attrs,
        []
    ).

-spec linear_gradient(
    list(lustre@internals@vdom:attribute(RJG)),
    list(lustre@internals@vdom:element(RJG))
) -> lustre@internals@vdom:element(RJG).
linear_gradient(Attrs, Children) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"linearGradient"/utf8>>,
        Attrs,
        Children
    ).

-spec radial_gradient(
    list(lustre@internals@vdom:attribute(RJM)),
    list(lustre@internals@vdom:element(RJM))
) -> lustre@internals@vdom:element(RJM).
radial_gradient(Attrs, Children) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"radialGradient"/utf8>>,
        Attrs,
        Children
    ).

-spec stop(list(lustre@internals@vdom:attribute(RJS))) -> lustre@internals@vdom:element(RJS).
stop(Attrs) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"stop"/utf8>>,
        Attrs,
        []
    ).

-spec image(list(lustre@internals@vdom:attribute(RJW))) -> lustre@internals@vdom:element(RJW).
image(Attrs) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"image"/utf8>>,
        Attrs,
        []
    ).

-spec path(list(lustre@internals@vdom:attribute(RKA))) -> lustre@internals@vdom:element(RKA).
path(Attrs) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"path"/utf8>>,
        Attrs,
        []
    ).

-spec text(list(lustre@internals@vdom:attribute(RKE)), binary()) -> lustre@internals@vdom:element(RKE).
text(Attrs, Content) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"text"/utf8>>,
        Attrs,
        [lustre@element:text(Content)]
    ).

-spec use_(list(lustre@internals@vdom:attribute(RKI))) -> lustre@internals@vdom:element(RKI).
use_(Attrs) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"use"/utf8>>,
        Attrs,
        []
    ).

-spec fe_distant_light(list(lustre@internals@vdom:attribute(RKM))) -> lustre@internals@vdom:element(RKM).
fe_distant_light(Attrs) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"feDistantLight"/utf8>>,
        Attrs,
        []
    ).

-spec fe_point_light(list(lustre@internals@vdom:attribute(RKQ))) -> lustre@internals@vdom:element(RKQ).
fe_point_light(Attrs) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"fePointLight"/utf8>>,
        Attrs,
        []
    ).

-spec fe_spot_light(list(lustre@internals@vdom:attribute(RKU))) -> lustre@internals@vdom:element(RKU).
fe_spot_light(Attrs) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"feSpotLight"/utf8>>,
        Attrs,
        []
    ).

-spec clip_path(
    list(lustre@internals@vdom:attribute(RKY)),
    list(lustre@internals@vdom:element(RKY))
) -> lustre@internals@vdom:element(RKY).
clip_path(Attrs, Children) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"clipPath"/utf8>>,
        Attrs,
        Children
    ).

-spec script(list(lustre@internals@vdom:attribute(RLE)), binary()) -> lustre@internals@vdom:element(RLE).
script(Attrs, Js) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"script"/utf8>>,
        Attrs,
        [lustre@element:text(Js)]
    ).

-spec style(list(lustre@internals@vdom:attribute(RLI)), binary()) -> lustre@internals@vdom:element(RLI).
style(Attrs, Css) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"style"/utf8>>,
        Attrs,
        [lustre@element:text(Css)]
    ).

-spec foreign_object(
    list(lustre@internals@vdom:attribute(RLM)),
    list(lustre@internals@vdom:element(RLM))
) -> lustre@internals@vdom:element(RLM).
foreign_object(Attrs, Children) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"foreignObject"/utf8>>,
        Attrs,
        Children
    ).

-spec text_path(
    list(lustre@internals@vdom:attribute(RLS)),
    list(lustre@internals@vdom:element(RLS))
) -> lustre@internals@vdom:element(RLS).
text_path(Attrs, Children) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"textPath"/utf8>>,
        Attrs,
        Children
    ).

-spec tspan(
    list(lustre@internals@vdom:attribute(RLY)),
    list(lustre@internals@vdom:element(RLY))
) -> lustre@internals@vdom:element(RLY).
tspan(Attrs, Children) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"tspan"/utf8>>,
        Attrs,
        Children
    ).
