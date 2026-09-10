#import "/meta/palette.typ": cc
#import "/meta/pona.typ": sp, unsp

#let flag = "fr"

#let main-title = [C'est quoi ce truc ?]

#let intro = [
  Vous tenez un exemplaire du jeu "#sp(cc("o"))[sitelen tu sama]" \
  (sitelen tu sama), produit par #sp(cc("g"))[jan [Newen]] (Newen). \
  Ce jeu est une version du #unsp(cc("r"))["Dobble" / "Spot-it"]
  qui utilise comme symboles des hiéroglyphes toki pona. \
  \
  Comme dans le jeu d'origine, cherchez le symbole
  unique commun à n'importe quelle paire de cartes
  (la couleur, la taille, et l'orientation varient),
  et annoncez-le avant les autres pour gagner la carte. \
  \
  Une liste (et traduction) de tous les symboles du jeu
  est fournie, triée par élément visuels identifiables.
  Amusez-vous bien !
]

#let class-title = [Classification des symboles]
#let class-intro = [
  Pour vous aider à identifier un symbole,
  cette liste a été organisée selon
  si les symboles ont des *élément déconnectés*,
  des *points*, des *zones fermées*, et des *lignes courbes*.
  Il y en a 133 en tout.
]

#let plural(n) = if n == 1 { "" } else { "s" }

#let element(nb) = [élément#plural(nb)]
#let dot(nb) = [point#plural(nb)]
#let area(nb) = [zone#plural(nb) fermée#plural(nb)]
#let curve(has) = {
  if has { [traits courbés] } else { [traits droits] }
}

#let copyright = [
  Tous les éléments textuels et graphiques du jeu sont
  disponibles gratuitement sur le dépôt `github:vanille-n/sitelen-tu-sama`,
  et licensés sous Creative Commons BY-NC-SA. \
  Vous êtes libres de les modifier et de les distribuer,
  à condition de ne pas changer la license, de citer l'auteur
  d'origine ("jan Newen \<jan-Newen#"@"crans.org>"),
  et uniquement à des fins non commerciales.
]

#let translated = (
  epiku: [épique, incroyable],
  namako: [épice, ajout],
  apeja: [honte, exclusion],
  nja: [miaou],
  sona: [savoir, connaissance],
  kalama: [bruit, son],
  toki: [parole, langage],
  majuna: [vieux],
  nimisin: [nouveau mot],
  kokosila: [pas toki pona],
  usawi: [magique],
  pana: [donner, émettre],
  weka: [partir, retirer],
  linluwi: [lien, réseau],
  seli: [chaleur, feu],
  kijetesantakalu: [raton],
  soweli: [animal],
  sitelen: [dessin, écriture],
  akesi: [reptile],
  mute: [beaucoup],
  meso: [au milieu],
  moli: [mort],
  wawa: [puissant],
  pipi: [insecte],
  waso: [oiseau],
  kulupu: [groupe],
  wekama: [revenir],
  kipisi: [couper, diviser],
  sin: [nouveau, jeune],
  pan: [pain],
  suwi: [doux, sucré],
  anpa: [en bas, dessous],
  lon: [sur],
  teje: [droite],
  uta: [bouche],
  seme: [question],
  insa: [intérieur],
  lukin: [regarder],
  lanpan: [voler, dérober],
  poka: [à côté],
  mu: [bruit d'animal],
  a: [exclamation],
  e: [marque du COD],
  wa: [émerveillement],
  meli: [femme],
  sewi: [ciel, haut, dieu],
  tu: [deux],
  o: [impératif],
  telo: [eau, liquide],
  ante: [différent, changer],
  kute: [écouter, oreille],
  mije: [homme],
  leko: [carré],
  sike: [cercle],
  kin: [en plus],
  tenpo: [temps],
  ala: [négation],
  awen: [rester],
  nasin: [chemin, technique],
  pini: [fermé, terminé],
  selo: [peau, coquille],
  suli: [grand],
  taso: [sauf, seulement],
  utala: [guerre, violence],
  monsuta: [peur, effrayant],
  anu: [ou],
  lete: [froid],
  ni: [ceci],
  poki: [boîte],
  sijelo: [corps, contenu],
  supa: [table],
  tawa: [vers, se déplacer],
  wan: [un],
  ken: [être capable de],
  luka: [main],
  monsi: [derrière],
  noka: [jambe, pied],
  wile: [vouloir],
  pona: [bien],
  linja: [fil, ligne],
  lupa: [trou],
  nasa: [étrange],
  tan: [car, venant de],
  jasima: [miroir, symétrie],
  kiwen: [pierre, dur],
  lipu: [plat, feuille, document],
  tomo: [maison, bâtiment],
  walo: [blanc],
  len: [tissu, vêtement],
  open: [ouvrir, commencer],
  kiki: [pointu],
  nanpa: [nombre],
  ijo: [chose],
  jo: [tenir, porter],
  kili: [fruit, légume],
  lape: [dormir],
  mi: [moi],
  mun: [lune],
  palisa: [bâton, baguette],
  suno: [soleil],
  tonsi: [non-binaire],
  jan: [personne],
  kala: [poisson, nager],
  ko: [pâte, mou],
  mani: [cher, argent],
  moku: [manger],
  pali: [travailler, fabriquer],
  pilin: [sentiment],
  soko: [champignon],
  oke: [ok],
  alasa: [chasser, chercher],
  esun: [commerce],
  jelo: [jaune],
  kepeken: [utiliser],
  lawa: [tête, gouverner],
  mama: [parent],
  olin: [aimer],
  misikeke: [médicament],
  konwe: [automatique, vivant],
  ale: [tout],
  ilo: [outil],
  kasi: [plante],
  kule: [couleur],
  loje: [rouge],
  musi: [amusant],
  pakala: [casser],
  oko: [oeil],
  unu: [violet],
  jaki: [dégoûtant],
  ma: [terre],
  unpa: [sexe],
  laso: [bleu, vert],
  pimeja: [noir],
)

