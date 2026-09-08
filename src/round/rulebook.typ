#import "@preview/cetz:0.5.2"

#import "specs.typ"
#import "/meta/palette.typ"
#import palette: cc

#import "/meta/comb.typ"


#let orelse(v, truth: v => v != none, backup) = {
  if truth(v) { v } else { backup }
}

#set par(leading: 1pt)

#import "/meta/pona.typ": sp, unsp, quot, body, heading, title

#let cutcirc(center, radius, left: auto, right: auto, both: auto, stroke: auto, fill: auto) = {
  import cetz.draw as d
  if stroke == auto { stroke = black }
  if fill == auto { fill = none }
  if left == auto {
    if both == auto {
      left = none
    } else {
      left = both
    }
  }
  if right == auto {
    if both == auto {
      right = none
    } else {
      right = both
    }
  }
  {
    d.hide({
      let left = orelse(left, -5mm)
      if left > 0pt { left *= -1 }
      let right = orelse(right, 5mm)
      d.circle(name: "c", center, radius: radius)
      d.line(name: "l1", (right,radius), (right,-radius))
      d.line(name: "l2", (left,radius), (left,-radius))
    })
    d.intersections("i", "c", "l1", "l2")
    d.merge-path(stroke: stroke, fill: fill, {
      if right == none {
        d.arc-through("i.0", (radius,0), "i.1")
      } else {
        d.line("i.0", "i.1", stroke: red)
      }
      d.arc-through("i.1", (0,radius), "i.2")
      if left == none {
        d.arc-through("i.2", (-radius,0), "i.3")
      } else {
        d.line("i.2", "i.3", stroke: red)
      }
      d.arc-through("i.3", (0,-radius), "i.0")
    })
  }
}

#let cut-width = 3.7cm

#let side(border: white, edge: (:), background: white, linebreaks: (), symmetry: false, ..pages) = {
  show: c => if symmetry { scale(x: -100%, c) } else { c }
  let len = pages.len()
  for (idx, pg) in pages.pos().enumerate() {
    let border = if type(border) == color { border } else { border.at(idx) }
    if idx in linebreaks {
      linebreak()
    }
    let canvas = cetz.canvas({
      import cetz.draw: *
      let cut-left = (idx != 0) and (idx not in linebreaks)
      let cut-right = (idx != len - 1) and (idx + 1 not in linebreaks)
      let p = (cut-left, cut-right)
      let outer-cut = if p == (false, true) {
        (right: cut-width)
      } else if p == (true, false) {
        (left: cut-width)
      } else if p == (true, true) {
        (both: cut-width)
      } else {
        (:)
      }
      let true-width = (
        (specs.radius - specs.inner-padding) * 2,
        if idx != 0 { cut-width - specs.radius },
        if idx != len - 1 { cut-width - specs.radius },
      ).sum()
      if symmetry { pg = std.scale(x: -100%, pg) }
      let overlay = box(fill: background, width: true-width, height: 2*specs.radius)[#pg]
      let inner-stroke = if edge.at("margin", default: false) {
        red
      } else { none }
      let outer-stroke = if edge.at("margin", default: false) {
        green
      } else { none }
      let tiler = tiling(size: (2*specs.radius,2*specs.radius), overlay)
      cutcirc((0,0), specs.radius + specs.outer-padding, ..outer-cut, stroke: outer-stroke, fill: border)
      if idx == 0 {
        if edge.at("cut", default: true) {
          cutcirc((0,0), specs.radius, right: cut-width, stroke: (thickness: 0.5pt, dash: "dashed"))
        }
        cutcirc((0,0), specs.radius - specs.inner-padding, right: cut-width - specs.inner-padding, stroke: inner-stroke, fill: tiler)
      } else if idx == len - 1 {
        if edge.at("cut", default: true) {
          cutcirc((0,0), specs.radius, left: cut-width, stroke: (thickness: 0.5pt, dash: "dashed"))
        }
        cutcirc((0,0), specs.radius - specs.inner-padding, left: cut-width - specs.inner-padding, stroke: inner-stroke, fill: tiler)
      } else {
        if edge.at("cut", default: true) {
          cutcirc((0,0), specs.radius, both: cut-width, stroke: (thickness: 0.5pt, dash: "dashed"))
        }
        cutcirc((0,0), specs.radius - specs.inner-padding, both: cut-width - specs.inner-padding, stroke: inner-stroke, fill: tiler)
      }
    })
    box(canvas)
  }
}

