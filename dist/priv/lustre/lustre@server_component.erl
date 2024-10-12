-module(lustre@server_component).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch]).

-export([component/1, script/0, route/1, data/1, include/1, subscribe/2, unsubscribe/1, emit/2, set_selector/1, decode_action/1, encode_patch/1]).

-spec component(list(lustre@internals@vdom:attribute(RVN))) -> lustre@internals@vdom:element(RVN).
component(Attrs) ->
    lustre@element:element(<<"lustre-server-component"/utf8>>, Attrs, []).

-spec script() -> lustre@internals@vdom:element(any()).
script() ->
    lustre@element:element(
        <<"script"/utf8>>,
        [lustre@attribute:attribute(<<"type"/utf8>>, <<"module"/utf8>>)],
        [lustre@element:text(
                <<"function A(e,t,s,o=!1){let i,r=[{prev:e,next:t,parent:e.parentNode}];for(;r.length;){let{prev:n,next:a,parent:l}=r.pop();if(a.subtree!==void 0&&(a=a.subtree()),a.content!==void 0)if(n)if(n.nodeType===Node.TEXT_NODE)n.textContent!==a.content&&(n.textContent=a.content),i??=n;else{let c=document.createTextNode(a.content);l.replaceChild(c,n),i??=c}else{let c=document.createTextNode(a.content);l.appendChild(c),i??=c}else if(a.tag!==void 0){let c=W({prev:n,next:a,dispatch:s,stack:r,isComponent:o});n?n!==c&&l.replaceChild(c,n):l.appendChild(c),i??=c}else a.elements!==void 0?N(a,c=>{r.unshift({prev:n,next:c,parent:l}),n=n?.nextSibling}):a.subtree!==void 0&&r.push({prev:n,next:a,parent:l})}return i}function J(e,t,s,o=0){let i=e.parentNode;for(let r of t[0]){let n=r[0].split(\"-\"),a=r[1],l=k(i,n,o),c;if(l!==null&&l!==i)c=A(l,a,s);else{let u=k(i,n.slice(0,-1),o),f=document.createTextNode(\"\");u.appendChild(f),c=A(f,a,s)}n===\"0\"&&(e=c)}for(let r of t[1]){let n=r[0].split(\"-\");k(i,n,o).remove()}for(let r of t[2]){let n=r[0].split(\"-\"),a=r[1],l=k(i,n,o),c=S.get(l);for(let u of a[0]){let f=u[0],b=u[1];if(f.startsWith(\"data-lustre-on-\")){let p=f.slice(15),w=s(M);c.has(p)||el.addEventListener(p,y),c.set(p,w),el.setAttribute(f,b)}else l.setAttribute(f,b),l[f]=b}for(let u of a[1])if(u[0].startsWith(\"data-lustre-on-\")){let f=u[0].slice(15);l.removeEventListener(f,y),c.delete(f)}else l.removeAttribute(u[0])}return e}function W({prev:e,next:t,dispatch:s,stack:o}){let i=t.namespace||\"http://www.w3.org/1999/xhtml\",r=e&&e.nodeType===Node.ELEMENT_NODE&&e.localName===t.tag&&e.namespaceURI===(t.namespace||\"http://www.w3.org/1999/xhtml\"),n=r?e:i?document.createElementNS(i,t.tag):document.createElement(t.tag),a;if(S.has(n))a=S.get(n);else{let h=new Map;S.set(n,h),a=h}let l=r?new Set(a.keys()):null,c=r?new Set(Array.from(e.attributes,h=>h.name)):null,u=null,f=null,b=null;for(let h of t.attrs){let d=h[0],m=h[1];if(h.as_property)n[d]!==m&&(n[d]=m),r&&c.delete(d);else if(d.startsWith(\"on\")){let g=d.slice(2),E=s(m);a.has(g)||n.addEventListener(g,y),a.set(g,E),r&&l.delete(g)}else if(d.startsWith(\"data-lustre-on-\")){let g=d.slice(15),E=s(M);a.has(g)||n.addEventListener(g,y),a.set(g,E),n.setAttribute(d,m)}else d===\"class\"?u=u===null?m:u+\" \"+m:d===\"style\"?f=f===null?m:f+m:d===\"dangerous-unescaped-html\"?b=m:(n.getAttribute(d)!==m&&n.setAttribute(d,m),(d===\"value\"||d===\"selected\")&&(n[d]=m),r&&c.delete(d))}if(u!==null&&(n.setAttribute(\"class\",u),r&&c.delete(\"class\")),f!==null&&(n.setAttribute(\"style\",f),r&&c.delete(\"style\")),r){for(let h of c)n.removeAttribute(h);for(let h of l)a.delete(h),n.removeEventListener(h,y)}if(t.key!==void 0&&t.key!==\"\")n.setAttribute(\"data-lustre-key\",t.key);else if(b!==null)return n.innerHTML=b,n;let p=n.firstChild,w=null,T=null,C=null,x=t.children[Symbol.iterator]().next().value;r&&x!==void 0&&x.key!==void 0&&x.key!==\"\"&&(w=new Set,T=L(e),C=L(t));for(let h of t.children)N(h,d=>{d.key!==void 0&&w!==null?p=F(p,d,n,o,C,T,w):(o.unshift({prev:p,next:d,parent:n}),p=p?.nextSibling)});for(;p;){let h=p.nextSibling;n.removeChild(p),p=h}return n}var S=new WeakMap;function y(e){let t=e.currentTarget;if(!S.has(t)){t.removeEventListener(e.type,y);return}let s=S.get(t);if(!s.has(e.type)){t.removeEventListener(e.type,y);return}s.get(e.type)(e)}function M(e){let t=e.currentTarget,s=t.getAttribute(`data-lustre-on-${e.type}`),o=JSON.parse(t.getAttribute(\"data-lustre-data\")||\"{}\"),i=JSON.parse(t.getAttribute(\"data-lustre-include\")||\"[]\");switch(e.type){case\"input\":case\"change\":i.push(\"target.value\");break}return{tag:s,data:i.reduce((r,n)=>{let a=n.split(\".\");for(let l=0,c=r,u=e;l<a.length;l++)l===a.length-1?c[a[l]]=u[a[l]]:(c[a[l]]??={},u=u[a[l]],c=c[a[l]]);return r},{data:o})}}function L(e){let t=new Map;if(e)for(let s of e.children)N(s,o=>{let i=o?.key||o?.getAttribute?.(\"data-lustre-key\");i&&t.set(i,o)});return t}function k(e,t,s){let o,i,r=e,n=!0;for(;[o,...i]=t,o!==void 0;)r=r.childNodes.item(n?o+s:o),n=!1,t=i;return r}function F(e,t,s,o,i,r,n){for(;e&&!i.has(e.getAttribute(\"data-lustre-key\"));){let l=e.nextSibling;s.removeChild(e),e=l}if(r.size===0)return N(t,l=>{o.unshift({prev:e,next:l,parent:s}),e=e?.nextSibling}),e;if(n.has(t.key))return console.warn(`Duplicate key found in Lustre vnode: ${t.key}`),o.unshift({prev:null,next:t,parent:s}),e;n.add(t.key);let a=r.get(t.key);if(!a&&!e)return o.unshift({prev:null,next:t,parent:s}),e;if(!a&&e!==null){let l=document.createTextNode(\"\");return s.insertBefore(l,e),o.unshift({prev:l,next:t,parent:s}),e}return!a||a===e?(o.unshift({prev:e,next:t,parent:s}),e=e?.nextSibling,e):(s.insertBefore(a,e),o.unshift({prev:a,next:t,parent:s}),e)}function N(e,t){if(e.elements!==void 0)for(let s of e.elements)t(s);else e.subtree!==void 0?N(e.subtree(),t):t(e)}var O=class extends HTMLElement{static get observedAttributes(){return[\"route\"]}#i=null;#n=null;#t=null;#e=null;#s=[];constructor(){super(),this.#e=this.attachShadow({mode:\"closed\"}),this.#i=new MutationObserver(t=>{let s=[];for(let o of t)if(o.type===\"attributes\"){let{attributeName:i,oldValue:r}=o,n=this.getAttribute(i);if(r!==n)try{s.push([i,JSON.parse(n)])}catch{s.push([i,n])}}s.length&&this.#t?.send(JSON.stringify([5,s]))})}async connectedCallback(){this.#o().finally(()=>{this.#n=document.createElement(\"div\"),this.#e.append(this.#n)})}attributeChangedCallback(t,s,o){switch(t){case\"route\":if(!o)this.#t?.close(),this.#t=null;else if(s!==o){let i=this.getAttribute(\"id\"),r=o+(i?`?id=${i}`:\"\"),n=window.location.protocol===\"https:\"?\"wss\":\"ws\";this.#t?.close(),this.#t=new WebSocket(`${n}://${window.location.host}${r}`),this.#t.addEventListener(\"message\",a=>this.messageReceivedCallback(a))}}}messageReceivedCallback({data:t}){let[s,...o]=JSON.parse(t);switch(s){case 0:return this.diff(o);case 1:return this.emit(o);case 2:return this.init(o)}}init([t,s]){let o=[];for(let i of t)i in this?o.push([i,this[i]]):this.hasAttribute(i)&&o.push([i,this.getAttribute(i)]),Object.defineProperty(this,i,{get(){return this[`_${i}`]??this.getAttribute(i)},set(r){let n=this[i];typeof r==\"string\"?this.setAttribute(i,r):this[`_${i}`]=r,n!==r&&this.#t?.send(JSON.stringify([5,[[i,r]]]))}});this.#i.observe(this,{attributeFilter:t,attributeOldValue:!0,attributes:!0,characterData:!1,characterDataOldValue:!1,childList:!1,subtree:!1}),this.morph(s),o.length&&this.#t?.send(JSON.stringify([5,o]))}morph(t){this.#n=A(this.#n,t,s=>o=>{let i=JSON.parse(this.getAttribute(\"data-lustre-data\")||\"{}\"),r=s(o);r.data=$(i,r.data),this.#t?.send(JSON.stringify([4,r.tag,r.data]))})}diff([t]){this.#n=J(this.#n,t,s=>o=>{let i=s(o);this.#t?.send(JSON.stringify([4,i.tag,i.data]))},this.#s.length)}emit([t,s]){this.dispatchEvent(new CustomEvent(t,{detail:s}))}disconnectedCallback(){this.#t?.close()}#o(){for(;this.#s.length;)this.#s.shift().remove();let t=[];this.#e.adoptedStyleSheets=this.getRootNode().adoptedStyleSheets;for(let s of document.styleSheets)try{this.#e.adoptedStyleSheets.push(s)}catch{let o=s.ownerNode.cloneNode();this.#e.appendChild(o),t.push(new Promise((i,r)=>{o.onload=i,o.onerror=r}))}return Promise.allSettled(t)}adoptStyleSheet(t){this.#e.adoptedStyleSheets.push(t)}get adoptedStyleSheets(){return this.#e.adoptedStyleSheets}};window.customElements.define(\"lustre-server-component\",O);function $(e,t){for(let s in t)t[s]instanceof Object&&Object.assign(t[s],$(e[s],t[s]));return Object.assign(e||{},t),e}export{O as LustreServerComponent};"/utf8>>
            )]
    ).

