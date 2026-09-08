#let x-sama = (weka: (color: red, order: 3), status: "ala")
#let x-rare = (weka: (color: gray, order: 2), status: "ala")
#let x-kalama = (weka: (color: yellow, order: 4), status: "ala")
#let x-jaki = (weka: (color: purple, order: 5), status: "ala")
#let x-pilin = (weka: (color: blue, order: 1), status: "ala")
#let w-sin = (lukin: (color: rgb("00dddddd")))

#let nimi = (
  "a": (:),
  "akesi2": (alts: ("akesi",)),
  "ala": (sama: ("en",)),
  "alasa": (:),
  "ale": (:),
  "anpa": (sama: ("monsi", "sinpin", "sewi2")),
  "ante": (:),
  "anu": (:),
  "awen": (:),
  "e": (:),
  "en": (sama: ("ala",), ..x-sama),
  "esun": (:),
  "ijo": (:),
  "ike": (sama: ("pona", "la"), ..x-sama),
  "ilo": (:),
  "insa": (:),
  "jaki": (:),
  "jan": (sama: ("mani", "mije")),
  "jelo": (:),
  "jo": (:),
  "kala": (alts: ("kala2",)),
  "kalama": (:),
  "kama": (sama: ("tawa",), ..x-sama),
  "kasi": (:),
  "ken": (:),
  "kepeken": (:),
  "kili": (:),
  "kiwen": (sama: ("tomo",)),
  "ko": (:),
  "kon": (sama: ("telo",), ..x-sama),
  "kule": (:),
  "kulupu": (:),
  "kute": (:),
  "la": (sama: ("pona", "ike"), ..x-sama),
  "lape": (sama: ("soko2",)),
  "laso": (:),
  "lawa": (:),
  "len": (:),
  "lete": (:),
  "li": (sama: ("suli", "pi", "lili"), ..x-sama),
  "lili": (sama: ("suli", "pi", "li"), ..x-sama),
  "linja": (:),
  "lipu": (sama: ("nimi",)),
  "loje": (:),
  "lon": (sama: ("powe",)),
  "luka": (:),
  "lukin": (:),
  "lupa": (sama: ("nena",)),
  "ma": (:),
  "mama": (:),
  "mani": (sama: ("jan", "mije")),
  "mi2": (alts: ("mi",), sama: ("ona2", "sina2")),
  "moku": (:),
  "moli": (alts: ("moli2",)),
  "monsi2": (alts: ("monsi",), sama: ("anpa", "sewi2", "sinpin")),
  "mu": (:),
  "mun": (:),
  "musi": (:),
  "mute": (alts: ("mute2",)),
  "nanpa": (:),
  "nasa": (:),
  "nasin": (:),
  "nena": (sama: ("lupa",), ..x-sama),
  "ni": (:),
  "nimi": (sama: ("palisa", "lipu"), ..x-sama),
  "noka": (:),
  "o": (:),
  "olin1": (alts: ("olin2", "olin")),
  "ona2": (sama: ("mi2", "sina2"), alts: ("ona",), ..x-sama),
  "open": (:),
  "pakala": (:),
  "pali": (:),
  "palisa": (sama: ("nimi",)),
  "pan": (:),
  "pana": (:),
  "pi(nimi)": (alts: ("pi",), sama: ("suli", "lili", "li"), ..x-pilin),
  "pilin": (sama: ("wile2",)),
  "pimeja": (:),
  "pini": (:),
  "pipi": (:),
  "poka": (:),
  "poki": (:),
  "pona": (sama: ("ike", "la")),
  "pu": (: ..x-jaki),
  "sama": (sama: ("tu",), ..x-sama),
  "seli": (:),
  "selo": (:),
  "seme": (:),
  "sewi": (alts: ("sewi2",), sama: ("anpa", "sinpin", "monsi")),
  "sijelo": (:),
  "sike": (:),
  "sin": (:),
  "sina2": (sama: ("mi2", "ona2"), alts: ("sina",), ..x-sama),
  "sinpin2": (alts: ("sinpin",), sama: ("anpa", "monsi", "sewi2"), ..x-pilin),
  "sitelen": (:),
  "sona": (:),
  "soweli": (:),
  "suli": (sama: ("li", "lili", "pi")),
  "suno": (:),
  "supa": (:),
  "suwi": (:),
  "tan": (:),
  "taso": (sama: ("pake",)),
  "tawa": (sama: ("kama",)),
  "telo": (sama: ("kon",)),
  "tenpo": (:),
  "toki": (:),
  "tomo2": (alts: ("tomo",), sama: ("kiwen",)),
  "tu": (sama: ("sama",)),
  "unpa": (:),
  "uta": (alts: ("uta2",)),
  "utala": (:),
  "walo": (:),
  "wan": (:),
  "waso": (:),
  "wawa": (:),
  "weka": (sama: ("namako",)),
  "wile": (alts: ("wile2",), sama: ("pilin",)),
  "kijetesantakalu": (:),
  "kin": (:),
  "kipisi": (alts: ("kipisi2",)),
  "ku": (: ..x-jaki),
  "leko": (:),
  "meli": (alts: ("meli2", "meli3"), sama: ("soko",)),
  "mije": (alts: ("mije2", "mije3"), sama: ("jan", "mani")),
  "misikeke": (:),
  "monsuta": (:),
  "n": (: ..x-kalama),
  "namako2": (alts: ("namako",), sama: ("weka",)),
  "soko": (alts: ("soko1", "soko2"), sama: ("lape", "meli2")),
  "tonsi": (:),
  "epiku": (alts: ("epiku1",), sama: ("ni",)),
  "jasima": (:),
  "lanpan": (alts: ("lanpan2",)),
  "linluwi1": (alts: ("linluwi2", "linluwi4"), sama: ("len", "kulupu"), ..w-sin),
  "majuna2": (alts: ("majuna",), sama: ("sin",)),
  "meso": (:),
  "nimisin": (:),
  "oko": (:),
  "su": (: ..x-jaki),
  "apeja": (:),
  "isipin": (sama: ("kokosila",), ..x-sama),
  "jami": (: ..x-pilin),
  "kamalawala": (: ..x-rare),
  "kapesi": (: ..w-sin, ..x-pilin),
  "kiki1": (alts: ("kiki2",), ..w-sin),
  "kokosila": (sama: ("isipin",), ..w-sin),
  "konwe": (: ..w-sin),
  "kulijo": (: ..x-pilin),
  "melome": (: ..x-jaki),
  "mijomi": (: ..x-jaki),
  "misa": (alts: ("misa2", "misa3", "misa4"), ..w-sin, ..x-pilin),
  "nja": (: ..w-sin),
  "ojuta": (: ..x-rare),
  "oke1": (: ..w-sin),
  "omekapo": (: ..x-pilin),
  "owe": (: ..x-rare),
  "pake": (sama: ("taso",), ..x-sama),
  "penpo": (: ..x-rare),
  "pika": (: ..w-sin, ..x-pilin),
  "po": (: ..x-pilin),
  "powe": (: ..x-pilin, sama: ("lon",)),
  "puwa": (: ..x-rare),
  "san1": (alts: ("san2", "san3"), sama: ("mute",), ..x-pilin),
  "soto": (sama: ("teje",), ..x-sama),
  "sutopatikuna": (: ..x-rare),
  "taki1": (alts: ("taki2",), ..w-sin, ..x-pilin),
  "teje": (sama: ("soto",), ..w-sin),
  "unu": (: ..w-sin),
  "usawi": (: ..w-sin),
  "wa": (: ..w-sin),
  "wasoweli": (: ..x-rare),
  "wekama": (: ..w-sin),
  "wuwojiti": (: ..x-kalama),
  "yupekosi": (: ..x-pilin),
)

