#import "@preview/cetz:0.5.2"

#let corner = 4mm
#let inner-padding = 3mm
#let outer-padding = 2mm
#let side = 80mm

#let cut-stroke = (dash: "dashed", thickness: 0.2pt)
#let inner-stroke = rgb("00ffff")
#let outer-stroke = rgb("ff00ff")

#let card-template(edge: (:), padding: auto, color: white, drop-margins: none, __unsafe-decrease-size: 0pt) = {
  import cetz.draw: *
  let outer-padding = if padding == auto { outer-padding } else { padding }
  let side = side - __unsafe-decrease-size
  let small = side / 2 - inner-padding
  let mid = side / 2
  let large = side / 2 + outer-padding
  let zone = (
    left: large,
    right: large,
    top: large,
    bottom: large,
  )
  for k in zone.keys() {
    if drop-margins != none and k in drop-margins {
      zone.at(k) -= outer-padding
    }
  }
  if edge.at("margin", default: false) {
    rect((-zone.left,zone.top), (zone.right,-zone.bottom), stroke: outer-stroke, fill: color)
    rect((-small,-small), (small,small), radius: corner - inner-padding, stroke: inner-stroke)
  } else {
    rect((-zone.left,zone.top), (zone.right,-zone.bottom), stroke: none, fill: color)
    
  }
  if edge.at("cut", default: true) {
    rect((-mid,-mid), (mid,mid), radius: corner, stroke: cut-stroke)
  }
}

#set page(margin: 1cm)

#box(cetz.canvas({
  card-template(edge: (margin: true, cut: true))
}))
#box(cetz.canvas({
  card-template(edge: (cut: true), color: rgb("aaccff"))
}))
#box(cetz.canvas({
  card-template(edge: (cut: false), color: rgb("aaccff"))
}))
