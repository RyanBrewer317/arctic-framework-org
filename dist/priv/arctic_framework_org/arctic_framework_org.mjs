import * as $build from "../arctic/arctic/build.mjs";
import * as $config from "../arctic/arctic/config.mjs";
import * as $attribute from "../lustre/lustre/attribute.mjs";
import { attribute } from "../lustre/lustre/attribute.mjs";
import * as $html from "../lustre/lustre/element/html.mjs";
import { div } from "../lustre/lustre/element/html.mjs";
import { toList, makeError } from "./gleam.mjs";
import * as $head from "./head.mjs";
import * as $parser from "./parser.mjs";

export function main() {
  let cfg = (() => {
    let _pipe = $config.new$();
    let _pipe$1 = $config.home_renderer(
      _pipe,
      (_) => {
        let $ = $parser.parse(
          "home",
          "id: home-page\n\n# Arctic\n\nArctic is a high-performance frontend framework for your [Lustre](https://lustre.build/) workloads.\n      ",
        );
        if (!$.isOk()) {
          throw makeError(
            "assignment_no_match",
            "arctic_framework_org",
            12,
            "",
            "Assignment pattern did not match",
            { value: $ }
          )
        }
        let page = $[0];
        return $html.html(
          toList([]),
          toList([$head.head(), $html.body(toList([]), page.body)]),
        );
      },
    );
    return $config.add_spa_frame(
      _pipe$1,
      (body) => {
        return $html.html(
          toList([]),
          toList([
            $html.head(toList([]), toList([])),
            $html.body(
              toList([]),
              toList([
                div(
                  toList([]),
                  toList([
                    div(toList([$attribute.id("boop")]), toList([])),
                    $html.style(
                      toList([]),
                      "\n#boop {\n  width: 48px;\n  height: 48px;\n  border: 5px solid #FFF;\n  border-bottom-color: #FF3D00;\n  border-radius: 50%;\n  display: inline-block;\n  box-sizing: border-box;\n  animation: rotation 1s linear infinite;\n}\n\n@keyframes rotation {\n  0% {\n      transform: rotate(0deg);\n  }\n  100% {\n      transform: rotate(360deg);\n  }\n} \n        ",
                    ),
                    body,
                  ]),
                ),
              ]),
            ),
          ]),
        );
      },
    );
  })();
  return $build.build(cfg);
}
