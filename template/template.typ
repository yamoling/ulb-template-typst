// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#let ULB_BLUE = rgb(0, 50, 154)
#let ULB_LIGHT = rgb(218, 230, 255)
#let ULB_DARK = rgb(0, 25, 101)

#let project(
  title: "", 
  subtitle: "", 
  authors: (), 
  lang: "fr", 
  date: none,
  faculty: "",
  department: "",
  body
) = {
  // Set the document's basic properties.
  set heading(numbering: "1.1.")
  set page(numbering: "1", number-align: center)
  set text(font: "Libertinus Serif", lang: lang)
  set par(justify: true)
  set list(indent: 1em)
  set enum(indent: 1em)
  set math.equation(numbering: "(1)")
  set figure(supplement: "Figure")
  set heading(supplement: "Section")
  
  // Page header
  set page(
    margin: (top: 8em),
    header: [
    #box([
      #image(
        width: 35%,
        height: 10%,
        "template/barrette-original.jpg"
      )
    ])
    #h(1fr)
    #box(
      baseline: 70%,
      image(
      width: 60%,
      "template/logo-ULB-ligne.jpg"
    ))

    #v(-3.3em)
    #text(
      font: "Fira Sans", 
      size: 0.8em,
      weight: "regular",
      text(ULB_DARK)[
        #faculty\
        #v(-0.9em)
        #department
      ])
    ],
  )
  
  // Code style
  show raw: it => {
    if not it.text.contains("\n") {
      box(
        baseline: 2pt,
        rect(
          fill: rgb("#ececec"), 
          outset: 0pt,
          inset: 2pt,
          radius: 2pt,
          it
        )
      ) 
    } else {
      block(
        width: 100%,
        fill: rgb("#f2f2f2"),
        inset: 8pt,
        radius: 5pt,
        align(left, it)
      ) 
    }
  }
  show link: name =>  underline(text(blue, name))

  // Title row.
  align(center)[
    #block(text(weight: 700, 1.75em, title))
    #block(text(weight: 700, 1.5em, subtitle))
    #if date != none {
      block(text(weight: 600, 1.5em, date))  
    }
  ]

  // Author information.
  let ncols = calc.min(authors.len(), calc.max(4, authors.len()))
  pad(
    top: 0.5em,
    bottom: 0.5em,
    grid(
      columns: (1fr,) * calc.min(ncols, authors.len()),
      gutter: 1em,
      ..authors.map(author => align(center, strong(author))),
    ),
  )
  body
}