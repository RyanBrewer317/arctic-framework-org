import * as $build from "../arctic/arctic/build.mjs";
import * as $config from "../arctic/arctic/config.mjs";
import * as $attribute from "../lustre/lustre/attribute.mjs";
import * as $element from "../lustre/lustre/element.mjs";
import * as $html from "../lustre/lustre/element/html.mjs";
import { a, div } from "../lustre/lustre/element/html.mjs";
import { toList } from "./gleam.mjs";

export function main() {
  let cfg = (() => {
    let _pipe = $config.new$();
    let _pipe$1 = $config.home_renderer(
      _pipe,
      (_) => {
        return div(
          toList([]),
          toList([
            $element.text("hello from arctic! "),
            a(
              toList([$attribute.href("/test")]),
              toList([$element.text("test")]),
            ),
          ]),
        );
      },
    );
    return $config.add_main_page(_pipe$1, "test", $element.text("woo!"));
  })();
  return $build.build(cfg);
}
