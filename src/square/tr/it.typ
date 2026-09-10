#import "/meta/palette.typ": cc
#import "/meta/pona.typ": sp, unsp

#let flag = "it"

#let main-title = [Che cos'è?]

#let intro = [
Questa è una copia del gioco
"#sp(cc("o"))[sitelen tu sama]" (sitelen tu sama),
realizzato da #sp(cc("g"))[jan [Newen]] (Newen). 
Questo gioco è una versione di #unsp(cc("r"))["Dobble"],
che utilizza come simboli dei geroglifici del toki pona. \
\
Come nel gioco originale, cerca l’unico
simbolo comune a ogni coppia di carte
(il colore, le dimensioni e l’orientamento possono variare),
e sii il primo ad annunciarlo per aggiudicarti la carta. \
\
Qui trovi un elenco (con traduzione)
di tutti i simboli del gioco, ordinati in base
alle loro caratteristiche visive. 
Buon divertimento!
]

#let class-title = [Classificazione dei simboli]
#let class-intro = [
Per aiutarti a identificare un simbolo sconosciuto,
i simboli sono stati classificati in base alla presenza di
*elementi disconnessi*, *aree chiuse*, *punti* e *linee curve*.
In totale sono 133.
]

#let plural(n, default, alt) = if n == 1 { default } else { alt }

#let element(nb) = [element#plural(nb, "o", "i")]
#let dot(nb) = [punt#plural(nb, "o", "i")]
#let area(nb) = [are#plural(nb, "a", "e") chius#plural(nb, "a", "e")]
#let curve(has) = {
if has { [linee curve] } else { [senza curve] }
}

#let copyright = [
Tutti i materiali testuali e grafici del gioco
sono disponibili su `github:vanille-n/sitelen-tu-sama`
e sono distribuiti con licenza Creative Commons BY-NC-SA. 
Puoi distribuirli e modificarli liberamente, purché
le copie e le opere derivate siano distribuite alle stesse condizioni,
venga citata la fonte originale
("jan Newen \<jan-Newen#"@"crans.org>"),
e non vengano utilizzati per scopi commerciali.
]

#let translated = (
epiku: [epico, incredibile],
namako: [spezia, extra],
apeja: [vergogna, esclusione],
nja: [miao],
sona: [conoscenza, sapere],
kalama: [suono, rumore],
toki: [parlare, lingua],
majuna: [vecchio, antico],
nimisin: [parola nuova],
kokosila: [non toki pona],
usawi: [magia, magico],
pana: [dare, mandare],
weka: [andarsene, sparire],
linluwi: [collegamento, rete],
seli: [calore, fuoco],
kijetesantakalu: [procione],
soweli: [mammifero, bestia],
sitelen: [disegno, scrittura],
akesi: [rettile],
mute: [molti],
meso: [mezzo, centro],
moli: [morte],
wawa: [forza, potenza],
pipi: [insetto],
waso: [uccello, volare],
kulupu: [gruppo],
wekama: [ritornare],
kipisi: [tagliare, dividere],
sin: [nuovo, giovane],
pan: [pane, cereale],
suwi: [dolce, carino],
anpa: [in basso, sotto],
lon: [su, a, esistere],
teje: [destra],
meli: [donna],
uta: [bocca],
seme: [domanda],
insa: [interno, dentro],
lukin: [guardare, vedere],
lanpan: [rubare],
poka: [lato, accanto],
mu: [verso animale],
a: [enfasi, esclamazione],
e: [marcatore dell'oggetto],
wa: [stupore],
sewi: [cielo, alto, dio],
tu: [due],
o: [imperativo],
telo: [acqua, liquido],
ante: [diverso, altro],
kute: [orecchio, ascoltare],
mije: [uomo],
leko: [quadrato],
sike: [cerchio],
kin: [inoltre, anche],
tenpo: [tempo],
ala: [negazione, non],
awen: [restare, rimanere],
nasin: [strada, metodo],
pini: [finito, chiuso],
selo: [pelle, guscio],
suli: [grande],
taso: [solo, ma],
utala: [combattimento, violenza],
monsuta: [spaventoso, paura],
anu: [o],
lete: [freddo],
ni: [questo, quello],
poki: [contenitore, scatola],
sijelo: [corpo, contenuto],
supa: [tavolo],
tawa: [andare, diventare],
wan: [uno],
ken: [potere, possibilità],
luka: [mano],
monsi: [dietro, parte posteriore],
noka: [piede, gamba],
wile: [volere, avere bisogno],
pona: [buono, facile],
linja: [linea, filo],
lupa: [buco],
nasa: [strano, bizzarro],
tan: [da, perché],
jasima: [riflesso, simmetria],
kiwen: [pietra, duro],
lipu: [documento, foglio],
tomo: [casa, edificio],
walo: [bianco],
len: [tessuto, abbigliamento],
open: [aprire, iniziare],
kiki: [appuntito, acuminato],
nanpa: [numero],
ijo: [cosa, oggetto],
jo: [tenere, avere],
kili: [frutta, verdura],
lape: [dormire, riposare],
mi: [io, me],
mun: [luna],
palisa: [bastone, bacchetta],
suno: [sole, luminoso],
tonsi: [non binario],
jan: [persona],
kala: [pesce, nuotare],
ko: [pasta, morbido, malleabile],
mani: [prezioso, denaro],
moku: [mangiare, cibo],
pali: [lavorare, fare],
pilin: [sentire, sentimento],
soko: [fungo, muffa],
oke: [okay],
alasa: [cacciare, cercare],
esun: [commercio, vendere],
jelo: [giallo],
kepeken: [usare, utilizzare],
lawa: [testa, capo],
mama: [genitore, creare],
olin: [amore],
misikeke: [medicina, farmaco],
konwe: [vivo, automatico],
ale: [tutto],
ilo: [strumento, attrezzo],
kasi: [pianta],
kule: [colore],
loje: [rosso],
musi: [divertimento],
pakala: [rotto, errore],
oko: [occhio],
unu: [viola],
jaki: [disgustoso],
ma: [terra, paese],
unpa: [sesso],
laso: [blu, verde],
pimeja: [nero],
)

