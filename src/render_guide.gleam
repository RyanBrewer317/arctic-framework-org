import arctic.{type Page}
import lustre/element.{type Element}
import lustre/element/html

pub fn render(page: Page) -> Element(Nil) {
  html.html([], [html.head([], []), html.body([], page.body)])
}
