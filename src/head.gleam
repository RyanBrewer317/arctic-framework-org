import lustre/attribute.{attribute}
import lustre/element/html

pub fn head() {
  html.head([], [
    html.title([], "Arctic"),
    html.meta([attribute("charset", "UTF-8")]),
    html.meta([
      attribute.name("viewport"),
      attribute("content", "width=device-width, initial-scale=1.0"),
    ]),
    html.meta([
      attribute.name("description"),
      attribute(
        "content",
        "Arctic is a high-performance frontend framework for your Lustre workloads.",
      ),
    ]),
    html.link([
      attribute.rel("icon"),
      attribute.type_("image/x-icon"),
      attribute.href("/favicon.ico"),
    ]),
    html.link([
      attribute.rel("stylesheet"),
      attribute.href(
        "https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/styles/atom-one-dark.min.css",
      ),
    ]),
    html.script(
      [
        attribute.src(
          "https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/highlight.min.js",
        ),
      ],
      "",
    ),
    html.script([], "hljs.highlightAll();"),
    html.link([attribute.rel("stylesheet"), attribute.href("/style.css")]),
  ])
}