-spec route(binary()) -> lustre@internals@vdom:attribute(any()).
route(Path) ->
    lustre@attribute:attribute(<<"route"/utf8>>, Path).

-spec data(gleam@json:json()) -> lustre@internals@vdom:attribute(any()).
data(Json) ->
    _pipe = Json,
    _pipe@1 = gleam@json:to_string(_pipe),
    lustre@attribute:attribute(<<"data-lustre-data"/utf8>>, _pipe@1).

-spec include(list(binary())) -> lustre@internals@vdom:attribute(any()).
include(Properties) ->
    _pipe = Properties,
    _pipe@1 = gleam@json:array(_pipe, fun gleam@json:string/1),
    _pipe@2 = gleam@json:to_string(_pipe@1),
    lustre@attribute:attribute(<<"data-lustre-include"/utf8>>, _pipe@2).

-spec subscribe(binary(), fun((lustre@internals@patch:patch(RWA)) -> nil)) -> lustre@internals@runtime:action(RWA, lustre:server_component()).
subscribe(Id, Renderer) ->
    {subscribe, Id, Renderer}.

-spec unsubscribe(binary()) -> lustre@internals@runtime:action(any(), lustre:server_component()).
unsubscribe(Id) ->
    {unsubscribe, Id}.

-spec emit(binary(), gleam@json:json()) -> lustre@effect:effect(any()).
emit(Event, Data) ->
    lustre@effect:event(Event, Data).

