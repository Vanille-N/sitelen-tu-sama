#import "recto.typ"
#import "verso.typ"
#import "specs.typ"

#set page(margin: 1cm)

#show: align.with(center)

#for i in range(6) {
  //place(rect(width: 100%, height: 100%))
  box({
    import "@preview/cetz:0.5.2"
    let t = str(i + 1)
    let t = "0" * (3 - t.len()) + t
    cetz.canvas({
      verso.card(edge: (cut: false, margin: true), hidden-text: t)
    })
  }, inset: 5pt)
}
#for i in range(6) {
  //place(rect(width: 100%, height: 100%))
  box({
    recto.rendered.at(i)
  }, inset: 5pt)
}