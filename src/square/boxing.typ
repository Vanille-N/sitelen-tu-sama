#import "@preview/cetz:0.5.2"
#import "specs.typ"

#import "recto.typ"
#import "/meta/nimi.typ"

#import "/meta/palette.typ"
#import palette: cc
#import "/meta/pona.typ": sp, unsp, body, heading, title, quot

#let cardno = 13

#let outer-stroke = specs.outer-stroke
#let inner-stroke = specs.inner-stroke
#let cut-stroke = (paint: cc("a"), thickness: 0.1pt)
#let margin = specs.inner-padding

#set page(margin: 7mm)

#let dp(to, ..args) = {
  if args.pos().len() > 0 {
    (to: to, rel: args.pos())
  } else {
    (to: to, rel: args.named())
  }
}

#let fullbox(..args) = box(width: 100%, height: 100%, radius: 2mm, inset: 2pt, ..args)
#let rotbox(c, cancel: false) = box(rotate(if cancel { 0deg } else { 90deg }, reflow: true, c))

#let plane(bg: white, size: 5cm, height: auto, inset: 5pt, contents) = {
  let height = if height == auto { size } else { height }
  box(width: size, height: height, stroke: cut-stroke, fill: bg, inset: inset, baseline: bottom, radius: 4mm)[#contents]
}

#let top-inner-size = 95mm
#let credits = plane(bg: cc("w-"), size: top-inner-size)[
    #let addr = (size: 7pt, baseline: -1pt)
    #let div(delta) = {
      v(-2mm)
      line(start: (delta,0%), end: (100% - delta,0%), stroke: cc("a-") + 0.5pt)
      v(-2mm)
    }
    #sp[#heading[jan seme li pali]]
      #body[#sp(9pt)[
        jan #sp(cc("g"))[[Newen]] 
          li pali e ijo musi
        #h(1fr) toki:; #unsp(..addr)[jan-Newen\@crans.org] \
        . ona2 li kepeken e ilo sitelen #quot("b")[#unsp[Typst]]
        #h(1fr) kepeken:; #unsp(..addr)[typst.app] \
        . lipu ale li lon poki lipu #quot[#unsp(cc("g+"))[Git]#unsp(cc("g-"))[Hub]]
        #h(1fr) lipu:; #unsp(..addr)[github:vanille-n/sitelen-tu-sama] \
        .. sina2 ken jasima en ante en pana en kepeken e lipu ale,
        taso sina2 o esun mani ala e ona2 en ijo pi(kepeken ona) \
      ]]
      #div(1%)
      #body[#sp(9pt)[
        kulupu pi(esun lipu) #quot[#unsp(cc("o-"))[Print]#unsp(cc("o+"))[Europe]] li pana esun e lipu musi
        #h(1fr) toki:; #unsp(..addr)[jeuxdecartes.printeurope.fr] \
        ilo sitelen tan tomo pi(alasa sona) #quot("o")[#unsp[Verimag]] li pana e lipu sona
        #h(1fr) lipu:; #unsp(..addr)[www-verimag.imag.fr]\
        tomo pi(esun ilo) #quot[#unsp(cc("y-"))[Artes]#unsp(cc("y+"))[bellas]] li pana esun e poki
        #h(1fr) tomo:; #unsp(..addr)[www.artesbellas.fr] \
      ]]
      #div(1%)
      #body[#sp(9pt)[
        jan #sp(cc("p-"))[[melinjakulekule]] li pali e nasin sitelen #sp(cc("r-"))[[sitelen&seli&kiwen]].
        #h(1fr) sitelen:; #unsp(..addr)[github:kreativekorp/sitelen-seli-kiwen] \
        . ni3 la, jan #sp(cc("g"))[[Newen]] li ante lili e sitelen #quot("a")[mije] en #quot("a")[tomo2] en #quot("a")[mani] en ante kin \
        .. sina2 ken jasima en ante en pana en kepeken e nasin sitelen,
        taso sina2 o esun mani ala e ona2 wan taso
      ]]
      #div(1%)
      #body[#sp(9pt)[
        jan #quot("o-")[#unsp[morhetz]] li pali e kulupu kule #quot[#unsp(cc("p"))[G]#unsp(cc("b"))[r]#unsp(cc("q"))[u]#unsp(cc("g"))[v]#unsp(cc("y"))[b]#unsp(cc("o"))[o]#unsp(cc("r"))[x]]
        #h(1fr) kule:; #unsp(..addr)[github:morhetz/gruvbox] \
      ]]
      #div(1%)
      #body[#sp(9pt)[
        jan #sp(cc("b+"))[[kasi en kalama ale mun en]] en ijo #sp(cc("p+"))[[vivi]] en nanpa #sp(cc("r+"))[[mute2 mute2 tu]] en jan #sp(cc("o"))[[KeTami]]
        en jan ante lon ma-pona pi(toki-pona) \
        .. li alasa e pakala lili, li pana e sona pona ona
      ]]
      #div(1%)
      #body[#sp(9pt)[
        #h(1fr)
        pali pi(kulupu nanpa wan)
        . lon ma [kalama awen nasin sona esun]
        . lon tenpo ma pi(mute2 ale mute2 luka wan)
        ,;#unsp(8pt)[(2026)]
      ]]
      #v(-1mm)
    ]

