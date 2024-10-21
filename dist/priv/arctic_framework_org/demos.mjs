import * as $element from "../lustre/lustre/element.mjs";
import * as $html from "../lustre/lustre/element/html.mjs";
import { div } from "../lustre/lustre/element/html.mjs";
import * as $simplifile from "../simplifile/simplifile.mjs";
import { toList, makeError } from "./gleam.mjs";
import * as $parser from "./parser.mjs";

export function demos() {
  let $ = $simplifile.read("./content/demos.md");
  if (!$.isOk()) {
    throw makeError(
      "assignment_no_match",
      "demos",
      7,
      "demos",
      "Assignment pattern did not match",
      { value: $ }
    )
  }
  let content = $[0];
  let $1 = $parser.parse("demos.gleam", content);
  if (!$1.isOk()) {
    throw makeError(
      "assignment_no_match",
      "demos",
      8,
      "demos",
      "Assignment pattern did not match",
      { value: $1 }
    )
  }
  let page = $1[0];
  return div(toList([]), page.body);
}
