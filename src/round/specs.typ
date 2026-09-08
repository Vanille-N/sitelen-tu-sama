#import "@preview/cetz:0.5.2"

#let radius = 4.3cm
#let inner-padding = 3mm
#let outer-padding = 2mm

#let card-template(edge: (:), color: white) = {
  import cetz.draw: *
  if edge.at("margin", default: false) {
    circle((0,0), radius: radius + outer-padding, stroke: rgb("00ffff"))
    circle((0,0), radius: radius - inner-padding, stroke: rgb("ff00ff"))
  } else {
    circle((0,0), radius: radius + outer-padding, fill: color, stroke: none)
  }
  if edge.at("cut", default: true) {
    circle((0,0), radius: radius, stroke: (dash: "dashed", thickness: 0.5pt))
  } 
}

#set page(margin: 1cm)

#box(cetz.canvas({
  card-template(edge: (margin: true, cut: true))
}))
#box(cetz.canvas({
  card-template(edge: (cut: true), color: red)
}))
#box(cetz.canvas({
  card-template(edge: (cut: false), color: red)
}))