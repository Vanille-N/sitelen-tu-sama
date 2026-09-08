#import "comb.typ"

#let incidence(p: 7) = {
  // There are p^3 points in the space, but remove the origin
  let pts = comb.crossprod(range(p), range(p), range(p))
  let _ = pts.remove(0)

  // quotient by an equivalence relation to get the projective plane points
  let scale(t, k) = t.map(v => calc.rem-euclid(k * v, p))
  let canonize(t) = range(1,p).map(k => scale(t, k)).sorted().at(0)
  pts = pts.map(canonize).sorted().dedup()

  // Then include a point on the line iff it is orthogonal
  let innerprod(x, y) = calc.rem-euclid(x.zip(y).map(((a,b),) => a*b).sum(), p)
  let imatrix = {
    for y in pts {
      (for (i,x) in pts.enumerate() {
        if innerprod(x, y) == 0 {
          (i,)
        } else { () }
      },)
    }
  }
  import "@preview/suiji:0.5.1"
  let rng = suiji.gen-rng(0)
  let (_, mx) = suiji.shuffle(rng, imatrix)
  mx
}

// Checking correctness
#let verify(p) = {
  let inc = incidence(p: p)
  // All cards have p+1 symbols
  for c in inc {
    assert(c.sorted().dedup().len() == p+1)
  }
  for c in inc {
    for x in inc {
      if c != x {
        assert((c+x).sorted().dedup().len() == 2 * (p+1) - 1)
      }
    }
  }
}

#verify(2)
#verify(3)
#verify(5)
#verify(7)
#verify(11)

#assert(incidence(p: 7).len() == 57)
#assert(incidence(p: 11).len() == 133)