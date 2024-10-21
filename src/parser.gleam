import arctic.{type Page}
import arctic/parse.{
  add_inline_rule, add_prefix_rule, add_static_component, wrap_inline,
  wrap_prefix,
}
import gleam/list
import gleam/string.{replace, split}
import lustre/attribute.{alt, class, href, src}
import lustre/element.{text}
import lustre/element/html.{a, code, em, h1, h3, img, li, pre, strong, ul}
import snag.{type Snag}

pub fn parse(src_name: String, content: String) -> Result(Page, Snag) {
  parse.new(Nil)
  |> add_prefix_rule("#", wrap_prefix(h1))
  |> add_prefix_rule("###", wrap_prefix(h3))
  |> add_static_component("ul", fn(_args, body, _data) {
    // TODO: make this better
    let assert [_, ..rows] = split("\n" <> body, "\n- ")
    Ok(#(ul([], list.map(rows, fn(row) { li([], [text(row)]) })), Nil))
  })
  |> add_static_component("code", fn(args, body, _data) {
    let body2 = replace(body, "\\n", "\n")
    case args {
      [lang] ->
        Ok(#(pre([], [code([class("language-" <> lang)], [text(body2)])]), Nil))
      _ -> Ok(#(pre([], [code([], [text(body2)])]), Nil))
    }
  })
  |> add_static_component("img", fn(args, body, _data) {
    case args {
      [url] ->
        Ok(#(
          img([src(url), alt(body), attribute.attribute("async", "true")]),
          Nil,
        ))
      _ -> snag.error("img expected a URL argument")
    }
  })
  |> add_inline_rule("*", "*", wrap_inline(strong))
  |> add_inline_rule("_", "_", wrap_inline(em))
  |> add_inline_rule("`", "`", wrap_inline(code))
  |> add_inline_rule("[", "]", fn(el, args, _data) {
    case args {
      [url] -> Ok(#(a([href(url)], [el]), Nil))
      _ -> snag.error("link expected a URL argument")
    }
  })
  |> parse.parse(src_name, content)
}