#let minicard(center, rescale: 100%, name: "", symbs: ()) = {
  import cetz.draw: *
  circle(name: name, center, radius: 9mm * rescale, stroke: palette.standard.gray, fill: palette.standard.white)
  for (idx, symb) in symbs.enumerate() {
    content((to: center, rel: (angle: 360deg/4 * idx, radius: 5mm * rescale)), name: name + "_" + str(idx))[#sp(red, 20pt * rescale, symb)]
  }
}



#let introduction = [
    #v(5mm)
    #sp[#title[sitelen tu sama]]
    #box(inset: (left: 2pt))[
      #sp[#body[
        .. toki a. mi jan #sp(cc("g"))[[namako en weka en namako]],
          anu jan #sp(cc("g"))[[Newen]] \
        . mi pali e musi ni.
          mi wile e ni2.,
          sina musi pona kepeken musi mi. \
        , ona li jo e lipu sike mute. lipu ale li ante, li jo e sitelen ante \
        ; taso lipu tu ale la, sitelen tu taso li sama a, o alasa e ona, o toki e ona.
      ]]
      #v(-2mm)
      #align(center)[#cetz.canvas({
        import cetz.draw: *
        minicard((0,0), name: "a", symbs: (
          text(palette.standard.red)[kijetesantakalu], text(palette.standard.blue)[musi],
          text(palette.standard.orange)[tu],
          text(palette.standard.green)[lape],
        ))
        minicard((3,0), name: "b", symbs: (
          text(palette.standard.yellow)[kiwen],
          text(palette.standard.aqua)[kijetesantakalu],
          text(palette.standard.red)[lon],
          text(palette.standard.purple)[waso],
        ))
        minicard((1.5,-1.7), name: "c", symbs: (
          text(palette.standard.blue)[loje],
          text(palette.standard.yellow)[waso],
          text(palette.standard.aqua)[lape],
          text(palette.standard.orange)[suno],
        ))
        bezier((to:"a_0",rel:(0.15,0.27)), (to:"b_1",rel:(-0.15,0.1)), (1.5,1), mark: (start: ">", end: ">", scale: 0.4), stroke: palette.dark.gray)
        bezier((to:"a_3",rel:(0.1,-0.17)), (to:"c_2",rel:(-0.2,0.05)), (0,-1.5), mark: (start: ">", end: ">", scale: 0.4), stroke: palette.dark.gray)
        bezier((to:"b_3",rel:(-0.15,-0.3)), (to:"c_1",rel:(0.25,-0.1)), (2.5,-1.5), mark: (start: ">", end: ">", scale: 0.4), stroke: palette.dark.gray)
      })]
    ]
  ]
  
#let contents = [
    #v(5mm)
    #sp[#heading[seme li lon ijo musi]]
    #box(inset: (left: 7pt))[#sp[#body[
      nanpa wan la, li jo e poki. o pana e ale ante lon insa poki. \
      nanpa tu la, lipu pi(ale mute2 luka luka tu wan) li lon #unsp[#h(5mm) (133)] \
      nanpa tu wan la, lipu wan pi(sona nasin) li lon. sina lukin e ona. \
      \
      lipu ale la, sitelen pi(luka luka tu) li lon #unsp[#h(5mm) (12)] \
      ale la, sitelen pi(ale mute2 luka luka tu wan) li lon #unsp[#h(5mm) (133)] \
      #h(5mm) ni3 li mute sama tan nanpa lipu a. ni4 li pona tan ni8. \
      #h(5mm) kepeken sona nanpa la, jan li ken sona pona e ni8 \
      #h(10mm) sitelen ale tu la, sitelen tu li sama. \
      #h(10mm) sitelen ale tu la, sitelen tu taso li sama. \
      #h(20mm) musi a. ale li pona.
    ]]]
    #place(center + horizon, dx: 1.8cm, dy: 2cm)[#sp(50pt, palette.standard.purple)[kijetesantakalu]]
  ]
  
