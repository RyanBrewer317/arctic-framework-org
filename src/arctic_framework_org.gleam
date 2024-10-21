import arctic/build
import arctic/collection
import arctic/config
import head
import lustre/element/html.{div}
import navbar
import parser
import render_guide
import simplifile

pub fn main() {
  let guides =
    collection.new("guides")
    |> collection.with_parser(parser.parse)
    |> collection.with_renderer(render_guide.render)
  let cfg =
    config.new()
    |> config.home_renderer(fn(_) {
      let assert Ok(content) = simplifile.read("./content/home.md")
      let assert Ok(page) = parser.parse("home", content)
      html.html([], [head.head(), html.body([], page.body)])
    })
    |> config.add_collection(guides)
    |> config.add_spa_frame(fn(body) {
      html.html([], [
        html.head([], []),
        html.body([], [div([], [navbar.navbar(), body])]),
      ])
    })
  build.build(cfg)
}
