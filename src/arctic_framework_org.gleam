import arctic/build
import arctic/config
import lustre/attribute
import lustre/element
import lustre/element/html.{a, div}

pub fn main() {
  let cfg =
    config.new()
    |> config.home_renderer(fn(_) {
      html.html([], [
        html.head([], [html.style([], "body { color: purple; }")]),
        html.body([], [
          element.text("hello from SPA Arctic! "),
          a([attribute.href("/test")], [element.text("test")]),
        ]),
      ])
    })
    |> config.add_main_page(
      "test",
      html.html([], [
        html.head([], []),
        html.body([], [
          element.text("woo! "),
          a([attribute.href("/")], [element.text("back home")]),
        ]),
      ]),
    )
    |> config.add_spa_frame(fn(body) {
      html.html([], [
        html.head([], []),
        html.body([], [
          div([], [
            div([attribute.id("boop")], []),
            html.style(
              [],
              "
#boop {
  width: 48px;
  height: 48px;
  border: 5px solid #FFF;
  border-bottom-color: #FF3D00;
  border-radius: 50%;
  display: inline-block;
  box-sizing: border-box;
  animation: rotation 1s linear infinite;
}

@keyframes rotation {
  0% {
      transform: rotate(0deg);
  }
  100% {
      transform: rotate(360deg);
  }
} 
        ",
            ),
            body,
          ]),
        ]),
      ])
    })
  build.build(cfg)
}
