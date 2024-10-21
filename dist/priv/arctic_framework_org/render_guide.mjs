import * as $arctic from "../arctic/arctic.mjs";
import * as $element from "../lustre/lustre/element.mjs";
import * as $html from "../lustre/lustre/element/html.mjs";
import { toList, prepend as listPrepend } from "./gleam.mjs";
import * as $navbar from "./navbar.mjs";

export function render(page) {
  return $html.div(toList([]), listPrepend($navbar.navbar(), page.body));
}
