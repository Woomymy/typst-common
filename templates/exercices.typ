#import "note.typ" : note_template

#let exercices_template(
  ..note_template_config,
  doc
) = [
  #show: note_template.with(..note_template_config, pagesubtitle: "Exercices")
  #doc
]
