#import "@preview/suiji:0.5.1"

/// Takes a generator function and wraps it
/// so that it can be called multiple times
#let repeatable(func, reseed-intv: 0, seeds: (0,)) = {
  let rng = suiji.gen-rng(seeds.at(0))
  let next(rng,num,seed-idx) = () => {
    let seed-idx = seed-idx
    let rng = rng
    let num = num
    if num > 0 and num == reseed-intv {
      seed-idx = calc.rem(seed-idx + 1, seeds.len())
      rng = suiji.gen-rng(seeds.at(seed-idx))
      num = 0
    } 
    let (rng, ans) = func(rng)
    (next(rng,num+1,seed-idx), ans)
  }
  (next(rng,0,0), none)
}

/// Uniform sampling of angles
#let angle() = (rng) => {
  let (rng, alpha) = suiji.integers(rng, low: 0, high: 360)
  (rng, alpha * 1deg)
}

#{
  let (angle, alpha) = repeatable(angle())
  for _ in range(20) {
    (angle, alpha) = angle()
    [#alpha, ]
  }
}

/// Sampling of shuffled arrays of unique elements
/// extracted from a larger set of possible values
#let shuffle(array, size: auto) = (rng) => {
  let (rng, arr) = suiji.shuffle(rng, array)
  let sized = if size != auto {
    arr.slice(0, size)
  } else {
    arr
  }
  (rng, sized)
}

#{
  let (shuffle, array) = repeatable(shuffle(range(20), size: 5))
  for _ in range(20) {
    (shuffle, array) = shuffle()
    [#array, ]
  }
}

/// Lift sampler to arrays
#let sequence(gen, size: 1) = (rng) => {
  let arr = ()
  let val = none
  for _ in range(size) {
    (rng, val) = gen(rng)
    arr.push(val)
  }
  (rng, arr)
}

#{
  let (sequence, seq) = repeatable(sequence(angle(), size: 5))
  for _ in range(20) {
    (sequence, seq) = sequence()
    [#seq, ]
  }
}

/// Pick randomly between different elements
#let choice(..elts) = (rng) => {
  let elts = elts.pos()
  let (rng, elt) = suiji.choice(rng, elts)
  (rng, elt)
}

/// Pick randomly between different samplers
#let fork(..gens) = (rng) => {
  let gens = gens.pos()
  let (rng, num) = suiji.integers(rng, low: 0, high: gens.len())
  let (rng, ans) = gens.at(num)(rng)
  (rng, ans)
}

#{
  let (choice_,choice) = repeatable(fork(angle(), shuffle(range(3))))
  for _ in range(20) {
    (choice_,choice) = choice_()
    [#choice, ]
  }
}

/// Pick a random size between two bounds
#let size(min, max) = (rng) => {
  assert(min < max)
  let min = int(calc.ceil(min / 1pt))
  let max = int(calc.floor(max / 1pt))
  let (rng, num) = suiji.integers(rng, low: min, high: max)
  (rng, num * 1pt)
}
