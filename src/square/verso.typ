#import "@preview/cetz:0.5.2"

#let polar(s, unit: 1cm) = {
  let (alph, rad) = s.split(":")
  (angle: float(alph)*1deg, radius: float(rad)*unit)
}

#import "/meta/pona.typ": sp, mono
#import "/meta/palette.typ"
#import "specs.typ"

#let pattern = rect(width: 10cm, height: 30mm, fill: palette.dark.gray)[
  #set text(fill: palette.standard.gray, size: 20pt)
  #move(dx: -5mm, dy: -5mm)[#for i in range(3) {
    sp[sama tu sama tu sama tu]
    linebreak()
    v(-9mm)
    h(1.2mm)
    sp[tu sama tu sama tu sama]
    linebreak()
    v(-9mm)
  }]
]

#let as-tiling(offset) = tiling(size: (17.7mm, 10.25mm), offset: offset)[#pattern]

#let card(edge: (:), padding: 0pt, hidden-text: none) = {
  import cetz.draw: *
  specs.card-template(edge: edge, padding: padding, color: as-tiling((padding,padding)))

  if hidden-text != none {
   rect((-2.53cm,-2.3cm), (to:(), rel:(5mm,4mm)), fill: palette.dark.gray, stroke: none)
   content((-2.27,-2.1))[#mono(palette.standard.gray, size: 11pt)[#hidden-text]]
  }
  for c in ((0,0), (1.5,0), (0,1.5), (-1.5,0), (0,-1.5)) {
    circle(c, radius: specs.side * 15%, fill: palette.standard.black, stroke: none)
  }
  content((0,0), text(70pt)[
    #show: sp
    #h(1.1cm) #text(palette.standard.green)[sama] \
    #v(-3.3cm)
    #text(palette.standard.red)[tu] #text(palette.standard.purple)[sitelen] #text(palette.standard.blue)[tu] \
    #v(-3.3cm)
    #h(1.1cm) #text(palette.standard.yellow)[sama]
  ])
}

#set page(margin: 1cm)
#box(cetz.canvas({
  card(edge: (margin: true))
}), inset: 1pt)
#box(cetz.canvas({
  card(edge: (cut: true, margin: true), padding: 2cm, hidden-text: [888])
}), inset: 1pt)
#box(cetz.canvas({
  card(edge: (cut: true, margin: true), padding: 2mm, hidden-text: [000])
}), inset: 1pt)
#box(cetz.canvas({
  card(edge: (cut: true, margin: true), padding: 0pt, hidden-text: [111])
}), inset: 1pt)
#box(cetz.canvas({
  card(edge: (cut: true, margin: true), hidden-text: [042])
}), inset: 1pt)
