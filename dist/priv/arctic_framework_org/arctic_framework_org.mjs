import * as $build from "../arctic/arctic/build.mjs";
import * as $collection from "../arctic/arctic/collection.mjs";
import * as $config from "../arctic/arctic/config.mjs";
import * as $attribute from "../lustre/lustre/attribute.mjs";
import * as $html from "../lustre/lustre/element/html.mjs";
import * as $simplifile from "../simplifile/simplifile.mjs";
import * as $demos from "./demos.mjs";
import { toList, prepend as listPrepend, makeError } from "./gleam.mjs";
import * as $head from "./head.mjs";
import * as $navbar from "./navbar.mjs";
import * as $parser from "./parser.mjs";
import * as $render_guide from "./render_guide.mjs";

export function main() {
  let guides = (() => {
    let _pipe = $collection.new$("guides");
    let _pipe$1 = $collection.with_parser(_pipe, $parser.parse);
    return $collection.with_renderer(_pipe$1, $render_guide.render);
  })();
  let cfg = (() => {
    let _pipe = $config.new$();
    let _pipe$1 = $config.home_renderer(
      _pipe,
      (_) => {
        let $ = $simplifile.read("./content/home.md");
        if (!$.isOk()) {
          throw makeError(
            "assignment_no_match",
            "arctic_framework_org",
            21,
            "",
            "Assignment pattern did not match",
            { value: $ }
          )
        }
        let content = $[0];
        let $1 = $parser.parse("home", content);
        if (!$1.isOk()) {
          throw makeError(
            "assignment_no_match",
            "arctic_framework_org",
            22,
            "",
            "Assignment pattern did not match",
            { value: $1 }
          )
        }
        let page = $1[0];
        return $html.html(
          toList([]),
          toList([
            $html.head(toList([]), toList([])),
            $html.body(toList([]), listPrepend($navbar.navbar(), page.body)),
          ]),
        );
      },
    );
    let _pipe$2 = $config.add_main_page(_pipe$1, "demos", $demos.demos());
    let _pipe$3 = $config.add_collection(_pipe$2, guides);
    return $config.add_spa_frame(
      _pipe$3,
      (body) => {
        return $html.html(
          toList([]),
          toList([
            $head.head(),
            $html.body(
              toList([$attribute.style(toList([["padding-top", "40pt"]]))]),
              toList([body]),
            ),
          ]),
        );
      },
    );
  })();
  return $build.build(cfg);
}
