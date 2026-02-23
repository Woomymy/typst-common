#import "@preview/glossy:0.9.0" : init-glossary

#let note_template(
  pagetitle: "Prise de notes",
  outlinetitle: "Tables des matières",
  year: "2025-2026",
  classname: "Cours de",
  captionimages: true,
  centertables: true,
  glossary: (),
  ..args,
  doc
) = [
  #set page("a4")
  #set heading(numbering: "1.")
  #set document(title: pagetitle)
 
  #show: init-glossary.with(glossary)
  #[
    #set par(spacing: 0.7em)
    #set page(background: line(start: (-45%, 0%), end: (-45%, 95%), stroke: (thickness: 4pt, paint: black, cap: "round")))
    
    #align(horizon)[
      #text(size: 36pt, fill: gray.darken(40%), classname)

      #text(size: 36pt, pagetitle)

      #text(size: 36pt, "Notes")
    ]
    #pagebreak()
  ]

  #outline(title: outlinetitle, depth: 4)
  #pagebreak()

  // Réinitialisation du nombre de pages
  #counter(page).update(1)
  
  #set page(numbering: "1/1", footer: context [
    *#classname*
    #h(1fr)
    #counter(page).display(
      "1/1",
      both: true,
    )
    #h(1fr)
    *#year*
  ])
   
  #show table: it => {
    if centertables {
      align(center, it)
    } else {
      it
    }
  }

  #show image: it => {
    if captionimages {
      let caption = if it.alt == none { it.source } else { it.alt }
      figure(caption: caption, it)
    } else {
      it
    }
  }
  
  #show link: set text(fill: blue, weight: 700)
  
  #doc
]