#let visuals = (
  "a": (scale: 11%, dy: -4%),
  "akesi2": (scale: 14%, dx: -1%, dy: -2%, freq: 99%),
  "ala": (scale: 12%, dy: -2%),
  "alasa": (scale: 10%, dy: -4%, freq: 99%),
  "ale": (scale: 22%, dy: -5%, freq: 94%),
  "anpa": (scale: 25%, dy: 11%, freq: 99%),
  "ante": (scale: -15%, freq: 100%),
  "anu": (scale: 9%, dy: 5%, freq: 99%),
  "awen": (scale: -2%, dy: -13%, freq: 100%),
  "e": (scale: 7%, dx: 6%, dy: -2%, freq: 100%),
  "en": (freq: 99%),
  "esun": (scale: 8%, dx: -2%, dy: -3%, freq: 99%),
  "ijo": (scale: 17%, dy: -2%, dx: 1%, freq: 100%),
  "ike": (freq: 100%),
  "ilo": (scale: 2%, dy: 10%, dx: 1%, freq: 100%),
  "insa": (dy: 5%, scale: 9%, freq: 100%),
  "jaki": (dx: -4%, dy: -7%, freq: 99%),
  "jan": (scale: 7%, dy: -10%, freq: 100%),
  "jelo": (scale: 2%, dx: 2%, dy: -5%, freq: 99%),
  "jo": (scale: 21%, dy: 1%, dx: -1%, freq: 99%),
  "kala": (scale: 11%, dx: 3%, dy: -4%, freq: 99%),
  "kalama": (scale: 15%, dy: 3%, freq: 100%),
  "kama": (freq: 100%),
  "kasi": (dy: 9%, freq: 100%),
  "ken": (scale: 5%, dy: -2%, freq: 100%),
  "kepeken": (scale: -9%, freq: 99%, dy: 3%),
  "kili": (scale: 19%, dy: -5%, freq: 99%),
  "kiwen": (scale: 9%, freq: 99%),
  "ko": (scale: 5%, dy: -4%, freq: 99%),
  "kon": (freq: 99%),
  "kule": (scale: 2%, dy: -11%, freq: 99%),
  "kulupu": (scale: 9%, dy: -6%, freq: 100%),
  "kute": (scale: 17%, dx: 3%, dy: -3%, freq: 99%),
  "la": (:),
  "lape": (scale: 32%),
  "laso": (scale: -5%, dy: 4%),
  "lawa": (scale: 15%, dx: -2%, dy: -2%),
  "len": (scale: -5%, dx: -1%),
  "lete": (scale: 17%),
  "li": (:),
  "lili": (scale: 200%),
  "linja": (scale: 13%),
  "lipu": (scale: -1%),
  "loje": (scale: 9%, dy: -1%),
  "lon": (scale: 37%, dy: -10%),
  "luka": (scale: 2%, dx: -4%, dy: -8%),
  "lukin": (scale: 11%),
  "lupa": (scale: 17%, dy: 5%),
  "ma": (scale: 39%, dy: -3%),
  "mama": (scale: 28%, dy: 2%),
  "mani": (scale: 5%, dy: 8%, dx: -3%),
  "mi2": (scale: 19%, dy: 2%),
  "moku": (scale: 2%, dy: -4%, dx: -1%),
  "moli": (scale: 16%, dy: -3%),
  "monsi": (:),
  "monsi2": (scale: 10%, dx: -7%, dy: -1%),
  "mu": (dy: 4%),
  "mun": (scale: 22%, dx: 4%),
  "musi": (scale: 14%, dy: 1%),
  "mute": (scale: 9%, dy: -2%),
  "nanpa": (scale: -1%, dy: -2%),
  "nasa": (scale: 13%, dy: 2%, dx: -2%),
  "nasin": (scale: 32%),
  "nena": (:),
  "ni": (scale: 30%),
  "nimi": (:),
  "noka": (scale: -1%, dx: 2%),
  "o": (scale: 15%, dy: -3%),
  "olin1": (scale: 7%, dy: 4%, dx: -1%),
  "ona2": (:),
  "open": (scale: -2%),
  "pakala": (scale: -2%, dx: -1%),
  "pali": (scale: 10%, dx: -5%, dy: -1%),
  "palisa": (scale: 15%, dy: 1%),
  "pan": (scale: 11%, dy: 5%, dx: -1%),
  "pana": (scale: 2%),
  "pi(nimi)": (scale: -41%, dx: -5%),
  "pilin": (scale: 5%, dy: 8%),
  "pimeja": (scale: -3%, dy: -12%),
  "pini": (dy: -1%),
  "pipi": (scale: 11%, dy: 1%),
  "poka": (scale: 9%),
  "poki": (scale: -2%, dy: -1%),
  "pona": (scale: 40%),
  "pu": (: ..x-jaki),
  "sama": (:),
  "seli": (scale: 12%, dy: -1%),
  "selo": (scale: 12%, dx: -1%, dy: -2%),
  "seme": (scale: 8%, dy: 1%),
  "sewi": (scale: -10%, dy: -2%, dx: -2%),
  "sijelo": (:),
  "sike": (scale: 16%),
  "sin": (scale: 15%, dy: -9%),
  "sina2": (:),
  "sinpin": (:),
  "sinpin2": (scale: 22%, dx: 5%, dy: 3%),
  "sitelen": (scale: 2%),
  "sona": (scale: -2%, dx: -1%),
  "soweli": (scale: -14%, dx: 9%, dy: -3%),
  "suli": (scale: -2%, dy: 8%),
  "suno": (scale: 1%),
  "supa": (scale: 18%, dy: 5%),
  "suwi": (dy: 4%),
  "tan": (scale: 19%),
  "taso": (scale: 27%, dx: -10%, dy: 1%),
  "tawa": (dy: -11%, dx: -2%, scale: -7%),
  "telo": (scale: 24%, dx: 1%, dy: -2%),
  "tenpo": (scale: 20%),
  "toki": (scale: 17%, dy: 5%),
  "tomo2": (scale: 1%, dy: -7%),
  "tu": (scale: 19%, dx: -1%, dy: -1%),
  "unpa": (scale: 16%, dy: 5%),
  "uta": (scale: 25%, dy: 4%),
  "utala": (scale: 12%),
  "walo": (dy: -8%),
  "wan": (scale: 24%, dy: -1%, dx: -2%),
  "waso": (scale: 11%, dy: -3%, dx: 3%),
  "wawa": (scale: -8%, dy: 10%),
  "weka": (scale: -8%),
  "wile": (:),
  "kijetesantakalu": (scale: -12%, dx: 2%, dy: -7%),
  "kin": (scale: 12%, dy: -4%),
  "kipisi": (scale: 20%, dy: -3%),
  "ku": (:),
  "leko": (scale: -2%),
  "meli": (scale: -15%, dy: -8%),
  "mije": (scale: -1%, dy: -7%, dx: 3%),
  "misikeke": (scale: 27%, dy: -1%),
  "monsuta": (scale: 10%),
  "n": (:),
  "namako2": (scale: 5%),
  "soko": (scale: 14%, dy: 2%),
  "tonsi": (dy: 2%),
  "epiku": (scale: 19%, dx: -3%),
  "jasima": (scale: 19%),
  "lanpan": (scale: 7%, dy: -8%, dx: -2%),
  "linluwi1": (scale: -5%),
  "majuna2": (scale: 10%, dy: -7%),
  "meso": (scale: 6%, dx: -1%),
  "nimisin": (scale: -11%, dy: -6%),
  "oko": (scale: 9%, dx: -6%),
  "su": (:),
  "apeja": (dy: 4%),
  "isipin": (:),
  "jami": (scale: 15%, dy: 2%),
  "kamalawala": (:),
  "kapesi": (scale: 5%, dy: -4%),
  "kiki1": (dy: -4%),
  "kokosila": (scale: 2%, dy: 2%),
  "konwe": (dy: -7%),
  "kulijo": (:),
  "melome": (:),
  "mijomi": (:),
  "misa": (scale: -9%, dx: -1%),
  "nja": (scale: -14%, dy: 8%),
  "ojuta": (:),
  "oke1": (scale: 19%, dx: -2%, dy: 2%),
  "omekapo": (:),
  "owe": (:),
  "pake": (:),
  "penpo": (scale: 6%),
  "pika": (scale: 25%, dy: -1%),
  "po": (:),
  "powe": (:),
  "puwa": (:),
  "san1": (dx: 1%),
  "soto": (:),
  "sutopatikuna": (:),
  "taki1": (scale: 13%, dx: -1%, dy: -1%),
  "teje": (scale: 19%, dx: 6%, dy: -1%),
  "unu": (scale: 0%, dy: -4%, dx: -2%),
  "usawi": (scale: -4%, dy: 6%),
  "wa": (scale: 9%, dy: -2%),
  "wasoweli": (:),
  "wekama": (:),
  "wuwojiti": (:),
  "yupekosi": (:),
)

