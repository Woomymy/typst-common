#let accent = rgb("#3b1463")

#let bigheading(content) = {
  show heading: set text(size: 1.45em, weight: "regular")

  content
}

#let icon_with_text(icon, content) = {
  icon()
  h(0.8em)
  content
}

#let ulink(uri, link) = {underline(link(uri, name))}

#let template(
  show_header_line: true,
  doc
) = [
  #set text(font: "Roboto", lang: "fr")
  #show link: set text(fill: accent)

  #set page("a4", header: {
      line(length: 100%, stroke: stroke(thickness: 3pt, paint: accent, cap: "round"))
  })

  #doc
]

