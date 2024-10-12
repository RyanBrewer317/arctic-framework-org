import * as $process from "../../gleam_erlang/gleam/erlang/process.mjs";
import * as $json from "../../gleam_json/gleam/json.mjs";
import * as $bool from "../../gleam_stdlib/gleam/bool.mjs";
import * as $dynamic from "../../gleam_stdlib/gleam/dynamic.mjs";
import { DecodeError, dynamic } from "../../gleam_stdlib/gleam/dynamic.mjs";
import * as $int from "../../gleam_stdlib/gleam/int.mjs";
import * as $result from "../../gleam_stdlib/gleam/result.mjs";
import { Ok, Error, toList } from "../gleam.mjs";
import * as $lustre from "../lustre.mjs";
import * as $attribute from "../lustre/attribute.mjs";
import { attribute } from "../lustre/attribute.mjs";
import * as $effect from "../lustre/effect.mjs";
import * as $element from "../lustre/element.mjs";
import { element } from "../lustre/element.mjs";
import * as $constants from "../lustre/internals/constants.mjs";
import * as $patch from "../lustre/internals/patch.mjs";
import * as $runtime from "../lustre/internals/runtime.mjs";
import { Attrs, Event } from "../lustre/internals/runtime.mjs";

export function component(attrs) {
  return element("lustre-server-component", attrs, toList([]));
}