#let how-to-play = [
    #v(5mm)
    #sp[#heading[nasin musi li seme]]
    #box(inset: (left: 7pt))[
      #sp[#body[
        jan ale pi(wile musi), o lon poka #sp(cc("k+"))[supa], o kama jo e lipu wan taso \
        lipu ale ante li #sp(cc("g"))[kulupu lon meso] supa. musi li open a \
        o alasa e sitelen sama lon #sp(cc("b"))[lipu pi(sewi2 kulupu sina)] en #sp(cc("g"))[lipu pi(sewi2 kulupu meso)]. \
        sina sona la, o toki wawa e #sp(cc("y"))[nimi ona]. sina wile toki nanpa wan. \
        lipu li tawa sewi2 #sp(cc("b"))[pi(kulupu pi(jan nanpa wan))],
        #sp(cc("g"))[lipu pi(sewi2 kulupu meso)] li kama ante \
        o alasa kin. #sp(cc("g"))[kulupu lipu meso] li pini la, o nanpa e lipu lon #sp(cc("b"))[kulupu sina]. \
        jan wan li jo e ona mute namako tawa jan ale la, ona li wawa nanpa wan
      ]]
      #v(-6mm)
      #align(center)[#cetz.canvas({
        import cetz.draw: *
        rect((-3,-1), (3,2), stroke: none)
        content((0,-0.07))[#sp(100pt, cc("k-"))[supa]]
        content((2,0.85))[#sp(50pt, palette.dark.blue)[jan]]
        content((2,0.9))[#sp(15pt, palette.dark.blue)[sina]]
        content((-2,0.85))[#sp(50pt, palette.dark.red)[jan]]
        content((-2,0.9))[#sp(15pt, palette.dark.red)[ante]]
        
        
        minicard((-0.1,0.7), rescale: 40%)
        minicard((-0.1,0.8), rescale: 40%)
        minicard((-0.1,0.9), rescale: 40%)
        minicard((-0.1,1.0), rescale: 40%)
        minicard((-0.1,1.1), rescale: 40%, symbs: (
          text(palette.standard.green)[sama],
          text(palette.standard.orange)[mute],
          text(palette.standard.yellow)[lon],
          text(palette.standard.purple)[kijetesantakalu],
        ))
        content((-0.1,-0))[#sp(cc("g"))[kulupu meso]]

        minicard((-0.9,0.7), rescale: 40%)
        minicard((-0.9,0.8), rescale: 40%, symbs: (
          text(palette.standard.blue)[seme],
          text(palette.standard.orange)[lon],
          text(palette.standard.aqua)[ante],
          text(palette.standard.purple)[mi],
        ))
        content((-1.15,-0))[#sp(cc("r+"))[kulupu ante]]

        minicard((0.8,0.7), rescale: 40%)
        minicard((0.8,0.8), rescale: 40%)
        minicard((0.8,0.9), rescale: 40%, symbs: (
          text(palette.standard.yellow)[kijetesantakalu],
          text(palette.standard.green)[mi],
          text(palette.standard.purple)[ale],
          text(palette.standard.red)[meli2]
        ))
        content((1,-0))[#sp(cc("b+"))[kulupu sina]]

        content((2.9,1.5))[#sp(35pt, palette.dark.gray)[toki]]
        content((2.92,1.42))[#sp(13pt, palette.standard.yellow)[kijetesantakalu]]
        bezier((2.50,1.13), (2.67,1.25), (2.65,1.1), stroke: palette.standard.gray)
        bezier((0.1,1.4), (0.8,1.25), (0.6,1.6), mark: (end: ">", scale: 0.4), stroke: palette.standard.gray)
      })]
    ]
  ]
  
#let deduplication = [
    #v(5mm)
    #sp[#heading[sitelen ante li lon ala tan seme #h(7mm)]]
    #box(inset: (left: 7pt), width: 100%)[
      #sp[#body[
        suli sitelen li ken ante \
        kule sitelen li ken ante \
        tawa sitelen li ken ante \
      ]]
      #place(top + right, dx: -13mm, dy: -4.2mm)[
        #show: align.with(left)

        #h(2.2mm)
        #sp(palette.standard.aqua, 9pt)[kijetesantakalu]
        #sp[sama]
        #sp(palette.standard.aqua, 15pt)[kijetesantakalu]
        #sp[sama]
        #sp(palette.standard.aqua, 25pt)[kijetesantakalu] \
        
        #v(-3mm)
        
        #sp(palette.standard.yellow, 15pt)[kijetesantakalu]
        #sp[sama]
        #sp(palette.standard.green, 15pt)[kijetesantakalu]
        #sp[sama]
        #sp(palette.standard.red, 15pt)[kijetesantakalu] \

        #v(-3mm)

        #box(rotate(120deg)[#sp(palette.standard.purple, 15pt)[kijetesantakalu]])
        #sp[sama]
        #sp(palette.standard.purple, 15pt)[kijetesantakalu]
        #sp[sama]
        #box(rotate(-120deg)[#sp(palette.standard.purple, 15pt)[kijetesantakalu]]) \
      ]
      #body[#sp(12pt)[
        ni3 la, sitelen ale li ken ala lon kulupu lipu a, tan ni \
        #h(5mm) #box(rotate(180deg)[#quot("y")[nena]]).
        ni4 li seme. li #quot("y")[lupa], anu seme.
        ala aa.\
        #h(15mm) ni7 li #quot("y")[nena] kepeken tawa ante. ike a. \
        kin la. #h(1.1mm)
        #quot("g")[pona] sama #quot("r")[ike] sama #quot("r")[la].
        #quot("g")[telo] sama #quot("r")[kon], \
        #h(9mm) #quot("g")[mi] sama #quot("r")[sina] sama #quot("r")[ona].
        #quot("g")[tu] sama #quot("r")[sama] \
        #h(9mm)
        #quot("g")[suli] sama #quot("r")[lili] sama #quot("r")[pi].
        #quot("g")[ala] sama #quot("r")[en],
        \
        //nimi ni3 ale en nimi ante kin, o weka.
      ]]
    ]
  ]