#import "@preview/cetz:0.5.2"

#import "pona.typ": sp

#set page(height: 50cm, width: 50cm)

#let place-symbol(chr, sz, center: (0,0), color: black, angle: 0deg) = {
  import cetz.draw
  let info = nimi.at(chr, default: (:))
  let adjust = visuals.at(chr, default: (:))

  let mul = if "scale" in adjust { 100% + adjust.scale } else { 100% }
  let dx = if "dx" in adjust { adjust.dx * sz } else { 0pt }
  let dy = if "dy" in adjust { adjust.dy * sz } else { 0pt} 
  draw.content(center, angle: angle, std.scale(mul, move(dx: dx, dy: dy, sp(size: sz, fill: color)[#chr])))
}

#let draw-block(chr, num) = {
  let info = nimi.at(chr)
  let adjust = visuals.at(chr)
  cetz.canvas({
    import cetz.draw: *
    let sz = 30pt

    if "weka" not in info {
      let color = if "lukin" in info {
        info.lukin.color
      } else {
        green
      }
      content((1.9,1.9), anchor: "north-east", text(color, 20pt)[#num])
      rect((-2,-2), (2,2), stroke: color + 2pt)
    } else {
      rect((-2,-2), (2,2), stroke: info.weka.color + 2pt)
      line((-2,-2), (2,2), stroke: info.weka.color + 2pt)
      line((2,-2), (-2,2), stroke: info.weka.color + 2pt)
    }
    
    circle((0,0), stroke: red, radius: sz, fill: white)
    circle((0,0), stroke: blue, radius: sz - 2pt, fill: white)

    place-symbol(chr, 64pt)

    for (i, other) in info.at("sama", default: ()).enumerate() {
      let w = 8mm
      let color = if other not in nimi {
        green
      } else if "weka" in nimi.at(other) {
        green
      } else {
        red
      }
      rect((-2cm + i * (w + 1mm) + 1mm, -2cm + 1mm), (-2cm + (i + 1) * (w + 1mm), -2cm + 1mm + w), stroke: color, fill: white)
      let c = (-2cm + (i + 0.5) * (w + 1mm) + 0.5mm, -2cm + 1mm + w/2)
      place-symbol(other, 25pt, center: c)
    }

    for (i, alt) in info.at("alts", default: ()).enumerate() {
      let w = 8mm
      rect((-2cm + i * (w + 1mm) + 1mm, 2cm - 1mm), (-2cm + (i + 1) * (w + 1mm), 2cm - 1mm - w), fill: white)
      let c = (-2cm + (i + 0.5) * (w + 1mm) + 0.5mm, 2cm - 1mm - w/2)
      place-symbol(alt, 25pt, center: c)
    }
  })
}

#text(50pt)[*seme li lon lipu*]

#box(scale(160%, reflow: true)[#draw-block("sewi", [1])], baseline: 80%)
#box[
  #set text(30pt)
  *nimi o lon* \
  *sewi soto:* sitelen ante pi nimi sama. \
  *anpa soto:* nimi ante li ken sama lukin. \
  *sewi teje:* nanpa. mi wile jo e nimi 133.
]

#box(draw-block("kiki1", [1]), baseline: 80%)
#box[
  #set text(20pt)
  *nimi o lon*, taso ken la, jan li sona ala e nimi. \
  sina ken toki e ni tawa mi: "mi wile weka e nimi ni, li wile namako e nimi ante ni"
]

#box(draw-block("san1", [1]), baseline: 80%)
#box[
  #set text(20pt)
  *nimi o weka* tan ni: \
  nimi li pona, taso nimi ante li pona namako.
  nimi 133 taso li ken lon.
]

#box(draw-block("lili", [1]), baseline: 80%)
#box[
  #set text(20pt)
  *nimi o weka* tan ni: \
  nimi li *sama lukin* tawa nimi ante.
]