-spec do_set_selector(
    gleam@erlang@process:selector(lustre@internals@runtime:action(any(), RWQ))
) -> lustre@effect:effect(RWQ).
do_set_selector(Sel) ->
    lustre@effect:from(
        fun(_) ->
            Self = gleam@erlang@process:new_subject(),
            gleam@erlang@process:send(Self, {set_selector, Sel})
        end
    ).

-spec set_selector(
    gleam@erlang@process:selector(lustre@internals@runtime:action(any(), RWK))
) -> lustre@effect:effect(RWK).
set_selector(Sel) ->
    do_set_selector(Sel).

-spec decode_event(gleam@dynamic:dynamic_()) -> {ok,
        lustre@internals@runtime:action(any(), any())} |
    {error, list(gleam@dynamic:decode_error())}.
decode_event(Dyn) ->
    gleam@result:'try'(
        (gleam@dynamic:tuple3(
            fun gleam@dynamic:int/1,
            fun gleam@dynamic:dynamic/1,
            fun gleam@dynamic:dynamic/1
        ))(Dyn),
        fun(_use0) ->
            {Kind, Name, Data} = _use0,
            gleam@bool:guard(
                Kind /= 4,
                {error,
                    [{decode_error,
                            gleam@int:to_string(4),
                            gleam@int:to_string(Kind),
                            [<<"0"/utf8>>]}]},
                fun() ->
                    gleam@result:'try'(
                        gleam@dynamic:string(Name),
                        fun(Name@1) -> {ok, {event, Name@1, Data}} end
                    )
                end
            )
        end
    ).

