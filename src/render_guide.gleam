import arctic.{type Page}
import lustre/element.{type Element}
import lustre/element/html
import navbar

pub fn render(page: Page) -> Element(Nil) {
  html.html([], [
    html.head([], []),
    html.body([], [navbar.navbar(), ..page.body]),
  ])
}
