import arctic/build
import arctic/config
import lustre/attribute
import lustre/element
import lustre/element/html.{a, div}

pub fn main() {
  let cfg =
    config.new()
    |> config.home_renderer(fn(_) {
      div([], [
        element.text("hello from arctic! "),
        a([attribute.href("/test")], [element.text("test")]),
      ])
    })
    |> config.add_main_page("test", element.text("woo!"))
  build.build(cfg)
}
