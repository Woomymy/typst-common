#import "@preview/oxifmt:1.0.0": strfmt
#import "math.typ" : xbar, ybar
#import "blocks.typ" : hint, warning, info, todo
#import "template.typ" : note_template

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
    if (desc != "") {
      strfmt(": {}", desc)
    } else {
      ""
    }
  )
}