-spec decode_attr(gleam@dynamic:dynamic_()) -> {ok,
        {binary(), gleam@dynamic:dynamic_()}} |
    {error, list(gleam@dynamic:decode_error())}.
decode_attr(Dyn) ->
    (gleam@dynamic:tuple2(
        fun gleam@dynamic:string/1,
        fun gleam@dynamic:dynamic/1
    ))(Dyn).

-spec decode_attrs(gleam@dynamic:dynamic_()) -> {ok,
        lustre@internals@runtime:action(any(), any())} |
    {error, list(gleam@dynamic:decode_error())}.
decode_attrs(Dyn) ->
    gleam@result:'try'(
        (gleam@dynamic:tuple2(
            fun gleam@dynamic:int/1,
            fun gleam@dynamic:dynamic/1
        ))(Dyn),
        fun(_use0) ->
            {Kind, Attrs} = _use0,
            gleam@bool:guard(
                Kind /= 5,
                {error,
                    [{decode_error,
                            gleam@int:to_string(5),
                            gleam@int:to_string(Kind),
                            [<<"0"/utf8>>]}]},
                fun() ->
                    gleam@result:'try'(
                        (gleam@dynamic:list(fun decode_attr/1))(Attrs),
                        fun(Attrs@1) -> {ok, {attrs, Attrs@1}} end
                    )
                end
            )
        end
    ).

-spec decode_action(gleam@dynamic:dynamic_()) -> {ok,
        lustre@internals@runtime:action(any(), lustre:server_component())} |
    {error, list(gleam@dynamic:decode_error())}.
decode_action(Dyn) ->
    (gleam@dynamic:any([fun decode_event/1, fun decode_attrs/1]))(Dyn).

-spec encode_patch(lustre@internals@patch:patch(any())) -> gleam@json:json().
encode_patch(Patch) ->
    lustre@internals@patch:patch_to_json(Patch).
