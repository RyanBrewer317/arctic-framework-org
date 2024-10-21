import lustre/element.{type Element}
import lustre/element/html.{div}
import navbar
import parser
import simplifile

pub fn demos() -> Element(Nil) {
  let assert Ok(content) = simplifile.read("./content/demos.md")
  let assert Ok(page) = parser.parse("demos.gleam", content)
  div([], [navbar.navbar(), ..page.body])
}
