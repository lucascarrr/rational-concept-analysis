#import "template.typ": project

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