export function script() {
  return element(
    "script",
    toList([attribute("type", "module")]),
    toList([
      $element.text(
        "function A(e,t,s,o=!1){let i,r=[{prev:e,next:t,parent:e.parentNode}];for(;r.length;){let{prev:n,next:a,parent:l}=r.pop();if(a.subtree!==void 0&&(a=a.subtree()),a.content!==void 0)if(n)if(n.nodeType===Node.TEXT_NODE)n.textContent!==a.content&&(n.textContent=a.content),i??=n;else{let c=document.createTextNode(a.content);l.replaceChild(c,n),i??=c}else{let c=document.createTextNode(a.content);l.appendChild(c),i??=c}else if(a.tag!==void 0){let c=W({prev:n,next:a,dispatch:s,stack:r,isComponent:o});n?n!==c&&l.replaceChild(c,n):l.appendChild(c),i??=c}else a.elements!==void 0?N(a,c=>{r.unshift({prev:n,next:c,parent:l}),n=n?.nextSibling}):a.subtree!==void 0&&r.push({prev:n,next:a,parent:l})}return i}function J(e,t,s,o=0){let i=e.parentNode;for(let r of t[0]){let n=r[0].split(\"-\"),a=r[1],l=k(i,n,o),c;if(l!==null&&l!==i)c=A(l,a,s);else{let u=k(i,n.slice(0,-1),o),f=document.createTextNode(\"\");u.appendChild(f),c=A(f,a,s)}n===\"0\"&&(e=c)}for(let r of t[1]){let n=r[0].split(\"-\");k(i,n,o).remove()}for(let r of t[2]){let n=r[0].split(\"-\"),a=r[1],l=k(i,n,o),c=S.get(l);for(let u of a[0]){let f=u[0],b=u[1];if(f.startsWith(\"data-lustre-on-\")){let p=f.slice(15),w=s(M);c.has(p)||el.addEventListener(p,y),c.set(p,w),el.setAttribute(f,b)}else l.setAttribute(f,b),l[f]=b}for(let u of a[1])if(u[0].startsWith(\"data-lustre-on-\")){let f=u[0].slice(15);l.removeEventListener(f,y),c.delete(f)}else l.removeAttribute(u[0])}return e}function W({prev:e,next:t,dispatch:s,stack:o}){let i=t.namespace||\"http://www.w3.org/1999/xhtml\",r=e&&e.nodeType===Node.ELEMENT_NODE&&e.localName===t.tag&&e.namespaceURI===(t.namespace||\"http://www.w3.org/1999/xhtml\"),n=r?e:i?document.createElementNS(i,t.tag):document.createElement(t.tag),a;if(S.has(n))a=S.get(n);else{let h=new Map;S.set(n,h),a=h}let l=r?new Set(a.keys()):null,c=r?new Set(Array.from(e.attributes,h=>h.name)):null,u=null,f=null,b=null;for(let h of t.attrs){let d=h[0],m=h[1];if(h.as_property)n[d]!==m&&(n[d]=m),r&&c.delete(d);else if(d.startsWith(\"on\")){let g=d.slice(2),E=s(m);a.has(g)||n.addEventListener(g,y),a.set(g,E),r&&l.delete(g)}else if(d.startsWith(\"data-lustre-on-\")){let g=d.slice(15),E=s(M);a.has(g)||n.addEventListener(g,y),a.set(g,E),n.setAttribute(d,m)}else d===\"class\"?u=u===null?m:u+\" \"+m:d===\"style\"?f=f===null?m:f+m:d===\"dangerous-unescaped-html\"?b=m:(n.getAttribute(d)!==m&&n.setAttribute(d,m),(d===\"value\"||d===\"selected\")&&(n[d]=m),r&&c.delete(d))}if(u!==null&&(n.setAttribute(\"class\",u),r&&c.delete(\"class\")),f!==null&&(n.setAttribute(\"style\",f),r&&c.delete(\"style\")),r){for(let h of c)n.removeAttribute(h);for(let h of l)a.delete(h),n.removeEventListener(h,y)}if(t.key!==void 0&&t.key!==\"\")n.setAttribute(\"data-lustre-key\",t.key);else if(b!==null)return n.innerHTML=b,n;let p=n.firstChild,w=null,T=null,C=null,x=t.children[Symbol.iterator]().next().value;r&&x!==void 0&&x.key!==void 0&&x.key!==\"\"&&(w=new Set,T=L(e),C=L(t));for(let h of t.children)N(h,d=>{d.key!==void 0&&w!==null?p=F(p,d,n,o,C,T,w):(o.unshift({prev:p,next:d,parent:n}),p=p?.nextSibling)});for(;p;){let h=p.nextSibling;n.removeChild(p),p=h}return n}var S=new WeakMap;function y(e){let t=e.currentTarget;if(!S.has(t)){t.removeEventListener(e.type,y);return}let s=S.get(t);if(!s.has(e.type)){t.removeEventListener(e.type,y);return}s.get(e.type)(e)}function M(e){let t=e.currentTarget,s=t.getAttribute(`data-lustre-on-${e.type}`),o=JSON.parse(t.getAttribute(\"data-lustre-data\")||\"{}\"),i=JSON.parse(t.getAttribute(\"data-lustre-include\")||\"[]\");switch(e.type){case\"input\":case\"change\":i.push(\"target.value\");break}return{tag:s,data:i.reduce((r,n)=>{let a=n.split(\".\");for(let l=0,c=r,u=e;l<a.length;l++)l===a.length-1?c[a[l]]=u[a[l]]:(c[a[l]]??={},u=u[a[l]],c=c[a[l]]);return r},{data:o})}}function L(e){let t=new Map;if(e)for(let s of e.children)N(s,o=>{let i=o?.key||o?.getAttribute?.(\"data-lustre-key\");i&&t.set(i,o)});return t}function k(e,t,s){let o,i,r=e,n=!0;for(;[o,...i]=t,o!==void 0;)r=r.childNodes.item(n?o+s:o),n=!1,t=i;return r}function F(e,t,s,o,i,r,n){for(;e&&!i.has(e.getAttribute(\"data-lustre-key\"));){let l=e.nextSibling;s.removeChild(e),e=l}if(r.size===0)return N(t,l=>{o.unshift({prev:e,next:l,parent:s}),e=e?.nextSibling}),e;if(n.has(t.key))return console.warn(`Duplicate key found in Lustre vnode: ${t.key}`),o.unshift({prev:null,next:t,parent:s}),e;n.add(t.key);let a=r.get(t.key);if(!a&&!e)return o.unshift({prev:null,next:t,parent:s}),e;if(!a&&e!==null){let l=document.createTextNode(\"\");return s.insertBefore(l,e),o.unshift({prev:l,next:t,parent:s}),e}return!a||a===e?(o.unshift({prev:e,next:t,parent:s}),e=e?.nextSibling,e):(s.insertBefore(a,e),o.unshift({prev:a,next:t,parent:s}),e)}function N(e,t){if(e.elements!==void 0)for(let s of e.elements)t(s);else e.subtree!==void 0?N(e.subtree(),t):t(e)}var O=class extends HTMLElement{static get observedAttributes(){return[\"route\"]}#i=null;#n=null;#t=null;#e=null;#s=[];constructor(){super(),this.#e=this.attachShadow({mode:\"closed\"}),this.#i=new MutationObserver(t=>{let s=[];for(let o of t)if(o.type===\"attributes\"){let{attributeName:i,oldValue:r}=o,n=this.getAttribute(i);if(r!==n)try{s.push([i,JSON.parse(n)])}catch{s.push([i,n])}}s.length&&this.#t?.send(JSON.stringify([5,s]))})}async connectedCallback(){this.#o().finally(()=>{this.#n=document.createElement(\"div\"),this.#e.append(this.#n)})}attributeChangedCallback(t,s,o){switch(t){case\"route\":if(!o)this.#t?.close(),this.#t=null;else if(s!==o){let i=this.getAttribute(\"id\"),r=o+(i?`?id=${i}`:\"\"),n=window.location.protocol===\"https:\"?\"wss\":\"ws\";this.#t?.close(),this.#t=new WebSocket(`${n}://${window.location.host}${r}`),this.#t.addEventListener(\"message\",a=>this.messageReceivedCallback(a))}}}messageReceivedCallback({data:t}){let[s,...o]=JSON.parse(t);switch(s){case 0:return this.diff(o);case 1:return this.emit(o);case 2:return this.init(o)}}init([t,s]){let o=[];for(let i of t)i in this?o.push([i,this[i]]):this.hasAttribute(i)&&o.push([i,this.getAttribute(i)]),Object.defineProperty(this,i,{get(){return this[`_${i}`]??this.getAttribute(i)},set(r){let n=this[i];typeof r==\"string\"?this.setAttribute(i,r):this[`_${i}`]=r,n!==r&&this.#t?.send(JSON.stringify([5,[[i,r]]]))}});this.#i.observe(this,{attributeFilter:t,attributeOldValue:!0,attributes:!0,characterData:!1,characterDataOldValue:!1,childList:!1,subtree:!1}),this.morph(s),o.length&&this.#t?.send(JSON.stringify([5,o]))}morph(t){this.#n=A(this.#n,t,s=>o=>{let i=JSON.parse(this.getAttribute(\"data-lustre-data\")||\"{}\"),r=s(o);r.data=$(i,r.data),this.#t?.send(JSON.stringify([4,r.tag,r.data]))})}diff([t]){this.#n=J(this.#n,t,s=>o=>{let i=s(o);this.#t?.send(JSON.stringify([4,i.tag,i.data]))},this.#s.length)}emit([t,s]){this.dispatchEvent(new CustomEvent(t,{detail:s}))}disconnectedCallback(){this.#t?.close()}#o(){for(;this.#s.length;)this.#s.shift().remove();let t=[];this.#e.adoptedStyleSheets=this.getRootNode().adoptedStyleSheets;for(let s of document.styleSheets)try{this.#e.adoptedStyleSheets.push(s)}catch{let o=s.ownerNode.cloneNode();this.#e.appendChild(o),t.push(new Promise((i,r)=>{o.onload=i,o.onerror=r}))}return Promise.allSettled(t)}adoptStyleSheet(t){this.#e.adoptedStyleSheets.push(t)}get adoptedStyleSheets(){return this.#e.adoptedStyleSheets}};window.customElements.define(\"lustre-server-component\",O);function $(e,t){for(let s in t)t[s]instanceof Object&&Object.assign(t[s],$(e[s],t[s]));return Object.assign(e||{},t),e}export{O as LustreServerComponent};",
      ),
    ]),
  );
}

