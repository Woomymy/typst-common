#import "@preview/oxifmt:1.0.0": strfmt

#let info(content) = {
  box(
    stroke: 1pt + blue,
    radius: 8pt,
    inset: 10pt,
    fill: rgb("#bfd8ff"),
    stack(
      dir: ltr,
      pad(x: 4pt, text(emoji.info)),
      text(emph(content))
    )
  )
}

#let warning(content) = {
  box(
    stroke: 1pt + red,
    radius: 8pt,
    inset: 10pt,
    fill: rgb("#f7ffbd"),
    stack(
      dir: ltr,
      text(emoji.warning),
      text(emph(content))
    )
  )
}

#let cmd(command, args, desc, os: "linux") = {
  text(
    link(
      strfmt("https://tldr.inbrowser.app/pages/{}/{}", os, command),
      if (args == "") {
        raw(command)
      } else {
        raw(strfmt("{} {}", command, args))
      }
    ) +
    strfmt(": {}", desc)
  )
}

