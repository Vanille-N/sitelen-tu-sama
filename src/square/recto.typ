#import "@preview/cetz:0.5.2"
#import "@preview/suiji:0.5.1": gen-rng, integers, choice, shuffle

#let polar(s, unit: 1cm) = {
  let (alph, rad) = s.split(":")
  (angle: float(alph) * 1deg, radius: float(rad)*unit)
}

#let rotate90deg(alph, (x,y)) = {
  while alph < 0deg { alph += 360deg }
  while alph >= 90deg {
    (x,y) = (y,-x)
    alph -= 90deg
  }
  (x,y)
}

#import "/meta/nimi.typ"
#import "/meta/project.typ": incidence
#import "/meta/palette.typ"
#import "specs.typ"
#import "/meta/pona.typ": sp

#let show-layouts = false
#let layouts = (
((32.2, 32.1, 7.6), (16.5, 31.9, 7.9), (25.5, -25.4, 14.4), (-29.7, 29.7, 10.2), (15.5, 14.3, 9.2), (29.7, -1.1, 10.1), (-5.3, 25.6, 14.2), (-0.2, -31.0, 8.9), (32.2, 16.6, 7.6), (1.5, -6.6, 15.5), (-25.7, 5.6, 14.1), (-24.2, -24.2, 15.6)),
((3.7, -25.5, 14.3), (-11.1, -7.1, 8.3), (32.6, 32.8, 7.0), (-25.1, 11.7, 14.8), (6.9, 0.1, 10.9), (32.2, -32.1, 7.6), (-18.1, 32.8, 7.0), (-32.6, 32.6, 7.2), (27.3, -12.1, 12.6), (-25.4, -25.4, 14.3), (27.1, 13.7, 12.8), (2.2, 25.3, 14.5)),
((32.0, -3.5, 7.9), (0.4, -6.4, 14.1), (18.8, 5.8, 7.6), (29.4, 29.6, 10.3), (-17.9, 32.4, 7.4), (1.5, -30.2, 9.5), (3.9, 24.1, 15.7), (-32.7, 32.7, 7.1), (-24.3, 10.2, 15.5), (-24.0, -24.1, 15.8), (32.5, 12.0, 7.3), (25.3, -25.2, 14.6)),
((-10.9, -11.1, 7.0), (-29.5, 29.6, 10.3), (26.6, -26.6, 13.2), (8.1, -0.8, 14.4), (-4.6, 25.4, 14.5), (-26.1, -25.9, 13.8), (17.5, 31.7, 8.2), (31.1, -5.0, 8.7), (32.8, 32.8, 7.0), (-25.5, 5.3, 14.1), (0.6, -27.2, 12.6), (28.8, 15.1, 11.0)),
((30.6, 30.3, 9.2), (12.3, -25.1, 14.6), (32.7, -32.7, 7.1), (-26.8, 12.7, 12.9), (-32.6, -32.7, 7.1), (-32.2, 32.5, 7.4), (-26.8, -13.1, 12.8), (25.3, 2.6, 14.5), (6.9, 25.5, 14.4), (-11.7, -30.1, 9.7), (-3.1, -0.9, 13.7), (-15.8, 31.3, 8.5)),
((-14.0, 18.1, 7.5), (-30.3, 30.3, 9.6), (-2.0, -1.9, 12.6), (32.1, -17.4, 7.7), (11.4, -25.5, 14.3), (32.8, -32.7, 7.0), (-27.1, 2.4, 12.7), (30.1, 30.1, 9.8), (6.4, 25.8, 14.0), (-13.6, 32.8, 7.0), (25.4, 4.3, 14.4), (-24.9, -25.0, 14.6)),
((26.2, -6.6, 13.7), (-3.6, -3.8, 8.3), (15.3, 29.9, 9.9), (32.5, 32.5, 7.3), (-24.7, -24.9, 15.0), (8.9, 10.3, 10.3), (-8.0, 26.7, 13.1), (31.0, 15.9, 8.8), (5.0, -25.5, 14.3), (-30.4, 30.4, 9.4), (29.9, -30.0, 9.9), (-25.3, 4.9, 14.6)),
((15.0, 28.9, 11.0), (-24.6, 4.3, 15.1), (-7.5, -12.6, 7.3), (9.3, 3.1, 15.1), (-0.8, -29.3, 10.5), (32.8, 32.8, 7.0), (32.0, -2.5, 7.9), (-8.8, 27.3, 12.6), (30.7, 15.9, 9.1), (-30.5, 30.6, 9.2), (-25.5, -25.6, 14.3), (24.6, -24.5, 15.1)),
((15.3, -31.0, 8.7), (-23.4, 23.6, 16.3), (30.9, -15.0, 8.9), (25.2, 8.0, 14.7), (-1.9, 2.7, 12.7), (30.5, 31.1, 8.7), (32.0, -31.9, 7.8), (-7.0, -25.8, 14.0), (-30.4, -29.3, 9.4), (5.5, 27.2, 12.6), (-26.5, -6.1, 13.3), (12.5, -13.5, 8.8)),
((31.3, 10.2, 8.5), (-32.1, 32.2, 7.7), (-12.9, 28.0, 11.8), (-4.7, -5.6, 7.1), (-25.2, 2.7, 14.6), (11.7, 32.8, 7.1), (25.7, -11.9, 14.1), (-26.2, -26.1, 13.5), (1.4, -25.9, 13.9), (32.5, -32.4, 7.3), (8.3, 11.6, 14.2), (29.4, 29.4, 10.4)),
((-25.3, 25.3, 14.5), (13.0, 31.1, 8.7), (-4.2, -25.1, 14.7), (14.2, -8.4, 9.8), (-1.4, 10.7, 13.3), (32.7, 32.5, 7.1), (32.7, -7.8, 7.1), (27.1, -27.0, 12.7), (-3.8, 32.0, 7.9), (-29.5, -29.5, 10.3), (25.9, 12.4, 13.9), (-25.1, -4.3, 14.6)),
((3.8, -10.3, 13.8), (5.4, -32.3, 7.5), (-24.8, -5.3, 15.0), (26.3, -26.2, 13.6), (9.7, 12.3, 7.2), (-6.3, 10.1, 8.7), (-32.1, -32.0, 7.8), (28.1, -0.1, 11.7), (26.0, 25.9, 13.9), (1.0, 29.0, 10.9), (-13.1, -28.8, 11.1), (-24.9, 25.0, 14.9)),
((-13.2, 28.7, 11.1), (24.7, -3.6, 15.1), (32.7, 18.3, 7.1), (12.3, 25.8, 14.1), (-7.6, 0.8, 15.1), (-24.5, -24.6, 15.1), (-30.1, 15.9, 9.7), (5.1, -25.8, 14.0), (32.8, 32.7, 7.1), (29.4, -29.5, 10.3), (-32.6, 32.8, 7.1), (-31.5, -2.2, 8.2)),
((-23.8, 8.6, 15.9), (32.5, -17.3, 7.4), (11.0, -24.7, 15.1), (32.5, -32.5, 7.4), (29.8, 29.7, 10.1), (-0.2, 6.1, 7.7), (-24.3, -24.1, 15.6), (-6.0, -8.7, 8.1), (-15.9, 31.6, 8.2), (5.2, 26.8, 13.1), (23.9, 4.4, 15.8), (-32.0, 32.3, 7.5)),
)

