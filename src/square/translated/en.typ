#import "/square/rulebook.typ"
#import rulebook: section, side

#import "/square/recto.typ"

#import "/meta/pona.typ"
#import pona: sp, unsp, quot
#import "/meta/palette.typ"
#import palette: cc

#set page(flipped: true, margin: (y: 1cm, x: 3mm))
#show: align.with(center)

#let title(c) = pona.title(text(20pt)[#c])
#let heading(c) = pona.heading(text(12pt)[#c])
#let body(c) = pona.body(text(9.5pt)[#c])
#let subheading(c) = {
  text(12pt, cc("g"))[#c]
  v(-4mm)
}

#let intro = section[
  #unsp[#title[What is this?]]
  #unsp[#body[
    #set text(size: 9.5pt)
    You are in possession of a copy of the game
    "#sp(cc("o"))[sitelen tu sama]" (sitelen tu sama),
    developped by #sp(cc("g"))[jan [Newen]] (Newen). \
    This game is a version of #unsp(cc("r"))["Dobble"],
    made with toki pona hyeroglyphs. \ \

    As in the standard game, look for the single
    symbol that is common between any two cards
    (the color, size, and orientation may vary),
    and be the first to say its name or point at
    it to win the card. \ \

    A list and explanation of all symbols in the game
    is provided, sorted by visually recognizable features. \
    Have fun!
  ]]
]

#let translated = (
  epiku: [epic, amazing],
  namako: [spice, extra, more],
  apeja: [shun, shame],
  nja: [meow],
  sona: [knowledge],
  kalama: [sound, noise],
  toki: [speak, language],
  majuna: [old, ancient],
  nimisin: [new word],
  kokosila: [not toki pona],
  usawi: [magic],
  pana: [give, send],
  weka: [leave, disappear],
  linluwi: [link, network],
  seli: [heat, fire],
  kijetesantakalu: [raccoon],
  soweli: [mammal, beast],
  sitelen: [drawing, writing],
  akesi: [reptile],
  mute: [many],
  meso: [middle],
  moli: [death],
  wawa: [strength, power],
  pipi: [bug],
  waso: [bird, fly],
  kulupu: [group],
  wekama: [come back],
  kipisi: [cut],
  sin: [new],
  pan: [bread, grain],
  suwi: [sween, cute],
  anpa: [below, inferior],
  lon: [at, on, existing],
  teje: [right],
  meli: [woman],
  uta: [mouth],
  seme: [question],
  insa: [inside],
  lukin: [look, see],
  lanpan: [steal],
  poka: [side, next to],
  mu: [animal sound],
  a: [emphasis],
  e: [object marker],
  wa: [amazement],
  sewi: [sky, god],
  tu: [two],
  o: [command],
  telo: [water, liquid],
  ante: [different, other],
  kute: [ear, listen],
  mije: [man],
  leko: [square],
  sike: [circle],
  kin: [additionally],
  tenpo: [time],
  ala: [not],
  awen: [stay, stand],
  nasin: [path, method],
  pini: [done, closed],
  selo: [skin, shell],
  suli: [large],
  taso: [only, but],
  utala: [fighting],
  monsuta: [scary],
  anu: [or],
  lete: [cold],
  ni: [this, that],
  poki: [container, box],
  sijelo: [body, content],
  supa: [table],
  tawa: [go, become],
  wan: [one],
  ken: [possibility],
  luka: [hand],
  monsi: [behind],
  noka: [foot],
  wile: [want, need],
  pona: [good, easy],
  linja: [line, string],
  lupa: [hole],
  nasa: [weird],
  tan: [from, because of],
  jasima: [copy, reflect],
  kiwen: [rock, hard],
  lipu: [document, sheet, flat],
  tomo: [house, structure],
  walo: [white],
  len: [cloth],
  open: [open, begin],
  kiki: [pointy, harsh],
  nanpa: [number],
  ijo: [thing],
  jo: [hold, have],
  kili: [fruit, vegetable],
  lape: [sleep, rest],
  mi: [me],
  mun: [moon],
  palisa: [stick],
  suno: [sun, bright],
  tonsi: [nonbinary],
  jan: [person],
  kala: [fish],
  ko: [paste, flexible],
  mani: [valuable, money],
  moku: [eat, foot],
  pali: [work, make],
  pilin: [feel],
  soko: [mushroom, mold],
  oke: [okay],
  alasa: [hunt, search],
  esun: [trade, sell, buy],
  jelo: [yellow],
  kepeken: [using],
  lawa: [head, leader],
  mama: [parent, create],
  olin: [love],
  misikeke: [medicine],
  konwe: [alive, automatic],
  ale: [everything],
  ilo: [tool],
  kasi: [plant],
  kule: [color],
  loje: [red],
  musi: [fun, entertaining],
  pakala: [broken, mistake],
  oko: [eye],
  unu: [purple],
  jaki: [disgusting],
  ma: [land, country],
  unpa: [sex],
  laso: [blue, green],
  pimeja: [black],
)

