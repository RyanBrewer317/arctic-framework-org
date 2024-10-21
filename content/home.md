id: home-page

# Arctic

@img(/banner.jpg)
An icy horizon in the Arctic.

### Performance on Ice

Arctic is a friendly web framework for the [Gleam](https://gleam.run) programming language.
Author content in the language you want, generate HTML at build time,
and serve a high-performance experience on the rocks.

By default, Arctic will produce SPAs that fetch and render statically-hosted HTML pages.
This offers fast initial load times and responsive navigation through a site,
and does not compromise SEO.
All of this is handled automatically by the framework.

Arctic websites use content-to-HTML compilers that
are easy to extend and can helpfully validate content.
To get a sense of how this works, check out the [quickstart](/guides/quickstart)!

You could call it static, or you could call it frozen.
However, Arctic sites integrate well with your high-performance Gleam [backends](https://github.com/Pevensie),
or any others! It's just a way of organizing your client side code,
which happens to not always require a server side codebase at all.
And if you use a Gleam backend, you can reuse Lustre components across the stack!

### Ecosystem Integration

Arctic automates and speeds up parts of your [Lustre](https://lustre.build/) workloads.
Use your existing Lustre components,
knowing that Arctic orchestrates them into a fast final product. 
Proper support for client-side Lustre applications
(as opposed to server-rendered Lustre components)
is under active development, though there are tricks for doing it right now.
In general you will find that Arctic does not prevent you from doing what you want,
but simply makes certain things much easier.

Handle build-time validation with the [Snag](https://hexdocs.pm/snag/) library,
for convenient and helpful error messages.
Arctic's smart parsing will collect many such helpful errors, 
instead of halting on the first one.

Arctic parsers are modular, 
and broadly useful parser components can be found in the Gleam ecosystem.
For example, [here](https://github.com/RyanBrewer317/arctic_plugin_diagram)
is a parser component you can use for pretty SVG diagrams from TikZ-CD latex code!
I personally use it [here](https://ryanbrewer.dev/posts/getting-started-category-theory).