#import "../template.typ":*
#show: thmrules  // you need to include this unfortunately 

= Mathematical Preliminaries 

This chapter is intended to serve as a reference point, clarifying ideas and notation, for the more fundamental concepts that will be used throughout the remainder of this dissertation. In the first section we discuss order and lattice theory. The third and final section introduces propositional logic, as well more general ideas in logic. 

== Order and Lattice Theory <order-and-lattice-theory>
This section refers extensively to the fundemental text by Davey and Priestly @davey2002introduction, as well as @ganter1999formal. 

=== Orders <orders>
A _binary relation_ #index[binary relation] $R$ over the sets $X$ and $Y$ is a set of ordered pairs $(x,y)$ with $x in X$ and $y in Y$. Alternatively, we may express that $(x,y) in R$ using the infix notation $x R y$, expressing that $x$ is related by $R$ to $y$. 

Certain binary relations, satisfying specific properties, occur frequently enough to warrant their own denomination. One such relation, which will be used in almost every section of this dissertation, is called a _partial order_. #index[partial order]

#definition[A _partial order_ a binary relation $prec.curly.eq subset.eq X times X$ that satisfies 
  #v(-1em)
 $ x prec.curly.eq x #text()[(reflxivity)] $
  #v(-1em)
 $ x prec.curly.eq y #text()[and] y prec.curly.eq x #text()[implies] x = y #text()[(antisymmetry)] $ 
  #v(-1em)
 $ x prec.curly.eq y #text()[and] y prec.curly.eq z #text()[implies] x prec.curly.eq z #text()[(transitivity)] $
  #v(-1em)
for all $x,y,z in X$.
]

Frequently, we use 'preference' as a metonymy for order; and so in the context of an order "element $x$ is preferred to element $y$" should be taken to mean that $(x,y) in prec.curly.eq$, or simply $x prec.curly.eq y$. 

We write $x prec.eq.not y$ to indicate that $(x,y)$ is not an element in the relation; $x prec y$ indicates that $x prec.eq y$ and $x != y$. When $x prec.curly.eq.not y$ and $y prec.curly.eq.not x$---i.e., when $x$ and $y$ are incomparable--we write
