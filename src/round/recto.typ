#import "@preview/cetz:0.5.2"
#import "@preview/suiji:0.5.1": gen-rng, integers, choice, shuffle

#let polar(s, unit: 1cm) = {
  let (alph, rad) = s.split(":")
  (angle: float(alph) * 1deg, radius: float(rad)*unit)
}

#import "/meta/nimi.typ"
#import "/meta/project.typ": incidence
#import "/meta/palette.typ"
#import "specs.typ"
#import "/meta/pona.typ": sp

#let layouts = (
  (
    "2.1:33.0,11.6", "46.5:31.6,12.8", "87.8:35.3,9.7", "101.9:12.4,13.5", "123.4:35.2,9.6", "164.7:31.0,14.0", "217.9:31.2,13.8", "248.2:10.7,8.4", "256.9:36.0,9.0", "294.9:29.8,13.2", "330.1:36.5,7.8", "340.8:13.7,9.2"
  ),
  (
    "0:29.5,15", "38.0:37,7.5", "68:34.2,10.5", "60.2:14,10", "113.0:30.7,14.3", "156.2:36.4,8.6", "165.8:18.0,10.2", "182.7:36.9,8.1", "220.7:30.3,14.6", "263.4:35.3,9.7", "270.2:8.0,11.2", "303.6:31.5,13.5"
  ),
  (
    "16.6:33.4,11.2", "37.8:10.5,12.6", "55.8:33.7,11.3", "103.9:30.1,14.9", "149.7:34.5,10.5", "171.4:14.9,10.7", "182.4:35.7,9.3", "218.9:30.9,12.1", "258.8:34.4,10.4", "287.2:37.5,7.2", "263.5:14.1,10.0", "325.6:29.5,14.9"
  ), (
    "24:33.5,11.2", "60:10.5,9.9", "66.0:32.9,12.1", "117.6:30.2,14.9", "171.5:31.7,13.2", "208.4:36.3,8.7", "221.6:12.4,12.2", "240.1:34.3,10.7", "282.7:31.6,13.4", "316.3:37.6,7.4", "323.1:15.0,9.0", "346.0:34,10.6"
  ),
).map(l => l.map(s => {
  let (c,r) = s.split(",")
  (polar(c, unit: 1mm), float(r) * 1mm)
}))

#let card(
  scaling,
  debug: false,
  edge: (:),
  symbols: ("a",) * 12,
  circles: layouts.at(0),
  colors: (black,) * 12,
  angles: (0deg,) * 12,
  global-tilt: 0deg,
) = {
  import cetz.draw: *
  specs.card-template(edge: edge, color: palette.light.white)

  for (idx, ((c, r), symb, color, alph)) in circles.zip(symbols, colors, angles).enumerate() {
    c.radius *= scaling
    c.angle += global-tilt
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

#let scale-factor = 88%

#for variant in range(layouts.len()) {
  box(cetz.canvas({
    card(scale-factor, debug: true, edge: (margin: true), circles: layouts.at(variant))
  }), inset: 1pt)
}

#import "/meta/sampler.typ"
#import sampler: repeatable

#let cards = incidence(p: 11)
#let rendered = ()

#let (colors_,colors) = repeatable(sampler.shuffle(palette.symbol-colors, size: 12))
#let (tilt_,tilt) = repeatable(sampler.angle())
#let (angles_,angles) = repeatable(sampler.sequence(sampler.angle(), size: 12))
#let (circles_,circles) = repeatable(sampler.fork(
  sampler.shuffle(layouts.at(0)),
  sampler.shuffle(layouts.at(1)),
  sampler.shuffle(layouts.at(2)),
  sampler.shuffle(layouts.at(3)),
))

#for c in cards.slice(0) {
  let cc = cetz.canvas({
    (colors_,colors) = colors_()
    (tilt_,tilt) = tilt_()
    (angles_,angles) = angles_()
    (circles_,circles) = circles_()
    card(scale-factor,
      //debug: true,
      edge: (cut: false, margin: false),
      symbols: c.map(n => nimi.nth(n)),
      circles: circles,
      angles: angles,
      colors: colors,
      global-tilt: tilt,
    )
  })
  box(cc, inset: 1pt)
  rendered.push(cc)
}