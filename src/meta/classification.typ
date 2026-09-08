#import "nimi.typ"
#import "pona.typ": sp

#let features = (
  con2: "a ante e kute wa mije meli leko sewi sike tu kin o tenpo telo",
  con2dot: "anpa insa lon lukin teje lanpan uta poka seme mu",
  con3: "akesi kulupu mute wekama meso kipisi moli sin wawa pan pipi suwi waso",
  con4: "epiku majuna namako nimisin apeja kokosila nja usawi sona pana kalama weka toki",
  con4dot: "linluwi soweli seli sitelen kijetesantakalu",

  zone0straight: "ala anu awen lete nasin ni pini poki selo sijelo suli supa taso tawa utala wan monsuta",
  zone0curve: "ken linja luka lupa monsi nasa noka tan wile jasima pona",
  zone1straight: "kiwen len lipu open tomo kiki walo nanpa",
  zone1curve: "ijo jan jo kala kili ko lape mani mi moku mun pali palisa pilin suno soko tonsi oke",
  zone2: "alasa ale esun ilo jelo kasi kepeken kule lawa loje mama musi olin pakala misikeke oko konwe unu",
  zone3: "jaki laso ma pimeja unpa",
).map(s => s.split(" "))

#{
  for (word,info) in nimi.nimi {
    if "weka" in info { continue }
    let exists = false
    for (_,words) in features {
      if word in words {
        exists = true
      }
    }
    if not exists {
      box(stroke: black, inset: 5pt)[#text(red)[#sp[#nimi.chosen-variant(word)] (#word)]]
    }
  }

  for (feat, words) in features {
    [= #feat]
    [(#words.len()) ]
    words.map(w => sp[#nimi.chosen-variant(w)]).join[, ]
  }
}
