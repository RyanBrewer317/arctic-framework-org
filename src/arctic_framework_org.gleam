import arctic/build
import arctic/config
import lustre/element

pub fn main() {
  let cfg =
    config.new()
    |> config.home_renderer(fn(_) { element.text("hello from arctic!") })
  build.build(cfg)
}
