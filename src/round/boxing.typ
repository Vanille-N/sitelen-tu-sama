#import "@preview/cetz:0.5.2"
#import "specs.typ"

#import "/meta/palette.typ": cc

#import "/meta/pona.typ": sp, unsp, body, heading, title, quot

#set page(flipped: true, margin: 1cm)

#let boundary = (
  margin: true,
  cut: true,
)

#let circ-boundaries(radius) = {
  import cetz.draw: *
  if boundary.margin {
    circle((0,0), radius: radius + 1mm, stroke: rgb("00ffff"))
    circle((0,0), radius: radius - specs.inner-padding, stroke: rgb("ff00ff"))
  }
  if boundary.cut {
    circle((0,0), radius: radius, stroke: (thickness: 0.5pt, dash: "dashed"))
  }
}
#let circ-background(radius, bg) = {
  import cetz.draw: *
  circle((0,0), radius: radius + 1mm, stroke: none, fill: bg)
}

#let rect-boundaries(width, height) = {
  import cetz.draw: *
  if boundary.margin {
    rect((-specs.outer-padding,-specs.outer-padding), (width + specs.outer-padding,height + specs.outer-padding), stroke: rgb("00ffff"))
    rect((specs.inner-padding, specs.inner-padding), (width - specs.inner-padding, height - specs.inner-padding), stroke: rgb("ff00ff"))
  }
  if boundary.cut {
    rect((0,0), (width, height), stroke: (thickness: 0.5pt, dash: "dashed"))
  }
}
#let rect-background(width, height, bg) = {
  import cetz.draw: *
  rect((-specs.outer-padding,-specs.outer-padding), (width + specs.outer-padding,height + specs.outer-padding), stroke: none, fill: bg)
}

// Contents

#let credits = box(inset: (left: 0pt))[
    // Add: printing Verimag
    // Add: box Artes Bella
    // Add: gruvbox
    // Add: license for sitelen seli kiwen
    // Add: license for this game + github url
    #let addr = (size: 7pt, baseline: -1pt)
    #let div(delta) = {
      v(-3mm)
      line(start: (delta,0%), end: (100% - delta,0%), stroke: cc("a-") + 0.5pt)
      v(-3mm)
    }
    #sp[#heading[jan seme li pali]]
      #v(1mm)
      #body[#sp(10pt)[
        .. , jan #sp(cc("g"))[[Newen]] 
          li pali e ijo musi
        .. . toki:#unsp(..addr)[jan-Newen\@crans.org] \
        .,ona li kepeken e ilo sitelen #quot("b")[#unsp[Typst]]
        . . . . . .,kepeken: #unsp(..addr)[typst.app] \
        ,, lipu ale li lon poki lipu #quot("g+")[#unsp[GitHub]]
        .,; lipu: #unsp(..addr)[github:Vanille-N/sitelen-sama-tu] \
        .. sina ken jasima en ante en pana en kepeken e lipu ale, taso sina o esun ala e ona \
      ]]
      #div(1%)
      #body[#sp(10pt)[
        kulupu esun #quot("o+")[#unsp[PrintEurope]] li pana esun e lipu sike #h(3mm).
        toki: #unsp(..addr)[jeuxdecartes.printeurope.fr] \
        tomo esun #quot("y")[#unsp[Artesbellas]] li pana esun e poki
        .. .., tomo: #unsp(..addr)[www.artesbellas.fr] \
        ilo sitelen tan tomo pi(alasa sona) #quot("o")[#unsp[Verimag]] li pana e lipu ante
        .,lipu:#unsp(..addr)[www-verimag.imag.fr]\
      ]]
      #div(0.4%)
      #body[#sp(10pt)[
        ,jan #sp(cc("p-"))[[melinjakulekule]] li pali e nasin sitelen #sp(cc("r-"))[[sitelen&seli&kiwen]].
        ,;sitelen: #unsp(..addr)[github:kreativekorp/sitelen-seli-kiwen] \
        .. ni3 la, jan #sp(cc("g"))[[Newen]] li ante lili e sitelen #quot("a")[mije] en #quot("a")[tomo2] en #quot("a")[mani] \
        .. .; sina ken jasima en ante en pana en kepeken e nasin sitelen, taso sina o esun ala e ona wan taso
      ]]
      #div(8%)
      #body[#sp(9.5pt)[
        ..;jan #sp(cc("b+"))[[kasi en kalama ale mun en]] en ijo #sp(cc("p+"))[[vivi]] en nanpa #sp(cc("r+"))[[mute2 mute2 tu]] en jan #sp(cc("o"))[[KeTami]] \
        .. .,;en jan ante lon ma-pona pi(toki-pona), li alasa e pakala lili, li pana e sona pona ona
      ]]
      #div(21%)
      #body[#sp(9pt)[
        .. .. .,;lon tenpo ma pi(mute2 ale mute2 luka wan)
        ,;#unsp(8pt)[(2026)]
      ]]
      #v(-1mm)
    ]

#let top =  cetz.canvas({
    import "recto.typ"
    import "/meta/nimi.typ"
    import "/meta/comb.typ"
    recto.card(98%,
      edge: (cut: false),
      symbols: ("ale", "ante", "kasi", "tomo2", "musi", "weka", "e", "pilin", "tenpo", "utala", "mani", "lon"),
      circles: comb.apply-shuffle(recto.layouts.at(1), (1,2,4,11,8,5,0,3,6,9,7,10)),
      colors: {
        (cc("r"), cc("b-"), cc("g"), cc("a"), cc("y-"), cc("o-"), cc("q"), cc("b"), cc("p-"), cc("o"), cc("g-"), cc("y"))
      },
      angles: (30deg,-20deg,15deg,220deg,30deg,130deg,-90deg,50deg,20deg,-110deg,20deg,-40deg),
    )
})


#let bottom = cetz.canvas({
  import "verso.typ"
  verso.card(edge: (cut: false))
})

// Setup

#box(cetz.canvas({
  import cetz.draw: *
  circ-background(50mm, cc("a-"))
  circle((), radius: specs.radius + 5mm - specs.inner-padding, stroke: none, fill: tiling()[
    #move(dx: -0mm, dy: -0mm, top)
  ])
  circ-boundaries(50mm)
}))
#box(cetz.canvas({
  import cetz.draw: *
  circ-background(45mm, cc("a-"))
  import "rulebook.typ"
  circle((), radius: specs.radius - specs.inner-padding, stroke: none, fill: tiling()[
    #move(dx: -5mm, dy: -5mm, bottom)
  ])
  circ-boundaries(45mm)
}))
#box(cetz.canvas({
  import cetz.draw: *
  rect-background(22cm, 2cm, cc("w-"))
  //
  rect-boundaries(22cm, 2cm)
}))
#box(cetz.canvas({
  import cetz.draw: *
  rect-background(29cm, 48mm, cc("w-"))
  //
  rect-boundaries(20cm, 5cm)
}))
#box(cetz.canvas({
  import cetz.draw: *
  circ-background(45mm, cc("w-"))
  content((0,0), credits)
  circ-boundaries(45mm)
}))
#box(cetz.canvas({
  import cetz.draw: *
  rect-background(22cm, 2cm, cc("w-"))
  //
  rect-boundaries(22cm, 2cm)
}))
#box(cetz.canvas({
  import cetz.draw: *
  rect-background(29cm, 48mm, cc("w-"))
  //
  rect-boundaries(20cm, 5cm)
}))