export function route(path) {
  return attribute("route", path);
}

export function data(json) {
  let _pipe = json;
  let _pipe$1 = $json.to_string(_pipe);
  return ((_capture) => { return attribute("data-lustre-data", _capture); })(
    _pipe$1,
  );
}

export function include(properties) {
  let _pipe = properties;
  let _pipe$1 = $json.array(_pipe, $json.string);
  let _pipe$2 = $json.to_string(_pipe$1);
  return ((_capture) => { return attribute("data-lustre-include", _capture); })(
    _pipe$2,
  );
}

export function subscribe(id, renderer) {
  return new $runtime.Subscribe(id, renderer);
}

export function unsubscribe(id) {
  return new $runtime.Unsubscribe(id);
}

export function emit(event, data) {
  return $effect.event(event, data);
}

function do_set_selector(_) {
  return $effect.none();
}

export function set_selector(sel) {
  return do_set_selector(sel);
}

function decode_event(dyn) {
  return $result.try$(
    $dynamic.tuple3($dynamic.int, dynamic, dynamic)(dyn),
    (_use0) => {
      let kind = _use0[0];
      let name = _use0[1];
      let data$1 = _use0[2];
      return $bool.guard(
        kind !== $constants.event,
        new Error(
          toList([
            new DecodeError(
              $int.to_string($constants.event),
              $int.to_string(kind),
              toList(["0"]),
            ),
          ]),
        ),
        () => {
          return $result.try$(
            $dynamic.string(name),
            (name) => { return new Ok(new Event(name, data$1)); },
          );
        },
      );
    },
  );
}

function decode_attr(dyn) {
  return $dynamic.tuple2($dynamic.string, dynamic)(dyn);
}

function decode_attrs(dyn) {
  return $result.try$(
    $dynamic.tuple2($dynamic.int, dynamic)(dyn),
    (_use0) => {
      let kind = _use0[0];
      let attrs = _use0[1];
      return $bool.guard(
        kind !== $constants.attrs,
        new Error(
          toList([
            new DecodeError(
              $int.to_string($constants.attrs),
              $int.to_string(kind),
              toList(["0"]),
            ),
          ]),
        ),
        () => {
          return $result.try$(
            $dynamic.list(decode_attr)(attrs),
            (attrs) => { return new Ok(new Attrs(attrs)); },
          );
        },
      );
    },
  );
}

export function decode_action(dyn) {
  return $dynamic.any(toList([decode_event, decode_attrs]))(dyn);
}

export function encode_patch(patch) {
  return $patch.patch_to_json(patch);
}