// TODO: Update list of nimisin

#import "/meta/nimi.typ"

#let need-clarification = (
  pi: "pi(nimi)",
  wa: "wa",
  nja: "nja",
  oke: "oke1",
  kin: "kin",
  meso: "meso",
  kiki: "kiki1",
  soko: "soko",
  teje: "teje",
  tonsi: "tonsi",
  monsi: "monsi2",
  apeja: "apeja",
  epiku: "epiku",
  konwe: "konwe",
  usawi: "usawi",
  jasima: "jasima",
  lanpan: "lanpan",
  sinpin: "sinpin2",
  namako: "namako2",
  majuna: "majuna2",
  kipisi: "kipisi",
  nimisin: "nimisin",
  linluwi: "linluwi1",
  monsuta: "monsuta",
  misikeke: "misikeke",
  kokosila: "kokosila",
)

#let (gr1,gr2) = {
  let fstpagelns = 5
  
  let words = need-clarification.keys().sorted(key: s => s.len())
  let (short, mid, long) = {
    let n = words.len()
    let cut = int(calc.ceil(n / 3))
    (
      words.slice(0, cut),
      words.slice(cut, 2 * cut),
      words.slice(2 * cut),
    )
  }
  assert(short.len() + mid.len() + long.len() == words.len())
  let zipped = (short + ((),)).zip(mid + ((),), (long + ((),))).flatten()
  assert(zipped.len() == words.len())
  let fst = zipped.slice(0, fstpagelns * 3)
  let snd = zipped.slice(fstpagelns * 3)
  assert(fst.len() + snd.len() == words.len())
  (fst, snd)
}

#let obscure-1 = [
    #v(3mm)
    #sp[#heading[sitelen ni4 li seme]]
    #v(0mm)
    #show: move.with(dx: -3mm)
    #box(inset: (left: 8pt))[#sp[#body[
      #h(5mm) ken la, sina sona ala e sitelen tan ni \
      ona li lon pu ala anu mi ante lili e ona
      #h(7mm) o lukin e ona \
      ]]
      #v(-1.5mm)
      #table(columns: (1.7cm,2.1cm,2.4cm), stroke: palette.light.gray, align: center, ..{
        for n in gr1 {
          let s = need-clarification.at(n)
          ([#sp(12pt, cc("k-"))[#s] #h(1fr) #unsp(12pt, cc("k-"))[#n]],)
        }
      })
      #v(-3mm)
      #sp[#body[
        #h(30mm) nimisin ante li lon lipu poka ni2
      ]]
      #place(center + horizon, dx: 0cm, dy: 3.3cm)[#sp(33pt, palette.standard.yellow)[nja]]
      #place(center + horizon, dx: -1.6cm, dy: 2.6cm)[#sp(35pt, palette.light.blue)[nimisin]]
      #place(center + horizon, dx: 1.5cm, dy: 3.25cm)[#sp(25pt, palette.light.red)[apeja]]
    ]
  ]
  
