import * as $build from "../arctic/arctic/build.mjs";
import * as $config from "../arctic/arctic/config.mjs";
import * as $element from "../lustre/lustre/element.mjs";

export function main() {
  let cfg = (() => {
    let _pipe = $config.new$();
    return $config.home_renderer(
      _pipe,
      (_) => { return $element.text("hello from arctic!"); },
    );
  })();
  return $build.build(cfg);
}
