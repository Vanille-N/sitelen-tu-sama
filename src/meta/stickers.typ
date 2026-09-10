#import "@preview/cetz:0.5.2"

#import "pona.typ": sp
#import "palette.typ"
#import "sampler.typ"
#import "nimi.typ"

#let standard-forced = (
  "meli mije tonsi jan mi musi sitelen sona",
).map(s => s.split(" ")).flatten()

#let standard-random = (
  "soweli akesi pipi esun alasa ilo kepeken kasi",
  "kule laso walo pimeja loje jelo",
  "kulupu len luka ma mani kalama",
  "mun suno nasa nasin olin pakala open pan pana",
  "pilin sewi sona tenpo toki tomo unpa waso wile",
).map(s => s.split(" ")).flatten()

#let weird-forced = (
  "ma+pona toki+pona lipu&tenpo kijetesantakalu",
).map(s => s.split(" ")).flatten()

#let weird-random = (
  "jonke apeja soko",
  "unu mu monsuta namako jasima lanpan linluwi nimisin",
  "konwe kiki oke usawi",
).map(s => s.split(" ")).flatten()

#let sticker(w, sz, color) = {
  box(cetz.canvas({
    import cetz.draw: *
    circle((), radius: sz * 1.2, stroke: (thickness: 0.2pt, paint: gray, dash: "dashed"))
    nimi.place-symbol(w, 2 * sz, color: color)
  }), inset: 2pt)
}

#let sticker-pack(words, seed: 0) = {
  let (color_,color) = sampler.repeatable(sampler.choice(..palette.symbol-colors), seed: 1000 + seed)
  let size = 1.3cm

  //  weird-forced + sampler.once(sampler.shuffle(weird-random, size: extra), seed: seed)
  let stickers = ()
  for w in words {
    (color_,color) = color_()
    //(size_,size) = size_()
    stickers.push((size: size, stk: sticker(w, size, color)))
  }
  stickers.sorted(key: x => -x.size).map(x => x.stk)
}

#let fixed-pack(seed: 0) = {
  let fixed-words = standard-forced + weird-forced
  sticker-pack(fixed-words, seed: 3000 + seed)
}

#let random-pack(nstd, nextra, seed: 0) = {
  let random-words = sampler.once(sampler.shuffle(standard-random, size: nstd), seed: 2000 + seed) + sampler.once(sampler.shuffle(weird-random, size: nextra), seed: 2001 + seed)
  sticker-pack(random-words, seed: 2002 + seed)
}

#for s in fixed-pack() { s }
#for s in random-pack(3, 1) { s }
