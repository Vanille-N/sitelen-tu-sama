#import "@preview/cetz:0.5.2"

#import "specs.typ"
#import "/meta/palette.typ"
#import palette: cc

#import "/meta/comb.typ"
#import "/meta/help.typ"


#let orelse(v, truth: v => v != none, backup) = {
  if truth(v) { v } else { backup }
}

#set par(leading: 1pt)

#import "/meta/pona.typ": sp, unsp, quot, heading, title

#let body(c) = {
  show: par.with(leading: 5pt)
  set text(12pt, palette.dark.gray)
  c
}

#set page(flipped: true, margin: (y: 1cm, x: 3mm))

#let decrease = 8.5mm
#let true-free-space = specs.side - 2 * specs.inner-padding - decrease
#let side(border: white, edge: (:), linebreaks: (), ..pages) = {
  let len = pages.len()
  for (idx, pg) in pages.pos().enumerate() {
    let border = if type(border) == color { border } else { border.at(idx) }
    let canvas = cetz.canvas({
      import cetz.draw: *
      specs.card-template(color: border, edge: edge, __unsafe-decrease-size: decrease, drop-margins: {
        if idx == 0 { () } else { ("left",) }
        if idx == pages.pos().len() - 1 { () } else { ("right",) }
      })
      let contents = box(stroke: none, width: true-free-space, height: true-free-space)[#pg]
      let overlay = tiling(size: (true-free-space, true-free-space))[#contents]
      rect((-true-free-space/2,-true-free-space/2), (true-free-space/2,true-free-space/2), radius: 2mm, fill: overlay, stroke: none)
    })
    box(canvas)
  }
}

#let minicard(center, rescale: 100%, name: "", symbs: ()) = {
  import cetz.draw: *
  let side = 15mm * rescale
  let upper-left = (to:center, rel:(-side/2,-side/2))
  let lower-right = (to:center, rel:(side/2,side/2))
  rect(name: name, upper-left, lower-right, stroke: cc("a") + 0.5pt, fill: palette.standard.white, radius: 1mm)
  for (idx, symb) in symbs.enumerate() {
    content((to: center, rel: (angle: 360deg/4 * idx + 45deg, radius: 4.5mm * rescale)), name: name + "_" + str(idx))[#sp(red, 20pt * rescale, symb)]
  }
}
#let section(c) = box(inset: 2pt, width: true-free-space, height: true-free-space, c)

#let introduction = section[
    #sp[#title[sitelen tu sama]]
    #sp[#body[
        toki a. mi2 jan #sp(cc("g"))[[namako en weka en namako]],
          anu jan #sp(cc("g"))[[Newen]] \
        mi2 pali e musi ni.
          mi2 wile e ni2.,
          sina2 musi pona kepeken musi mi2. \
        ona2 li jo e lipu leko mute. lipu ale li ante, li jo e sitelen ante \
        taso lipu tu ale la, sitelen tu taso li sama a, o alasa e ona2, o toki e ona2
      ]]
      #v(-2mm)
      #align(center)[#cetz.canvas({
        import cetz.draw: *
        minicard((0,0), name: "a", symbs: (
          text(palette.standard.red)[kijetesantakalu], text(palette.standard.blue)[musi],
          text(palette.standard.orange)[tu],
          text(palette.standard.green)[lape],
        ))
        minicard((4,0), name: "b", symbs: (
          text(palette.standard.yellow)[kiwen],
          text(palette.standard.aqua)[kijetesantakalu],
          text(palette.standard.red)[lon],
          text(palette.standard.purple)[waso],
        ))
        minicard((2,-1), name: "c", symbs: (
          text(palette.standard.blue)[waso],
          text(palette.standard.yellow)[loje],
          text(palette.standard.aqua)[lape],
          text(palette.standard.orange)[suno],
        ))
        bezier((to:"a_0",rel:(0.15,0.27)), (to:"b_1",rel:(-0.15,0.1)), (2,1), mark: (start: ">", end: ">", scale: 0.4), stroke: palette.dark.gray)
        bezier((to:"a_3",rel:(0.1,-0.17)), (to:"c_2",rel:(-0.2,0.05)), (0.6,-1.5), mark: (start: ">", end: ">", scale: 0.4), stroke: palette.dark.gray)
        bezier((to:"b_3",rel:(-0.15,-0.3)), (to:"c_0",rel:(0.25,-0.1)), (3.5,-1.2), mark: (start: ">", end: ">", scale: 0.4), stroke: palette.dark.gray)
      })]
    ]
  
