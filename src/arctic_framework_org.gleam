import arctic/build
import arctic/config
import head
import lustre/attribute.{attribute}
import lustre/element/html.{div}
import parser

pub fn main() {
  let cfg =
    config.new()
    |> config.home_renderer(fn(_) {
      let assert Ok(page) =
        parser.parse(
          "home",
          "id: home-page

# Arctic

Arctic is a high-performance frontend framework for your [Lustre](https://lustre.build/) workloads.
      ",
        )
      html.html([], [head.head(), html.body([], page.body)])
    })
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
