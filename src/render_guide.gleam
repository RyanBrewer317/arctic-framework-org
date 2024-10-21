import arctic.{type Page}
import head
import lustre/element.{type Element}
import lustre/element/html

pub fn render(page: Page) -> Element(Nil) {
  html.html([], [head.head(), html.body([], page.body)])
}
