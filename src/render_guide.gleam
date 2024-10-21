import arctic.{type Page}
import lustre/element.{type Element}
import lustre/element/html
import navbar

pub fn render(page: Page) -> Element(Nil) {
  html.div([], [navbar.navbar(), ..page.body])
}