#let contents = section[
      #sp[#heading[mute lipu li tan seme]]
      #sp[#body[
      lipu pi(ale mute2 luka luka tu wan) li lon. #unsp[(133)] \
      ale la, sitelen pi(ale mute2 luka luka tu wan) li lon. #unsp[(133)] \
      lipu ale la, sitelen pi(luka luka tu) li lon. #unsp[(12)] \
      sitelen ale li lon lipu pi(luka luka tu). #unsp[(12)] \
      \
      . mute ni3 li sama tan nasin pona. \
      #h(5mm) kepeken sona nanpa la, jan li ken sona pona e ni8 \
      #h(10mm) sitelen ale tu la, sitelen tu li sama. \
      #h(10mm) sitelen ale tu la, sitelen tu taso li sama
    ]]
    #place(center + horizon, dx: 2cm, dy: 2.2cm)[#sp(55pt, palette.standard.purple)[musi]]
    #place(right + horizon, dy: -2mm)[#sp(70pt, cc("y-"))[nanpa]]
    #place(bottom + left)[#sp(40pt, cc("b-"))[nasin]]
  ]
  
#let how-to-play = section[
      #sp[#heading[nasin musi li seme]]
      #sp[#body[
        jan ale pi(wile musi), o lon poka #sp(cc("k+"))[supa], o kama jo e lipu wan taso \
        lipu ale ante li #sp(cc("g"))[kulupu lon meso] #sp(cc("k+"))[supa]. musi li open a \
        o alasa e sitelen sama lon #sp(cc("b"))[lipu pi(sewi2 kulupu sina2)]
          en #sp(cc("g"))[lipu pi(sewi2 kulupu meso)]. \
        sina2 sona la, o toki wawa e #sp(cc("y"))[nimi ona2]. sina2 wile toki nanpa wan. \
        lipu li tawa sewi2 #sp(cc("b"))[pi(kulupu pi(jan nanpa wan))],
        #sp(cc("g"))[lipu pi(sewi2 kulupu meso)] li kama ante \
        o alasa kin. #sp(cc("g"))[kulupu lipu meso] li pini la, o nanpa e lipu lon #sp(cc("b"))[kulupu sina2]. \
        jan wan li jo e lipu mute namako tawa jan ale la, ona2 li wawa nanpa wan
      ]]
      #place(right + horizon, dy: -14mm)[#sp(cc("o-"), 45pt)[alasa]]
      #v(-6mm)
      #align(center)[#box(stroke: none)[#cetz.canvas({
        import cetz.draw: *
        rect((-2,1.7), (3.2,-0.7), stroke: none)
        content((0,0.15))[#std.scale(y: 70%, sp(100pt, cc("k-"))[supa])]
        content((2,0.85))[#sp(50pt, cc("b+"))[jan]]
        content((2,0.9))[#sp(15pt, cc("b+"))[sina2]]
        content((-2,0.85))[#sp(50pt, cc("r+"))[jan]]
        content((-2,0.9))[#sp(15pt, cc("r+"))[ante]]


        minicard((-0.15,0.75), rescale: 40%)
        minicard((-0.07,0.85), rescale: 40%)
        minicard((-0.1,0.95), rescale: 40%)
        minicard((-0.05,1.05), rescale: 40%)
        minicard((-0.1,1.15), rescale: 40%, symbs: (
          text(palette.standard.green)[sama],
          text(palette.standard.orange)[mute],
          text(palette.standard.yellow)[lon],
          text(palette.standard.purple)[kijetesantakalu],
        ))
        content((-0.1,0.15))[#sp(cc("g"))[kulupu meso]]

        minicard((-0.95,0.75), rescale: 40%)
        minicard((-0.9,0.85), rescale: 40%, symbs: (
          text(palette.standard.blue)[seme],
          text(palette.standard.orange)[lon],
          text(palette.standard.aqua)[ante],
          text(palette.standard.purple)[mi2],
        ))
        content((-1.15,0.15))[#sp(cc("r+"))[kulupu ante]]

        minicard((0.85,0.75), rescale: 40%)
        minicard((0.8,0.85), rescale: 40%)
        minicard((0.82,0.95), rescale: 40%, symbs: (
          text(palette.standard.yellow)[kijetesantakalu],
          text(palette.standard.green)[mi2],
          text(palette.standard.purple)[ale],
          text(palette.standard.red)[meli]
        ))
        content((1,0.15))[#sp(cc("b+"))[kulupu sina2]]

        content((3,1))[#sp(35pt, palette.dark.gray)[toki]]
        content((3,0.91))[#sp(13pt, palette.standard.yellow)[kijetesantakalu]]
        bezier((2.46,0.75), (2.8,0.7), (2.6,0.6), stroke: palette.standard.gray)
        bezier((0.1,1.42), (0.8,1.25), (0.6,1.6), mark: (end: ">", scale: 0.4), stroke: palette.standard.gray)
      })]]
  ]

#let deduplication = section[
    #sp[#heading[sitelen ante li lon ala tan seme #h(7mm)]]
    #sp[#body[
      . suli sitelen li ken ante \
      . kule sitelen li ken ante \
      . tawa sitelen li ken ante \
    ]]
    #place(top + right, dx: -1mm, dy: 5.5mm)[
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
      #v(-1mm)
      #sp[#body[
        ni3 la, sitelen ale li ken ala lon kulupu lipu a, tan ni \
        . #box(rotate(180deg)[#quot("y")[nena]]).
        ni4 li seme. li #quot("y")[lupa], anu seme.
        ala a.\
        ..,;ni7 li #quot("y")[nena] kepeken tawa ante. ike a. \
        kin la
        , #quot("g")[pona] sama #quot("r")[ike] sama #quot("r")[la]
        ,.#quot("g")[telo] sama #quot("r")[kon] \
        ., #quot("g")[mi2] sama #quot("r")[sina2] sama #quot("r")[ona2]
        ., #quot("g")[tu] sama #quot("r")[sama] \
        ., #quot("g")[suli] sama #quot("r")[lili] sama #quot("r")[pi]
        .,#quot("g")[ala] sama #quot("r")[en] \
        . kulupu ni3 pi(sama lukin) la, nimi wan taso li awen, nimi ante li o weka
      ]]
    ]