#let card(
  scaling,
  debug: false,
  edge: (:),
  padding: 0pt,
  symbols: ("a",) * 12,
  circles: layouts.at(0),
  colors: (black,) * 12,
  angles: (0deg,) * 12,
  global-tilt: 0deg,
) = {
  import cetz.draw: *
  specs.card-template(edge: edge, padding: padding, color: palette.light.white)

  let groups = circles.zip(symbols, colors, angles)
  assert(groups.len() == 12)
  for (idx, ((x, y, r), symb, color, alph)) in groups.enumerate() {
    let c = (x * scaling * 1mm, y * scaling * 1mm)
    c = rotate90deg(global-tilt, c)
    let r = r * 1mm
    if debug {
      circle(c, radius: r * scaling)
      content(c, text(gray, 50pt * (r/10mm) * scaling)[#{idx+1}])
    } else {
      //circle(c, radius: r * scaling)
      nimi.place-symbol(symb, angle: alph, color: color, 57pt * scaling * (r/10mm), center: c)
    }
  }
}

#set page(margin: 1cm, width: 31cm, height: 31cm)

#let scale-factor = 91%

#if show-layouts {
  for variant in range(layouts.len()) {
    box(cetz.canvas({
      card(scale-factor, debug: true, edge: (margin: true), circles: layouts.at(variant))
    }), inset: 1pt)
  }
}

#import "/meta/sampler.typ"
#import sampler: repeatable

#let cards = incidence(p: 11)

#let group-size = 9
#let seeds = (
  "a": (9,0,13),
  "b": (12,3,5),
  "c": (21,4,6),
  "d": (4,103,14),
  "e": (29,4,7),
  "f": (32,205,1),
  "g": (47,6,13),
  "h": (49,207,2),
  "i": (58,8,17),
  "j": (60,9,42),
  "k": (6,10,25),
  "l": (73,11,43),
  "m": (84,112,55),
  "n": (93,113,55),
  "o": (97,414,35),
)
#let seed-names = seeds.keys()

