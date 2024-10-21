import * as $arctic from "../arctic/arctic.mjs";
import * as $element from "../lustre/lustre/element.mjs";
import * as $html from "../lustre/lustre/element/html.mjs";
import { toList } from "./gleam.mjs";

export function render(page) {
  return $html.html(
    toList([]),
    toList([
      $html.head(toList([]), toList([])),
      $html.body(toList([]), page.body),
    ]),
  );
}
