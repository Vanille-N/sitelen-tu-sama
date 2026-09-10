#let sp(..args) = {
  let contextsubst(x) = {
    tt => {
      if text.font == "sitelen seli kiwen asuki" {
        x
      } else {
        tt
      }
    }
  }
  show ".": contextsubst(h(4mm))
  show ",": contextsubst(h(2mm))
  show ";": contextsubst(h(1mm))
  set text(font: "sitelen seli kiwen asuki")
  text(..args)
}

#let unsp(..args) = {
  set text(font: "Atma")
  text(..args)
}

#let mono(..args) = {
  set text(font: "sitelen seli kiwen asuki")
  text(..args)
}

#sp(red)[toki a. mi jan [namako en weka en namako] #unsp[~Typst ~(133)] #mono[~(001)]]

#import "palette.typ"
#let quot(..args) = {
  let args = args.pos()
  let (c,t) = if args.len() == 2 {
    args
  } else {
    ("b", args.at(0))
  }
  sp[te #sp(palette.cc(c))[#t] to]
}


#let title(c) = {
  show: align.with(center)
  show: underline.with(stroke: palette.dark.red)
  show: par.with(leading: 9pt)
  set text(30pt, palette.dark.red)
  c
}
#let heading(c) = {
  show: align.with(center)
  show: par.with(leading: 5pt)
  set text(20pt, palette.dark.blue)
  c
}
#let body(c, size: 14pt) = {
  show: par.with(leading: 5pt)
  set text(size, palette.dark.gray)
  c
}