#box(draw-block("sutopatikuna", [1]), baseline: 80%)
#box[
  #set text(20pt)
  *nimi o weka* tan ni: \
  mi *sona ala* e nimi anu sitelen.
]

#box(draw-block("wuwojiti", [1]), baseline: 80%)
#box[
  #set text(20pt)
  *nimi o weka* tan ni: \
  kalama nimi li nasa
]

#box(draw-block("pu", [1]), baseline: 80%)
#box[
  #set text(20pt)
  *nimi o weka*: tan ni: \
  wile mi.
]

#text(50pt)[*sitelen ale*]

#let groups = 5
#table(columns: groups,
 ..{
   let i = 1
   for sym in nimi.keys().sorted(key: k => nimi.at(k).at("weka", default: (order: 0)).order) {
     (
      scale(160%, reflow: true)[#draw-block(sym, [#i])]
     ,)
     let info = nimi.at(sym)
     if "weka" not in info { i += 1 }
  }}
)

#import "@preview/suiji:0.5.1"
#let rng = suiji.gen-rng(0)
#let (_, nimi-oke) = suiji.shuffle(rng, nimi.pairs().filter(((k,v),) => {
  not "weka" in v
}).map(((k,v),) => k))

#assert(nimi-oke.len() == 133)

#let nth(n) = {
  nimi-oke.at(n)
}

#for sym in nimi.keys().sorted(key: k => nimi.at(k).at("weka", default: (order: 0)).order) {
  let info = nimi.at(sym)
  [(`"`#sym`"`, `"`#info.at("status", default: "ok")`"`), ]
}