#let bot-inner-size = 90mm
#let bottom-lining = plane(bg: cc("w-"), size: bot-inner-size, {
  //show: align.with(center + horizon)
  cetz.canvas({
    import cetz.draw: *
    content((0,0))[#sp(7cm, cc("a"))[poki]]
    content((0,-0.5), angle: 60deg)[#sp(3cm, cc("b"))[sitelen]]
    content((0.8,1.7), angle: -10deg)[#sp(3cm, cc("g"))[sitelen]]
    content((-1.2,2.7), angle: 40deg)[#sp(3cm, cc("o"))[sitelen]]
    content((1.1,3.8), angle: -80deg)[#sp(3cm, cc("y"))[sitelen]]
    content((-3,4), angle: 30deg)[#sp(3cm, cc("p"))[sitelen]]
    content((-4,-0.4), angle: -10deg)[#sp(4cm, cc("r-"))[lipu+sona]]
  })
})

#import "/meta/sampler.typ"
#import sampler: repeatable
#let (colors_,colors) = repeatable(sampler.shuffle(palette.symbol-colors, size: 12), seeds: (cardno,))
#let (alasacolors_,alasacolors) = repeatable(sampler.shuffle(palette.symbol-colors, size: 12), seeds: (cardno + 1,))
#let (angles_,angles) = repeatable(sampler.sequence(sampler.angle(), size: 12), seeds: (cardno,))
#let (symsize_,symsize) = repeatable(sampler.shuffle((1.6cm, 1.4cm, 1.2cm, 1.0cm, 0.9cm) * 3, size: 12), seeds: (cardno,))
#let (vmov_,vmov) = repeatable(sampler.shuffle((0%, 10%, 20%, 30%, 40%, 50%, 60%, 70%, 80%, 90%, 100%) * 2, size: 12), seeds: (cardno + 1,))

#let top-outer-size = 100mm
#let top-ear-length = 20mm
#{(colors_,colors) = colors_()}
#{(alasacolors_,alasacolors) = alasacolors_()}
#{(angles_,angles) = angles_()}
#{(symsize_,symsize) = symsize_()}
#{(vmov_,vmov) = vmov_()}
#let symbols = recto.cards.at(cardno + 1).map(n => nimi.nth(n))

#let top-face = plane(bg: cc("w-"), size: top-outer-size, {
    import "recto.typ"
    scale(120%, reflow: true, recto.render(recto.ready.at(cardno), edge: (cut: false, margin: false)))
})

#let top-side = {
  for i in range(2) {
    (
      plane(size: top-outer-size, height: top-ear-length, bg: cc("a-"), {
        show: c => align(center, box(fill: cc("w-"), radius: 2mm, c))
        h(0.5fr)
        for j in range(6) {
          let k = i * 6 + j
          box(height: 100%, baseline: bottom, width: 100%/6, {
            align(center, {
              v(vmov.at(k) * 1fr)
              box(rotate(angles.at(k), reflow: true, {
                sp(symsize.at(k), colors.at(k))[#symbols.at(k)]
              }))
              v((100% - vmov.at(k)) * 1fr)
            })
          })
        }
        h(0.5fr)
      })
    ,)
  }
  let alasa = "o alasa e sitelen tu sama".split(" ")
  (
    plane(size: top-outer-size, height: top-ear-length, bg: cc("a-"), {
      align(center, {
        fullbox(fill: cc("w-"), {
          h(1fr)
          for (i, w) in alasa.enumerate() {
            sp(alasacolors.at(i), 50pt)[#w]
            h(1fr)
          }
        })
      })
    })
  ,
    plane(size: top-outer-size, height: top-ear-length, bg: cc("a-"), {
      align(center, {
        fullbox(fill: cc("w-"), {
          h(1fr)
          for (i, w) in alasa.enumerate() {
            sp(alasacolors.at(6 + i), 50pt)[#w]
            h(1fr)
          }
        })
      })
    })
  ,)
}

#import "/meta/help.typ"
#let bot-outer-size = 100mm
#let bot-ear-length = 45mm
#let bot-wrap-length = 2mm
#let bot-joint-length = 0mm
//#{(colors_,colors) = colors_()}
//#{(angles_,angles) = angles_()}
//#{(symsize_,symsize) = symsize_()}
//#let symbols = recto.cards.at(side-card).map(n => nimi.nth(n))
#let bottom-face = plane(size: bot-outer-size, bg: cc("a-"), {
  import "verso.typ"
  show: align.with(center + horizon)
  show: scale.with(115%, reflow: true)
  cetz.canvas({
    verso.card(edge: (cut: false), hidden-text: help.pad3dig(cardno))
  })
})
#let bottom-side = {
  (
    plane(bg: cc("a-"), size: bot-outer-size, height: bot-ear-length, fullbox(fill: cc("w-"), inset: (x: 0pt, y: 2pt), {
      place(bottom + left, sp(70pt, cc("p"))[ii jetesantakalukin])
      place(bottom + right, scale(x: -100%, sp(70pt, cc("g"))[ii jetesantakalukin]))
      place(bottom + center, dx: -7mm, scale(y: 50%, reflow: true, rotate(45deg, reflow: true, sp(50pt, cc("o"))[sitelen])))
      place(bottom + center, dx: 7mm, scale(y: 50%, reflow: true, rotate(-20deg, reflow: true, sp(50pt, cc("q"))[sitelen])))
      place(bottom + center, dy: -2.5cm, dx: -7mm, sp(25pt, cc("p-"))[seme li sama])
      place(bottom + center, dy: -1.7cm, dx: 7mm, sp(25pt, cc("g-"))[mi2 sona ala])
      place(bottom + center, dx: -15mm, dy: -16mm, rotate(-40deg, sp(25pt, cc("p+"))[---]))
      place(bottom + center, dx: 15mm, dy: -11mm, rotate(40deg, sp(25pt, cc("g+"))[--]))
    }))
  ,
    plane(bg: cc("a-"), size: bot-outer-size, height: bot-ear-length, fullbox(fill: cc("w-"), inset: (x: 0pt, y: 2pt), {
      place(left + horizon, dy: 5mm, [
        #sp(50pt, cc("b+"))[tomo2]
        #sp(17pt, cc("r-"))[jan]
        #sp(15pt, cc("p"))[jan]
        #sp(20pt, cc("y"))[jan]
        #h(9mm)
        #sp(20pt, cc("o-"))[jan]
        #box(move(dy: 1mm, sp(20pt, cc("k+"))[supa]))
        #sp(18pt, cc("a"))[jan]
        #h(5mm)
        #sp(22pt, cc("q"))[jan]
        #sp(17pt, cc("g-"))[jan]
        #h(4mm)
        #sp(40pt, cc("p+"))[tomo2]
      ])
      place(top, dx: 27mm, dy: 15mm, rotate(-30deg, [
        #box(rotate(10deg, reflow: true, sp(15pt, cc("b+"))[kalama]))
        #box(rotate(-20deg, reflow: true, sp(11pt, cc("b-"))[kalama]))
        #box(rotate(-2deg, reflow: true, sp(13pt, cc("q+"))[kalama]))
        #box(rotate(4deg, reflow: true, sp(7pt, cc("g+"))[kalama]))
        #box(rotate(12deg, reflow: true, sp(12pt, cc("q-"))[kalama]))
      ]))
      
      place(bottom + left, sp(69.3pt, cc("g"))[ii ii ii ii ii ii ii ii ii ii])
    }))
  ,
    plane(bg: cc("a-"), size: bot-outer-size, height: bot-ear-length, fullbox(fill: cc("w-"), inset: (x: 0pt, y: 2pt), {
      place(top + right, dx: -5mm, dy: 2mm, sp(50pt, cc("y-"))[suno])
      place(top + right, dx: -7.5mm, dy: 3.55mm, sp(40pt, cc("w-"))[xmun])
      place(top + right, dx: -7.5mm, dy: 3.55mm, sp(40pt, cc("b+"))[mun])
      place(left + horizon, dy: 5mm, [
        #sp(50pt, cc("o"))[tomo2]
        #sp(30pt, cc("r+"))[tomo2]
        #sp(40pt, cc("k-"))[tomo2.]
        #sp(20pt, cc("q-"))[jan]
        #sp(22pt, cc("b-"))[jan]
        #sp(17pt, cc("g-"))[jan]
        #h(1cm)
        #sp(10pt, cc("b-"))[telo]
        #sp(9pt, cc("b"))[telo]
        #sp(12pt, cc("q"))[telo]
        #sp(14pt, cc("q+"))[telo]
        #sp(11pt, cc("b+"))[telo]
        #sp(12pt, cc("q-"))[telo]
      ])
      place(bottom + left, sp(69.3pt, cc("p"))[ii ii ii ii ii ii ii ii ii ii])
    }))
  ,
    plane(bg: cc("a-"), size: bot-outer-size, height: bot-ear-length, fullbox(fill: cc("w-"), inset: (x: 0pt, y: 2pt), {
      place(top + left)[
        #sp[#heading[seme li lon insa poki]]
        #v(-3mm)
        #box(inset: (x: 2pt), sp[#body(size: 11pt)[
          nanpa wan la, poki li jo e lipu musi. sitelen pona li lon lipu ale. \
          nanpa tu la, li jo e lipu pi(sona musi).
            sina2 ken kama sona e nasin musi tan lukin e ona2. \
          nanpa tu wan la, li jo e lipu namako lili.
            sina ken pana e ona2 lon lipu tawa pona e ona2. \
          ken la, nanpa tu tu la, li jo e lipu sona pi(toki ante). lukin ona2 la, jan kokosila li ken kama sona e sitelen. \
        ]])
      ]
      place(bottom + left, scale(x: -100%, sp(70pt, cc("g"))[kii ii]))
      place(bottom + right, sp(70pt, cc("p"))[kii ii])
      place(bottom + center)[
        #box(rotate(10deg, reflow: true, sp(17pt, cc("g-"))[olin1]))
        #box(rotate(-10deg, reflow: true, sp(22pt, cc("g+"))[olin1]))
        #box(rotate(3deg, reflow: true, sp(30pt, cc("k-"))[olin1]))
        #box(rotate(7deg, reflow: true, sp(22pt, cc("p+"))[olin1]))
        #box(rotate(-5deg, reflow: true, sp(17pt, cc("p-"))[olin1]))
      ]
    }))
  )
}

#import "/meta/stickers.typ"

#top-face
#rotbox[#top-side.at(0)]
#rotbox[#top-side.at(1)]
#rotbox[#top-side.at(2)]
#rotbox[#top-side.at(3)]
#bottom-face
#let stks = stickers.random-pack(12, 6, seed: cardno)
#box(baseline: bottom, {
  stks.at(0)
  stks.at(1)
  linebreak()
  stks.at(2)
  stks.at(3)
  linebreak()
  stks.at(4)
  stks.at(5)
})
#stks.slice(6).join[]

#credits
#bottom-lining
#rotbox(cancel: false)[#bottom-side.at(0)]
#rotbox(cancel: false)[#bottom-side.at(1)]
#rotbox(cancel: false)[#bottom-side.at(2)]
#rotbox(cancel: false)[#bottom-side.at(3)]
#for s in stickers.fixed-pack(seed: cardno) { s }

// What to put on bottom-side ?
// - seme li lon insa should go here
//   In the rulebook I'll expand on the way the game works.
//   (link to explanatory video ?)
// - some cute drawings ?
//   - (long) kijetesantakalu looking at cards
// - cute lot of stickers
