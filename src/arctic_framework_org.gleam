import arctic/build
import arctic/config

pub fn main() {
  let cfg = config.new()
  build.build(cfg)
}
