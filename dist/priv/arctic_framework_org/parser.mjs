import * as $arctic from "../arctic/arctic.mjs";
import * as $parse from "../arctic/arctic/parse.mjs";
import {
  add_inline_rule,
  add_prefix_rule,
  add_static_component,
  wrap_inline,
  wrap_prefix,
} from "../arctic/arctic/parse.mjs";
import * as $list from "../gleam_stdlib/gleam/list.mjs";
import * as $string from "../gleam_stdlib/gleam/string.mjs";
import { replace, split } from "../gleam_stdlib/gleam/string.mjs";
import * as $attribute from "../lustre/lustre/attribute.mjs";
import { alt, class$, href, src } from "../lustre/lustre/attribute.mjs";
import * as $element from "../lustre/lustre/element.mjs";
import { text } from "../lustre/lustre/element.mjs";
import * as $html from "../lustre/lustre/element/html.mjs";
import { a, code, em, h1, h3, img, li, pre, strong, ul } from "../lustre/lustre/element/html.mjs";
import * as $snag from "../snag/snag.mjs";
import { Ok, toList, makeError } from "./gleam.mjs";

export function parse(src_name, content) {
  let _pipe = $parse.new$(undefined);
  let _pipe$1 = add_prefix_rule(_pipe, "#", wrap_prefix(h1));
  let _pipe$2 = add_prefix_rule(_pipe$1, "###", wrap_prefix(h3));
  let _pipe$3 = add_static_component(
    _pipe$2,
    "ul",
    (_, body, _1) => {
      let $ = split("\n" + body, "\n- ");
      if (!$.atLeastLength(1)) {
        throw makeError(
          "assignment_no_match",
          "parser",
          18,
          "",
          "Assignment pattern did not match",
          { value: $ }
        )
      }
      let rows = $.tail;
      return new Ok(
        [
          ul(
            toList([]),
            $list.map(
              rows,
              (row) => { return li(toList([]), toList([text(row)])); },
            ),
          ),
          undefined,
        ],
      );
    },
  );
  let _pipe$4 = add_static_component(
    _pipe$3,
    "code",
    (args, body, _) => {
      let body2 = replace(body, "\\n", "\n");
      if (args.hasLength(1)) {
        let lang = args.head;
        return new Ok(
          [
            pre(
              toList([]),
              toList([
                code(
                  toList([class$("language-" + lang)]),
                  toList([text(body2)]),
                ),
              ]),
            ),
            undefined,
          ],
        );
      } else {
        return new Ok(
          [
            pre(toList([]), toList([code(toList([]), toList([text(body2)]))])),
            undefined,
          ],
        );
      }
    },
  );
  let _pipe$5 = add_static_component(
    _pipe$4,
    "img",
    (args, body, _) => {
      if (args.hasLength(1)) {
        let url = args.head;
        return new Ok([img(toList([src(url), alt(body)])), undefined]);
      } else {
        return $snag.error("img expected a URL argument");
      }
    },
  );
  let _pipe$6 = add_inline_rule(_pipe$5, "*", "*", wrap_inline(strong));
  let _pipe$7 = add_inline_rule(_pipe$6, "_", "_", wrap_inline(em));
  let _pipe$8 = add_inline_rule(_pipe$7, "`", "`", wrap_inline(code));
  let _pipe$9 = add_inline_rule(
    _pipe$8,
    "[",
    "]",
    (el, args, _) => {
      if (args.hasLength(1)) {
        let url = args.head;
        return new Ok([a(toList([href(url)]), toList([el])), undefined]);
      } else {
        return $snag.error("link expected a URL argument");
      }
    },
  );
  return $parse.parse(_pipe$9, src_name, content);
}
