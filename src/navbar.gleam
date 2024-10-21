import lustre/attribute.{attribute}
import lustre/element.{type Element, text}
import lustre/element/html

pub fn navbar() -> Element(a) {
  html.nav([attribute.id("nav")], [
    html.div(
      [
        attribute.id("nav-dropdown"),
        attribute(
          "onclick",
          "
const el = document.getElementById('nav');
const height = el.clientHeight;
el.classList.toggle('dropdown');
// because absolute positioning removes the nav from the dom
if (el.classList.contains('dropdown'))
  document.body.style.paddingTop = '' + height + 'px';
else
  document.body.style.paddingTop = '0px';
          ",
        ),
      ],
      [text("☰")],
    ),
    html.a([attribute.href("/"), attribute.id("nav-home")], [text("Arctic")]),
    html.a([attribute.href("/guides/quickstart"), attribute.id("nav-guides")], [
      text("Guides"),
    ]),
    html.a([attribute.href("/demos"), attribute.id("nav-demos")], [
      text("Demos"),
    ]),
    html.a(
      [attribute.href("https://hexdocs.pm/arctic/"), attribute.id("nav-docs")],
      [text("Docs")],
    ),
  ])
}
