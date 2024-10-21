import * as $attribute from "../lustre/lustre/attribute.mjs";
import { attribute } from "../lustre/lustre/attribute.mjs";
import * as $element from "../lustre/lustre/element.mjs";
import { text } from "../lustre/lustre/element.mjs";
import * as $html from "../lustre/lustre/element/html.mjs";
import { toList } from "./gleam.mjs";

export function navbar() {
  return $html.nav(
    toList([$attribute.id("nav")]),
    toList([
      $html.div(
        toList([
          $attribute.id("nav-dropdown"),
          attribute(
            "onclick",
            "\nconst el = document.getElementById('nav');\nconst height = el.clientHeight;\nel.classList.toggle('dropdown');\n// because absolute positioning removes the nav from the dom\nif (el.classList.contains('dropdown'))\n  document.body.style.paddingTop = '' + height + 'px';\nelse\n  document.body.style.paddingTop = '0px';\n          ",
          ),
        ]),
        toList([text("☰")]),
      ),
      $html.a(
        toList([$attribute.href("/"), $attribute.id("nav-home")]),
        toList([text("Arctic")]),
      ),
      $html.a(
        toList([
          $attribute.href("/guides/quickstart"),
          $attribute.id("nav-guides"),
        ]),
        toList([text("Guides")]),
      ),
      $html.a(
        toList([$attribute.href("/demos"), $attribute.id("nav-demos")]),
        toList([text("Demos")]),
      ),
      $html.a(
        toList([
          $attribute.href("https://hexdocs.pm/arctic/"),
          $attribute.id("nav-docs"),
        ]),
        toList([text("Docs")]),
      ),
    ]),
  );
}
