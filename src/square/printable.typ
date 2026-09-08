#import "recto.typ"
#import "verso.typ"
#import "specs.typ"

#import "/meta/help.typ"

#let margin = specs.outer-padding

#set page(
  width: specs.side + margin * 2,
  height: specs.side + margin * 2,
  margin: margin,
)

#for i in range(recto.rendered.len()) {
  //place(rect(width: 100%, height: 100%))
  move(dx: -specs.outer-padding, dy: -specs.outer-padding, recto.rendered.at(i))
  pagebreak(weak: true)
  move(dx: -specs.outer-padding, dy: -specs.outer-padding, {
    import "@preview/cetz:0.5.2"
    cetz.canvas({
      verso.card(edge: (cut: false, margin: false), hidden-text: help.pad3dig(i))
    })
  })
  pagebreak(weak: true)
}