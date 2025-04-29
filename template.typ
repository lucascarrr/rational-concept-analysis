#import "@preview/in-dexter:0.7.0": *
#import "@preview/ctheorems:1.1.3": *
#show: thmrules

///////////////////////////////////////
// Environments 
///////////////////////////////////////
#let theorem = thmbox(
  "theorem", 
  "Theorem", 
  base_level:1,
  padding: (bottom: 0em, top: 0em), 
  inset: (x: 0em))
#let definition = thmbox("definition", "Definition", base_level:1)



///////////////////////////////////////
// Preamble Setup
///////////////////////////////////////
#let project(
  title: "",
  abstract: [],
  authors: (),
  body
) = {
  set page(margin: (top:10em,bottom: 10em, left: 6em, right: 6em))
  set math.equation(numbering: "(1)")
  // set page(header: title)
  // set page(header: context{
  //   if calc.rem(here().page(), 2) == 0 [           // even pages
  //     #align(left, text(currentH(), size: 8pt))
  //   ] else [                                       //odd pages
  //     #align(right, currentH(level: 2))
  //   ]
  // })
  set document(author: authors.map(a => a.name), title: title)
  set text(font: "EB Garamond", lang: "en")
  set heading(numbering: "1.1")
  set par(justify: true)

  // Title 
  v(30%)
  align(center,text(2em, weight: 550, title))
  v(50%)

  pad(
    top: 0.7em,
    grid(
      columns: (1fr),
      gutter: 1em,
      ..authors.map(author => 
        align(center,
          [
            *#author.name* \ 
            #author.email \ 
            #author.affiliation 
          ]
        )
      )
    )
  )
  pagebreak()
  v(20%)
  align(center)[*Abstract*]
  align(center,text(11pt, weight: 550, abstract))

  // Table of contents.
  counter(page).update(1)
  pagebreak()
  show outline.entry: set block(above: 0.8em)
  show outline.entry.where(level: 1): set block(above: 2em)
  outline(depth: 4)
  pagebreak()
  ///////////////////////////////////////
  // Document Typesetting
  ///////////////////////////////////////
  set page(
    numbering: "1", 
    number-align: center, 
    margin: (top:10em,bottom: 10em, left: 6em, right: 6em))

  show heading.where(level: 1): set block(below: 2.5em)
  show heading.where(level: 2): set block(below: 1.5em)
  show heading.where(level: 3): set block(below: 1em)
  show heading.where(level: 4): set text(weight: 400) 
  set par(first-line-indent: 2em, spacing: 2em, justify: true, leading: 1em)
  counter(page).update(1)
  body
  
}

#let all(doc) = [
  #show: thmrules
  #show: styles
  #doc
]

#let numberingH(c)={
  return numbering(c.numbering,..counter(heading).at(c.location()))
}

#let currentH(level: 1)={
  let elems = query(selector(heading.where(level: level)).after(here()))

  if elems.len() != 0 and elems.first().location().page() == here().page() {
    return [#numberingH(elems.first()) #elems.first().body] 
  } else {
    elems = query(selector(heading.where(level: level)).before(here()))
    if elems.len() != 0 {
      return [#numberingH(elems.last()) #elems.last().body] 
    }
  }
  return ""
}

// We need this to get references working between files

