#import "template/template.typ": *



// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.
#show: project.with(
  title: "Un super titre",
  subtitle: [Et un super sous-titre],
  date: "2025-2026",
  authors: (
    [Auteur #smallcaps("Un")],
    [Autrice #smallcaps("Deux")],
  ),
  faculty: "FACULTÉ DES SCIENCES",
  department: "DÉPARTEMENT D'INFORMATIQUE"
)



#let note(it, header: none) = {
  if header == none {
    header = "Note"
  }
  rect(
    radius: 10%, 
    width: 100%,
    stroke: none, 
    inset: 0.6em,
    fill: ULB_LIGHT,
    [ #text(ULB_BLUE, [*#header:*]) #h(0.25em) #it ]
  )
}

= Titre

#lorem(20)

= Code
```sh
# uv is a wonderful Python tool !
curl -LsSf https://astral.sh/uv/install.sh | sh
uv sync
```

Le code `inline` est aussi coloré.


= Notes
#note(header: "Un titre", lorem(50))


= Math
Les équations ont des numéros et sont référençables. L'@eq:syracuse définit la suite de Syracuse.
$
u_(n+1) = cases(u_n / 2 "si u_n est pair", 3u_n + 1 "si " u_n " est impair")
$ <eq:syracuse>

