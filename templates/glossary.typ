#let glossary_template(config, doc) = {
  import "@local/common:1.0.0" : note_template
  import "@preview/glossy:0.9.0" : glossary

  show: note_template.with(
    pagetitle: "Glossaire",
    outlineshow: false,
    ..config
  )

  glossary(
    show-all: true,
    sort: false
  )
}