#import "/meta/nimi.typ"

#let need-clarification = nimi.nimi.pairs().filter(((k,v),) => "nasa" in v and "weka" not in v).map(((k,v),) => k)

#let obscure-sorted() = {
  let words = need-clarification.sorted(key: s => measure(unsp[#s]).width)
  let (short, mid, long) = {
    let n = words.len()
    let cut1 = int(calc.ceil(n / 3))
    let cut2 = int(calc.ceil((n - cut1) / 2))
    (
      words.slice(0, cut1),
      words.slice(cut1, cut1 + cut2),
      words.slice(cut1 + cut2),
    )
  }
  assert(short.len() + mid.len() + long.len() == words.len())
  let zipped = (short + ((),)).zip(mid + ((),), long + ((),)).flatten()
  assert(zipped.len() == words.len())
  zipped
}

#let obscure-1 = section[
    #sp[#heading[sitelen ni4 li seme]]
    #sp[#body[
      ken la, sina2 sona ala e sitelen tan ni \
      nanpa wan la, mi2 ante lili e sitelen. tan ni2, sitelen wan li lukin sama sitelen ante \
      , sama ni2,
        #quot("r-")[monsi] en #quot("r-")[sewi2] 
         ,li lukin sama #quot("g")[anpa] \
      ,;li kama, #quot("b")[monsi2] en #quot("b")[sewi] \
      nanpa tu la, sitelen li lon pu ala. tan ni \
      . sitelen pi(sama lukin) li weka la, mi2 jo ala e sitelen pi(nanpa wile) \
      . mi2 alasa e sitelen pi(sona mute) lon pu ala, sama #quot("b")[monsuta] en #quot("b")[namako2] \
      . mi2 wile e sitelen kin la, mi2 kepeken e sitelen pi(pona lukin),;
        sama #quot("b")[nja] \
      .., sina2 sona ala e nimi sitelen la, o kama sona e ona2 lon lipu poka ni2 \
      .., anu la, sina2 ken toki ala e nimi, luka taso e sitelen
    ]]
    #place(center + horizon, dx: 27mm, dy: -2mm)[#sp(cc("r-"), 49pt)[sona+ala]]
    #place(bottom + left)[#sp(cc("g-"), 35pt)[seme]]
]

#let obscure-2 = context {
  section[
    #sp[#heading[sitelen pi(sona lili)]]
    #box[
      #table(columns: (1.7cm,2.1cm,2.4cm), inset: (y: 3.4pt), stroke: cc("a-"), align: center, ..{
        for n in obscure-sorted() {
          let s = nimi.chosen-variant(n)
          ([#sp(12pt, cc("k-"))[#s] #h(1fr) #unsp(11pt, cc("k-"))[#n]],)
        }
      })
    ]
  ]
}

#let front-page(card) = {
  move(dy: -2mm, dx: -2mm, scale(87%, reflow: true, {
    card
  }))
}

#let back-side(num) = {
  move(dx: -10mm, dy: -10mm, cetz.canvas({
    import "verso.typ"
    verso.card(padding: 2.5mm, hidden-text: help.pad3dig(num))
  }))
}

#show: align.with(center)

#import "/meta/sampler.typ"

#let recto() = {
  side(
    border: palette.light.white,
    edge: (cut: false, margin: false),

    introduction,
    contents,
    how-to-play,
    deduplication,
  )
}

#let verso(num) = {
  import "recto.typ"
  side(
    border: (palette.light.gray, palette.light.white, palette.light.white, palette.light.gray),
    edge: (cut: true, margin: false),

    back-side(num),
    obscure-1,
    obscure-2,
    front-page(recto.render(edge: (cut: false), recto.ready.at(num))),
  )
}

// Already used: 14, 18
#recto()
#recto()
#verso(0)
#verso(1)
