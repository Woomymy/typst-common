#let block(stroke_color, left_emoji, content) = {
  box(
    stroke: 1pt + stroke_color,
    radius: 8pt,
    inset: 8pt,
    fill: stroke_color.lighten(70%),
    stack(
      dir: ltr,
      pad(x: 4pt, text(left_emoji)),
      text(emph(content))
    )
  )
}

#let info(content) = block(blue, emoji.info, content)
#let warning(content) = block(red, emoji.warning, content)
#let hint(content) = block(green, emoji.lightbulb, content)
#let todo(content) = block(purple, emoji.zzz, content)