#import "/meta/nimi.typ"

#let fmtable(elts) = {
  set text(size: 8pt, cc("k"))
  table(columns: 2, stroke: cc("a-") + 0.5pt, inset: 2pt,
    ..elts.map(e => [
      #sp[#nimi.chosen-variant(e)]
      #h(2mm)
      #e
      #unsp(cc("a"), 6pt)[
        (#translated.at(e, default: text(cc("r-"))[missing]))
      ]
    ])
  )
  v(-2mm)
}

#import "/meta/classification.typ": features

#let class1 = section[
  #unsp[#heading[Classification of symbols]]
  #unsp[
    #body[
      To help you find an unknown symbol, the following
      are classified based on whether
      they have *dots*, *disconnected elements*,
      *enclosed areas*, and *curved lines*.
      There are 133 symbols in total.
    ]
    #subheading[4+ elements, 0 dots]
    #fmtable(features.con4)
  ]
]
#let class2 = section[
  #unsp[
    #subheading[4+ elements, 1+ dots]
    #fmtable(features.con4dot)
    #subheading[3 elements]
    #fmtable(features.con3)
  ]
]
#let class3 = section[
  #unsp[
    #subheading[2 elements, 1 dot]
    #fmtable(features.con2dot)
    #subheading[2 elements, 0 dots]
    #fmtable(features.con2)
  ]
]
#let class4 = section[
  #unsp[
    #v(-1mm)
    #subheading[1 element, no enclosed areas, no curves]
    #fmtable(features.zone0straight)
    #v(-2mm)
    #subheading[1 element, no enclosed areas, curved lines]
    #fmtable(features.zone0curve)
  ]
]
#let class5 = section[
  #unsp[
    #subheading[1 element, 1 enclosed area, no curves]
    #fmtable(features.zone1straight)
    #subheading[1 element, 1 enclosed area, curved lines]
    #fmtable(features.zone1curve)
  ]
]
#let class6 = section[
  #unsp[
    #subheading[1 element, 2 enclosed areas]
    #fmtable(features.zone2)
    #subheading[1 element, 3+ enclosed areas]
    #fmtable(features.zone3)
  ]
]

#side(
  border: cc("w-"),
  edge: (margin: false),

  intro,
  class1,
  class2,
  class3,
)
#side(
  border: (cc("w-"), cc("w-"), cc("w-"), cc("a-")),
  edge: (margin: false, cut: false),

  class4,
  class5,
  class6,
  {
    rulebook.front-page(recto.rendered.at(0))
    import "@preview/flagada:1.0.1"
    place(top + right, dy: -2mm, dx: 2mm, {
      box(fill: cc("a-"), inset: 3mm, {
        flagada.flag("gb", height: 1cm)
      })
    })
  },
)