#let obscure-2 = [
    #show: move.with(dx: -3mm)  
    #v(20mm)
    #box(inset: (left: 7pt))[
      #table(columns: (1.7cm,2.1cm,2.4cm), stroke: cc("a-"), align: center, ..{
        for n in gr2 {
          let s = need-clarification.at(n)
          ([#sp(12pt, cc("k-"))[#s] #h(1fr) #unsp(12pt, cc("k-"))[#n]],)
        }
      })
    ]
    #place(top + center, dx: 5mm, dy: 1mm)[#sp(61pt, palette.light.green)[lanpan]]
    #place(top + center, dx: 2cm, dy: 9mm)[#sp(35pt, palette.light.aqua)[kokosila]]
    #place(top + center, dx: -1cm, dy: 4mm)[#sp(25pt, palette.light.orange)[linluwi1]]
    #place(top + center, dx: -1.7cm, dy: 10mm)[#sp(39pt, palette.standard.purple)[monsuta]]
    #box(inset: (left: 7pt))[
      #sp[#body[
        #quot("r-")[sinpin] en #quot("r-")[monsi] en #quot("r-")[sewi2]
        li sama lukin tawa #quot("g")[anpa] \
        ni3 la, ona tu wan li kama #quot("b")[sinpin2] en #quot("b")[monsi2] en #quot("b")[sewi] \
        #h(3mm) #quot("r-")[pi] li sama lili lukin tawa #quot("g")[suli] \
        #h(12mm) ni3 la ona wan li kama #quot("b")[pi(nimi)]
      ]]
    ]
    #place(top + center, dx: 1.9cm, dy: 6.4cm)[#sp(32pt, palette.standard.red)[usawi]]
    
  ]

#let front-page = {
  move(dy: -5mm, dx: -11.5mm, cetz.canvas({
    import "recto.typ"
    import "/meta/nimi.typ"
    recto.card(88%,
      symbols: ("alasa", "mun", "suno", "nasa", "seme", "kijetesantakalu", "soko", "toki", "mute", "kiwen", "akesi2", "jan"),
      circles: comb.apply-shuffle(recto.layouts.at(0), (1,2,4,11,8,5,0,3,6,9,7,10)),
      colors: {
        import palette: cc
        (cc("r-"), cc("b"), cc("y-"), cc("g-"), cc("q"), cc("a"), cc("y"), cc("p"), cc("o-"), cc("r"), cc("g"), cc("q-"))
      },
      angles: (30deg,-20deg,15deg,30deg,130deg,-90deg,50deg,220deg,20deg,-110deg,20deg,-40deg),
    )
  }))
}

#let back-side = {
  move(dx: -5mm, dy: -5mm, cetz.canvas({
    import "verso.typ"
    verso.card()
  }))
}

#show: align.with(center)
  
#side(
  border: palette.light.white,
  background: palette.light.white,
  edge: (cut: false, margin: true),
  linebreaks: (),
  introduction,
  contents,
  how-to-play,
  deduplication,
)

#side(
  symmetry: true,
  border: (palette.light.gray, palette.light.white, palette.light.white, palette.light.gray),
  edge: (cut: true, margin: true),
  background: palette.light.white,
  linebreaks: (),
  
  front-page,
  obscure-2,
  obscure-1,
  back-side,
)

#set page("a4", margin: 1cm)

#[
#show: move.with(dy: -2.5cm)
#show: rotate.with(60deg, reflow: true)
#show: box.with(width: 32cm)
#side(
  border: palette.light.white,
  background: palette.light.white,
  edge: (cut: false, margin: false),
  linebreaks: (),
  
  introduction,
  contents,
  how-to-play,
  deduplication,
)
]

#pagebreak()

#[
#show: move.with(dy: -2.5cm)
#show: rotate.with(-60deg, reflow: true)
#show: box.with(width: 32cm)
#side(
  edge: (margin: false),
  border: (palette.light.gray, palette.light.white, palette.light.white, palette.light.gray),
  background: palette.light.white,
  linebreaks: (),
  
  front-page,
  obscure-2,
  obscure-1,
  back-side,
)
]