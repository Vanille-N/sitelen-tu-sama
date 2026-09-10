#import "/meta/palette.typ": cc
#import "/meta/pona.typ": sp, unsp

#let flag = "de"

#let main-title = [Was ist das?]

#let intro = [
Du hältst ein Exemplar des Spiels
"#sp(cc("o"))[sitelen tu sama]" (sitelen tu sama),
entwickelt von #sp(cc("g"))[jan [Newen]] (Newen). \
Dieses Spiel ist eine Version von #unsp(cc("r"))["Dobble"],
die die Toki-Pona-Hieroglyphen verwendet. \
\
Wie im Originalspiel suchst du das eine
Symbol, das auf zwei beliebigen Karten vorkommt
(Farbe, Größe und Ausrichtung können variieren),
und musst seinen Namen als Erster sagen. \
\
Eine Liste aller Symbole des Spiels (mit einer ungefähren Übersetzung)
findest du hier, sortiert nach visuell erkennbaren Merkmalen. 
Viel Spaß!
]

#let class-title = [Klassifizierung der Symbole]
#let class-intro = [
  Um Ihnen bei der Identifizierung eines Symbols zu helfen,
  wurde diese Liste danach gegliedert,
  ob die Symbole *getrennte Elemente*,
  *Punkte*, *umschlossene Flächen* und *geschwungene Linien* enthalten.
  Insgesamt gibt es 133 davon.
]

#let plural(n, alt) = if n == 1 { "" } else { alt }

#let element(nb) = [Element#plural(nb, "e")]
#let dot(nb) = [Punkt#plural(nb, "e")]
#let area(nb) = [Fläche#plural(nb, "n")]
#let curve(has) = {
if has { [gekrümmte Linien] } else { [keine Kurven] }
}

#let copyright = [
Sämtliches Text- und Bildmaterial des Spiels ist unter
`github:vanille-n/sitelen-tu-sama` verfügbar
und unter der Creative-Commons-Lizenz BY-NC-SA lizenziert. 
Du darfst das Material frei weitergeben und verändern,
solange Kopien und daraus abgeleitete Werke unter denselben Bedingungen
lizenziert werden, die ursprüngliche Quelle
("jan Newen \<jan-Newen#"@"crans.org>") angegeben wird
und das Material nicht für kommerzielle Zwecke verwendet wird.
]

#let translated = (
  a: [Bestätigung],
  akesi: [Reptil],
  ala: [nicht, Null],
  alasa: [jagen, suchen],
  ale: [alles],
  anpa: [Unterteil, abwärts],
  ante: [anders, verändern],
  anu: [oder],
  awen: [bewarhen, bleiben],
  e: [spezifiziert ein Object],
  en: [und],
  esun: [Transaktion, tauschen],
  ijo: [Ding],
  ike: [schlecht],
  ilo: [Maschine],
  insa: [Inhart, mittig],
  jaki: [Abfall, eklig],
  jan: [Leute],
  jelo: [Gelb],
  jo: [haben, tragen],
  kala: [Fisch],
  kalama: [laut, Geräusch],
  kama: [kommend],
  kasi: [Pflanze],
  ken: [möglich],
  kepeken: [etwas benutzen],
  kili: [Frucht],
  kiwen: [Stein, hart],
  ko: [Paste],
  kulupu: [Gruppe],
  kute: [Orh, hören],
  lape: [schlafen],
  laso: [Blau, Grűn],
  lawa: [Kopf, fűhren],
  len: [Kleidung],
  lete: [kalt],
  linja: [langes, Haar],
  lipu: [Papier, flach],
  loje: [Rot],
  lon: [real, auf],
  luka: [Hand],
  lukin: [Sicht, sehen],
  lupa: [Tűr],
  ma: [Erde, Land],
  mama: [Elternteil],
  mani: [Geld],
  meli: [Frau],
  mi: [ich],
  mije: [Mann],
  moku: [essen],
  moli: [Tod],
  monsi: [hinten],
  mu: [Tiergeräusche],
  mun: [Mond],
  musi: [Spiel, lustig],
  mute: [viel],
  nanpa: [Nummer],
  nasa: [seltsam, betrunken],
  nasin: [Weg],
  nena: [Berg],
  ni: [dies],
  noka: [Fuß],
  o: [Befehle],
  olin: [lieben],
  open: [Anfang, őffnen],
  pakala: [Fehler, kaputt],
  pali: [Arbeit, machen],
  palisa: [Stock, lang],
  pan: [Brot],
  pana: [geben],
  pilin: [Herz, gefűhlt],
  pimeja: [Schwarz],
  pini: [Schluss, beenden],
  pipi: [Insekt],
  poka: [nah],
  poki: [Box],
  pona: [gut, einfach],
  seli: [warm, heiß],
  selo: [Schale, äußeres],
  seme: [was],
  sewi: [Himmel, Gott],
  sijelo: [Kőrper],
  sike: [Rad, rund],
  sin: [neu, frisch],
  sitelen: [Symbol, schreiben],
  sona: [Wissen],
  soweli: [Tier],
  suli: [groß],
  suno: [Sonne, hell],
  supa: [horizontal],
  suwi: [sűß],
  tan: [verursachen, von],
  taso: [aber, nur],
  tawa: [bewegen],
  telo: [Wasser, flűssig],
  tenpo: [Zeit],
  toki: [Sprache, sprechen],
  tomo: [Haus],
  tonsi: [nichtbinär],
  tu: [zwei],
  unpa: [sexuell],
  uta: [Mund],
  utala: [Kampf, aggressiv],
  walo: [Weiß],
  wan: [eins],
  waso: [Vogel],
  wawa: [stark, energisch],
  weka: [weg],
  wile: [Wunsch, wollen],
  monsuta: [Monster, Angst],
  jasima: [Spiegel, symmetrisch],
  kiki: [spitz],
  soko: [Pilz],
  oke: [okay],
  misikeke: [medizin],
  oko: [Auge],
  unu: [Violett],
  kule: [Farbe],
  konwe: [automatisch, lebend],
  teje: [rechts],
  lanpan: [stehlen],
  kin: [außerdem],
  leko: [Quadrat],
  wa: [Verwunderung],
  wekama: [zurückkommen],
  meso: [Mitte],
  linluwi: [Netzwerk, Verbindung],
  kijetesantakalu: [Waschbär],
  kipisi: [schneiden],
  majuna: [alt],
  nimisin: [neues Wort],
  kokosila: [nicht toki pona],
  usawi: [magisch],
  namako: [Gewürz, extra],
  apeja: [Schande, ablehnen],
  nja: [miauen],
  epiku: [episch],
)

