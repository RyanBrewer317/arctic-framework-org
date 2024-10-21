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
            "document.getElementById('nav').classList.toggle('dropdown');document.body.classList.toggle('noscroll');",
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
