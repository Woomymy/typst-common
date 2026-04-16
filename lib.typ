#import "@local/heh-template:1.0.0" : info, hint, important, silly
#import "@preview/oxifmt:1.0.0": strfmt

#import "math.typ" : xbar, ybar
#import "auto_correction.typ"

#import "templates/note.typ" : note_template
#import "templates/glossary.typ" : glossary_template
#import "templates/exercices.typ" : exercices_template
#import "templates/simple_doc.typ"

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

