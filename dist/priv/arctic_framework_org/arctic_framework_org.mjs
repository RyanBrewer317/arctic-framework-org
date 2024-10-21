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
        return $html.html(
          toList([]),
          toList([
            $html.head(
              toList([]),
              toList([$html.style(toList([]), "body { color: purple; }")]),
            ),
            $html.body(
              toList([]),
              toList([
                $element.text("hello from SPA Arctic! "),
                a(
                  toList([$attribute.href("/test")]),
                  toList([$element.text("test")]),
                ),
              ]),
            ),
          ]),
        );
      },
    );
    let _pipe$2 = $config.add_main_page(
      _pipe$1,
      "test",
      $html.html(
        toList([]),
        toList([
          $html.head(toList([]), toList([])),
          $html.body(
            toList([]),
            toList([
              $element.text("woo! "),
              a(
                toList([$attribute.href("/")]),
                toList([$element.text("back home")]),
              ),
            ]),
          ),
        ]),
      ),
    );
    return $config.add_spa_frame(
      _pipe$2,
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
