#import "/meta/palette.typ": cc
#import "/meta/pona.typ": sp, unsp

#let flag = "gb"

#let main-title = [What is this?]

#let intro = [
  You are in possession of a copy of the game
  "#sp(cc("o"))[sitelen tu sama]" (sitelen tu sama),
  developped by #sp(cc("g"))[jan [Newen]] (Newen). \
  This game is a version of #unsp(cc("r"))["Dobble"],
  made with toki pona hieroglyphs. \
  \
  As in the standard game, look for the single
  symbol that is common between any two cards
  (the color, size, and orientation may vary),
  and be the first to say its name or point at
  it to win the card. \
  \
  A list (and rough translation) of all symbols in the game
  is provided, sorted by visually recognizable features.
  Have fun!
]

#let class-title = [Classification of symbols]
#let class-intro = [
  To help you find an unknown symbol, the following
  are classified based on whether
  they have *disconnected elements*,
  *enclosed areas*, *dots*, and *curved lines*.
  There are 133 symbols in total.
]

#let plural(n) = if n == 1 { "" } else { "s" }

#let element(nb) = [element#plural(nb)]
#let dot(nb) = [dot#plural(nb)]
#let area(nb) = [enclosed area#plural(nb)]
#let curve(has) = {
  if has { [curved lines] } else { [no curves] }
}

#let copyright = [
  All material on this document and on other elements of the game
  are available at `github:vanille-n/sitelen-tu-sama`,
  and licensed under Creative Commons BY-NC-SA. \
  You may freely distribute it and modify it as long as
  copies or derived products are licensed under the same conditions,
  credit the original source ("jan Newen \<jan-Newen#"@"crans.org>"),
  and are not used for commercial purposes.
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

