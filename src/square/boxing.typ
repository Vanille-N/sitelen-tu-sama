#import "@preview/cetz:0.5.2"
#import "specs.typ"

#import "recto.typ"
#import "/meta/nimi.typ"

#import "/meta/palette.typ"
#import palette: cc
#import "/meta/pona.typ": sp, unsp, body, heading, title, quot

#let outer-stroke = specs.outer-stroke
#let inner-stroke = specs.inner-stroke
#let cut-stroke = specs.cut-stroke
#let margin = specs.inner-padding

#set page(margin: 5mm)

#let dp(to, ..args) = {
  if args.pos().len() > 0 {
    (to: to, rel: args.pos())
  } else {
    (to: to, rel: args.named())
  }
}

#let plane(bg: white, size: 5cm, contents) = box({
  cetz.canvas({
    import cetz.draw: *
    rect((-size/2,-size/2), (size/2,size/2), stroke: cut-stroke, fill: bg)
    content((0,0))[#box(width: size, height: size)[#contents()]]
  })
})

#let wrap(bg: white, base: 5cm, ear: 2cm, wrap: 5mm, joint: 2mm, flipped: false, contents) = box({
  let ear-tilt = if flipped { 180deg } else { 0deg }
  cetz.canvas({
    import cetz.draw: *
    content((0,0))[#(contents.center)(base)]
    content((0,base/2 + joint + ear/2 + wrap/2), angle: 180deg + ear-tilt)[#box(width: base, height: ear + wrap)[#(contents.north)(base, ear, wrap)]]
    content((0,-base/2 - joint - ear/2 - wrap/2), angle: ear-tilt)[#box(width: base, height: ear + wrap)[#(contents.south)(base, ear, wrap)]]
    content((base/2 + joint + ear/2 + wrap/2, 0), angle: 90deg + ear-tilt)[#box(width: base, height: ear + wrap)[#(contents.east)(base, ear, wrap)]]
    content((-base/2 - joint - ear/2 - wrap/2, 0), angle: -90deg + ear-tilt)[#box(width: base, height: ear + wrap)[#(contents.west)(base, ear, wrap)]]

    merge-path(stroke: cut-stroke, {
      line((base/2,base/2), dp((), 0, joint + ear + wrap))
      line((), dp((), -base, 0))
      line((), dp((), 0, -joint - ear - wrap))
      line((), dp((), -joint - ear - wrap, 0))
      line((), dp((), 0, -base))
      line((), dp((), joint + ear + wrap, 0))
      line((), dp((), 0, -joint - ear - wrap))
      line((), dp((), base, 0))
      line((), dp((), 0, joint + ear + wrap))
      line((), dp((), joint + ear + wrap, 0))
      line((), dp((), 0, base))
      line((), dp((), -joint - ear - wrap, 0))
    })
  })
})


#let credits() = box(width: 100%, height: 100%, inset: 3mm)[
    // Add: printing Verimag
    // Add: box Artes Bella
    // Add: gruvbox
    // Add: license for sitelen seli kiwen
    // Add: license for this game + github url
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
        #h(1fr) lipu:; #unsp(..addr)[github:Vanille-N/sitelen-tu-sama] \
        .. sina2 ken jasima en ante en pana en kepeken e lipu ale,
        taso sina2 o esun ala e ona2 \
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
        . ni3 la, jan #sp(cc("g"))[[Newen]] li ante lili e sitelen #quot("a")[mije] en #quot("a")[tomo2] en #quot("a")[mani] \
        .. sina2 ken jasima en ante en pana en kepeken e nasin sitelen,
        taso sina2 o esun ala e ona2 wan taso
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

#let top-inner-size = 95mm
#plane(bg: cc("w-"), size: top-inner-size, credits)
//
#let bot-inner-size = 90mm
#plane(bg: (cc("w-")), size: bot-inner-size, () => {
  show: align.with(center + horizon)
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
#let (colors_,colors) = repeatable(sampler.shuffle(palette.symbol-colors, size: 12), seeds: (0,))
#let (angles_,angles) = repeatable(sampler.sequence(sampler.angle(), size: 12), seeds: (0,))
#let (symsize_,symsize) = repeatable(sampler.shuffle((2cm, 1.8cm, 1.6cm, 1.4cm, 1.2cm, 1.0cm, 0.9cm) * 2, size: 12), seeds: (0,))

#let top-outer-size = 100mm
#let top-ear-length = 20mm
#let top-wrap-length = 5mm
#let top-card = 14
#let side-card = 15
#{(colors_,colors) = colors_()}
#{(angles_,angles) = angles_()}
#{(symsize_,symsize) = symsize_()}
#let symbols = recto.cards.at(side-card).map(n => nimi.nth(n))
#wrap(bg: cc("w-"), base: top-outer-size, ear: top-ear-length, wrap: top-wrap-length, (
  center: (sz) => {
    import "recto.typ"
    scale(130%, reflow: true, recto.rendered.at(top-card))
  },
  north: (wth,hgt,marg) => box(width: wth, height: hgt + marg, inset: 2mm, fill: cc("w-"), {
    box(width: 100%, height: hgt - 2mm, {
        h(0.5fr)
        (0,1,2,3).map(i => {
          box(height: 100%, width: 25%, align(horizon + center, rotate(angles.at(i), box(baseline: 50%, sp(symsize.at(i), colors.at(i))[#symbols.at(i)]))))
        }).join[]
        h(0.5fr)
    })
  }),
  south: (w,h,m) => box(width: w, height: h + m, inset: 2mm, fill: cc("a-"), {
    box(width: 100%, height: h - 2mm, fill: cc("w-"), {
      align(center, {
        sp(cc("y-"), 57pt)[o alasa e sitelen tu sama]
      })
    })
  }),
  east: (wth,hgt,marg) => box(width: wth, height: hgt + marg, inset: 2mm, fill: cc("w-"), {
    box(width: 100%, height: hgt - 2mm, {
        h(0.5fr)
        (4,5,6,7).map(i => {
          box(height: 100%, width: 25%, align(horizon + center, rotate(angles.at(i), box(baseline: 50%, sp(symsize.at(i), colors.at(i))[#symbols.at(i)]))))
        }).join[]
        h(0.5fr)
    })
  }),
  west: (wth,hgt,marg) => box(width: wth, height: hgt + marg, inset: 2mm, fill: cc("w-"), {
    box(width: 100%, height: hgt - 2mm, {
        h(0.5fr)
        (8,9,10,11).map(i => {
          box(height: 100%, width: 25%, align(horizon + center, rotate(angles.at(i), box(baseline: 50%, sp(symsize.at(i), colors.at(i))[#symbols.at(i)]))))
        }).join[]
        h(0.5fr)
    })
  }),
))


#import "/meta/help.typ"
#let bot-outer-size = 100mm
#let bot-ear-length = 50mm
#let bot-wrap-length = 2mm
#let bot-joint-length = 0mm
#{(colors_,colors) = colors_()}
#{(angles_,angles) = angles_()}
#{(symsize_,symsize) = symsize_()}
#let symbols = recto.cards.at(side-card).map(n => nimi.nth(n))
#wrap(bg: cc("w-"), base: bot-outer-size, ear: bot-ear-length, wrap: bot-wrap-length, joint: bot-joint-length, (
  center: (sz) => {
    import "verso.typ"
    show: scale.with(130%, reflow: true)
    cetz.canvas({
      verso.card(edge: (cut: false, margin: false), hidden-text: help.pad3dig(top-card))
    })
  },
  north: (wth,hgt,marg) => box(width: wth, height: hgt + marg, inset: 2mm, fill: cc("w-"), {
    /*box(width: 100%, height: hgt - 2mm, {
        h(0.5fr)
        (0,1,2,3).map(i => {
          box(height: 100%, width: 25%, align(horizon + center, rotate(angles.at(i), box(baseline: 50%, sp(symsize.at(i), colors.at(i))[#symbols.at(i)]))))
        }).join[]
        h(0.5fr)
    })*/
  }),
  south: (w,h,m) => box(width: w, height: h + m, inset: 2mm, fill: cc("a-"), {
    /*box(width: 100%, height: h - 2mm, fill: cc("w-"), {
      align(center, {
        sp(cc("y-"), 57pt)[o alasa e sitelen tu sama]
      })
    })*/
  }),
  east: (wth,hgt,marg) => box(width: wth, height: hgt + marg, inset: 2mm, fill: cc("w-"), {
    /*box(width: 100%, height: hgt - 2mm, {
        h(0.5fr)
        (4,5,6,7).map(i => {
          box(height: 100%, width: 25%, align(horizon + center, rotate(angles.at(i), box(baseline: 50%, sp(symsize.at(i), colors.at(i))[#symbols.at(i)]))))
        }).join[]
        h(0.5fr)
    })*/
  }),
  west: (wth,hgt,marg) => box(width: wth, height: hgt + marg, inset: 2mm, fill: cc("w-"), {
    /*box(width: 100%, height: hgt - 2mm, {
        h(0.5fr)
        (8,9,10,11).map(i => {
          box(height: 100%, width: 25%, align(horizon + center, rotate(angles.at(i), box(baseline: 50%, sp(symsize.at(i), colors.at(i))[#symbols.at(i)]))))
        }).join[]
        h(0.5fr)
    })*/
  }),
))

