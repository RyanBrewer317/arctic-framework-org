import * as $attribute from "../lustre/lustre/attribute.mjs";
import { attribute } from "../lustre/lustre/attribute.mjs";
import * as $html from "../lustre/lustre/element/html.mjs";
import { toList } from "./gleam.mjs";

export function head() {
  return $html.head(
    toList([]),
    toList([
      $html.title(toList([]), "Arctic"),
      $html.meta(toList([attribute("charset", "UTF-8")])),
      $html.meta(
        toList([
          $attribute.name("viewport"),
          attribute("content", "width=device-width, initial-scale=1.0"),
        ]),
      ),
      $html.meta(
        toList([
          $attribute.name("description"),
          attribute(
            "content",
            "Arctic is a high-performance frontend framework for your Lustre workloads.",
          ),
        ]),
      ),
      $html.link(
        toList([
          $attribute.rel("icon"),
          $attribute.type_("image/x-icon"),
          $attribute.href("/favicon.ico"),
        ]),
      ),
      $html.link(
        toList([
          $attribute.rel("stylesheet"),
          $attribute.href(
            "https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/styles/atom-one-dark.min.css",
          ),
        ]),
      ),
      $html.script(
        toList([
          $attribute.src(
            "https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/highlight.min.js",
          ),
        ]),
        "",
      ),
      $html.script(toList([]), "hljs.highlightAll();"),
      $html.link(
        toList([$attribute.rel("stylesheet"), $attribute.href("/style.css")]),
      ),
    ]),
  );
}
