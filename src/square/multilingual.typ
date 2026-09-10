#import "@preview/one-liner:0.3.0": shrink-to-width 

#import "/square/rulebook.typ"
#import rulebook: section, side

#import "/meta/pona.typ"
#import pona: sp, unsp, quot
#import "/meta/palette.typ"
#import palette: cc


#let hfit(c) = context {
  box(width: 1fr, stroke: none)[#shrink-to-width(c)]
}

#set page(flipped: true, margin: (y: 1cm, x: 3mm))
#show: align.with(center)

#let title(c) = pona.title(text(20pt)[#c])
#let heading(c) = pona.heading(text(12pt)[#c])
#let body(c, size: 9.5pt) = pona.body(text(size)[#c])
#let subheading(c) = {
  text(11pt, cc("g"))[#c]
  v(-4mm)
}

#let div(delta) = {
  v(-2mm)
  line(start: (delta,0%), end: (100% - delta,0%), stroke: cc("a-") + 0.5pt)
  v(-2mm)
}

#let intro(lang) = section[
  #unsp[#title[#lang.main-title]]
  #unsp[#body(size: 9.5pt)[
    #lang.intro
  ]]
]

#import "/meta/nimi.typ"

#let fmtable(lang, elts) = {
  set text(size: 8pt, cc("k"))
  table(columns: (1fr, 1fr), stroke: cc("a-") + 0.5pt, inset: (bottom: 2pt, top: 0.5pt),
    ..elts.map(e => [
      #sp[#nimi.chosen-variant(e)]
      #h(2mm)
      #e
      #unsp(cc("a"), 6pt)[
        #hfit[(#lang.translated.at(e, default: text(cc("r-"))[missing]))]
      ]
    ])
  )
  v(-2mm)
}

#import "/meta/classification.typ": features

#let class1(lang) = section[
  #unsp[#heading[#lang.class-title]]
  #v(-2mm)
  #unsp[
    #body(size: 7pt)[#lang.class-intro]
    #v(-3mm)
    #box(stroke: none, width: 100%)[
      #show: align.with(horizon)
      #import "@preview/cetz:0.5.2"
      #box(cetz.canvas({
        import cetz.draw: *
        rect((-0.23,-0.33),(0.01,0.28), stroke: 2pt + cc("y-"), fill: cc("y-"), radius: 0.5mm)
        rect((-0.33,-0.435),(0.11,0.38), stroke: cc("r-") + 5pt, radius: 0.5mm)
        circle((0.32,-0.04), radius: 1.5pt, stroke: cc("b-") + 5pt)
        content((0,0))[#sp(1.5cm)[teje]]
        content((1.4,0))[#unsp(6pt)[
          2 #lang.element(2) (#box(width: 2mm, height: 1.5mm, fill: cc("r-")), #box(width: 2mm, height: 1.5mm, fill: cc("b-"))) \
          1 #lang.dot(1) (#box(width: 2mm, height: 1.5mm, fill: cc("b-"))) \
          1 #lang.area(1) (#box(width: 2mm, height: 1.5mm, fill: cc("y-"))) \
          #lang.curve(false)
        ]]
      }))
      #h(1fr)
      #box(cetz.canvas({
        import cetz.draw: *
        circle((0.3,0.2), radius: 1.5pt, stroke: cc("p-") + 5pt, fill: cc("p-"))
        circle((-0.25,0.22), radius: 1.5pt, stroke: cc("o-") + 6pt, fill: cc("o-"))
        content((0,0))[#sp(1.5cm)[musi]]
        content((1.6,0))[#unsp(6pt)[
          1 #lang.element(1) \
          0 #lang.dot(0) \
          2 #lang.area(2) (#box(width: 2mm, height: 1.5mm, fill: cc("o-")), #box(width: 2mm, height: 1.5mm, fill: cc("p-"))) \
          #lang.curve(true)
        ]]
      }))
    ]
    #v(-4mm)
    #v(1fr)
    #subheading[4+ #lang.element(4), 0 #lang.dot(0)]
    #fmtable(lang, features.con4)
    #v(5mm)
  ]
]
#let class2(lang) = section[
  #unsp[
    #subheading[4+ #lang.element(4), 1+ #lang.dot(2)]
    #fmtable(lang, features.con4dot)
    #subheading[3 #lang.element(3)]
    #fmtable(lang, features.con3)
    #v(1fr)
    #div(1%)
    #[
      #set text(size: 5pt)
      #set par(leading: 1pt)
      #lang.copyright
    ]
    #v(4mm)
    #place(bottom + right)[
      #import "@preview/ccicons:1.0.1"
      #ccicons.cc-by-nc-sa
    ]
  ]
]
#let class3(lang) = section[
  #unsp[
    #subheading[2 #lang.element(2), 1 #lang.dot(1)]
    #fmtable(lang, features.con2dot)
    #subheading[2 #lang.element(2), 0 #lang.dot(0)]
    #fmtable(lang, features.con2)
  ]
]
#let class4(lang) = section[
  #unsp[
    #subheading[1 #lang.element(1), 0 #lang.area(0), #lang.curve(false)]
    #fmtable(lang, features.zone0straight)
    #subheading[1 #lang.element(1), 0 #lang.area(0), #lang.curve(true)]
    #fmtable(lang, features.zone0curve)
  ]
]
#let class5(lang) = section[
  #unsp[
    #subheading[1 #lang.element(1), 1 #lang.area(1), #lang.curve(false)]
    #fmtable(lang, features.zone1straight)
    #subheading[1 #lang.element(1), 1 #lang.area(1), #lang.curve(true)]
    #fmtable(lang, features.zone1curve)
  ]
]
#let class6(lang) = section[
  #unsp[
    #subheading[1 #lang.element(1), 2 #lang.area(2)]
    #fmtable(lang, features.zone2)
    #subheading[1 #lang.element(1), 3+ #lang.area(3)]
    #fmtable(lang, features.zone3)
  ]
]

#let recto(lang) = {
  side(
    border: cc("w-"),
    edge: (margin: false, cut: false),

    intro(lang),
    class1(lang),
    class2(lang),
    class3(lang),
  )
}

#let verso(lang, num) = {
  import "recto.typ"
  side(
    border: (cc("w-"), cc("w-"), cc("w-"), cc("a-")),
    edge: (margin: false, cut: true),

    class4(lang),
    class5(lang),
    class6(lang),
    {
      rulebook.front-page(recto.render(padding: 0pt, edge: (cut: false), recto.ready.at(num)))
      import "@preview/flagada:1.0.1"
      place(top + right, dy: -2mm, dx: 2mm, {
        box(fill: cc("a-"), inset: 3mm, {
          flagada.flag(lang.flag, height: 1cm)
        })
      })
    },
  )
}

#import "tr/en.typ"
#import "tr/fr.typ"
#import "tr/de.typ"
#import "tr/it.typ"

#recto(en)
#recto(fr)
#verso(en, 14)
#verso(fr, 15)

#recto(de)
#recto(it)
#verso(de, 16)
#verso(it, 17)