#let (colors_,colors) = repeatable(sampler.shuffle(palette.symbol-colors, size: 12), reseed-intv: group-size, seeds: seeds.values().map(a => a.at(0)))
#let (tilt_,tilt) = repeatable(sampler.choice(0deg, 90deg, 180deg, -90deg))
#let (angles_,angles) = repeatable(sampler.sequence(sampler.angle(), size: 12), reseed-intv: group-size, seeds: seeds.values().map(a => a.at(1)))
#let (circles_,circles) = repeatable(sampler.fork(..layouts.map(l => sampler.shuffle(l))), reseed-intv: group-size, seeds: seeds.values().map(a => a.at(2)))

#set page(numbering: "a")

#let ready = ()

#let distributions = (:)
#{
  for (i,c) in cards.slice(0).enumerate() {
    let dnum = int(i / group-size)
    (colors_,colors) = colors_()
    (tilt_,tilt) = tilt_()
    (angles_,angles) = angles_()
    (circles_,circles) = circles_()
    let symbols = c.map(n => nimi.nth(n))
    ready.push(
      (
        symbols: symbols,
        circles: circles,
        angles: angles,
        colors: colors,
        global-tilt: tilt,
      )
    )
    for (symb,pos,col) in symbols.zip(circles, colors) {
      if symb not in distributions {
        distributions.insert(symb, ())
      }
      distributions.at(symb).push((seed: seed-names.at(dnum), size: pos.at(2), color: col))
    }
  }
}

#let render(c, edge: (:), padding: 0pt) = {
  let cc = cetz.canvas({
    card(
      scale-factor,
      edge: edge,
      padding: padding,
      ..c
    )
  })
  cc
}

#{for c in ready {
  box(inset: 1pt, render(c, padding: 0pt))
}}

#pagebreak()

#let seed-score = (
  symbol-color: seed-names.map(n => (n,0)).to-dict(),
  symbol-size: seed-names.map(n => (n,0)).to-dict(),
)
#{
  for (nimi, data) in distributions {
    box(width: 100%)[
      #sp(50pt)[#nimi]
      #{
        for (i, elt) in data.enumerate() {
          for other in data.slice(0, i) {
            if other.color == elt.color {
              seed-score.symbol-color.at(elt.seed) += calc.pow(elt.size + other.size, 2)
            }
            seed-score.symbol-size.at(elt.seed) += calc.pow(elt.size - other.size, 2)
          }
          [(#elt.seed)]
          box[#circle(radius: elt.size * 1pt, fill: elt.color)]
        }
      }
    ]
  }
}

#[
  #set text(30pt)
  = Seed score for colors (lower is better)
  #{for (seed, score) in seed-score.symbol-color {
    [#seed: #score \ ]
  }}

  = Seed score for sizes (higher is better)
  #{for (seed, score) in seed-score.symbol-size {
    [#seed: #score \ ]
  }}
]
