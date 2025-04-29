#import "template.typ":*


#show: project.with(
  title: "Rational Concept Analysis",
  authors: (
    (name: "Lucas Carr", 
    email: "lucas@airu.org.za", 
    affiliation: "University of Cape Town"),
  ),
  abstract: lorem(59)
)
#include "chapters/chapter1.typ"
#include "chapters/chapter2.typ"
@davey2002introduction
#bibliography("references.bib")

= Index 
#columns(3)[
  #make-index(title:none)
]

