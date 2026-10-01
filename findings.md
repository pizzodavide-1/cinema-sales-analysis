Analisi e risultati
### Domanda 1 — Come si distribuiscono le vendite nel tempo?

### Andamento settimanale 
Metrica usata: biglietti venduti in media al giorno, per rendere confrontabili le settimane incomplete.

- Picco nella settimana del 26 marzo (circa 181.000 biglietti al giorno), il valore più alto del periodo.
- Calo graduale da aprile a inizio giugno, fino a circa 65.000 al giorno.
- Minimo stabile tra metà giugno e inizio luglio, intorno a 46.000 al giorno.
- Ripresa a luglio, oltre 110.000 al giorno a metà mese.
- Nuovo calo tra fine agosto e settembre, con un crollo nella settimana del 17 settembre (circa 5.700 al giorno).
- Ripresa a ottobre, intorno a 100.000 al giorno.
- Gli incassi seguono lo stesso andamento dei biglietti.
### Interpretazione (ipotesi)
L'andamento è coerente con il calendario iraniano del 2018: il picco coincide con il Nowruz(Capodanno iraniano), il calo di maggio-giugno con il Ramadan, il crollo di settembre con il periodo di particolari ricorrenze religiose.
Sono ipotesi coerenti con i dati, non dimostrate.
### Limiti
- Mancano 23 giorni, incluse due settimane intere (vedi `data_issues.md`).

### Giorno della settimana
Metriche usate: media dei totali giornalieri (biglietti e incassi) e prezzo medio del biglietto (incassi totali / biglietti totali).

- I giorni più forti sono giovedì e venerdì (circa 96.000 e 106.000 biglietti al giorno), i più deboli lunedì e domenica (circa 44.000 e 48.000), questo perchè il weekend Iraniano è giovedi-venerdi.
- Il martedì registra il maggior numero di biglietti in assoluto (circa 170.000 al giorno, quasi 4 volte il lunedì), ma con un prezzo medio del biglietto di circa la metà rispetto agli altri giorni,probabilmente una promozione.
- Nonostante il prezzo dimezzato, l'incasso medio del martedì è superiore a quello di lunedì, mercoledì, sabato e domenica, e di poco inferiore a giovedì e venerdì.

### Interpretazione (ipotesi)
- L'andamento è coerente con il weekend iraniano (giovedì-venerdì).
- Il prezzo dimezzato del martedì suggerisce una promozione fissa (sconto del martedì, diffuso nei cinema iraniani). La promozione sembra efficace: aumenta molto l'affluenza e mantiene un incasso superiore agli altri giorni feriali.
Limiti
- Non è possibile stabilire quanta parte del pubblico del martedì sia pubblico nuovo e quanta si sia solo spostata da altri giorni: l'effetto reale della promozione potrebbe essere inferiore a quello osservato.

### Media giornaliera per mese 

- Aprile è il mese più forte (circa 138.000 biglietti al giorno).
- Marzo è secondo (circa 100.000), ma i dati coprono solo gli ultimi 18 giorni (coincidenti con la festa già citata sopra): il valore è probabilmente sovrastimato rispetto al mese intero.
- Maggio, luglio e agosto sono su livelli simili (circa 92.000–98.000 al giorno),ma con tutti i giorni presenti,quindi sono da considerare migliori rispetto a Marzo
- Giugno e settembre sono i mesi più deboli (circa 45.000 e 38.000), meno di un terzo di aprile.
- Il prezzo medio del biglietto varia di circa il 25% nel corso dei mesi

### Interpretazione (ipotesi)
Il quadro mensile conferma quello settimanale: i mesi più deboli coincidono con il Ramadan (giugno) e con il periodo di altre ricorrenze religiose (settembre).
Limiti
- Febbraio (2 giorni, circa 135 biglietti al giorno) è escluso dai confronti: il dato non è rappresentativo e riflette probabilmente l'avvio della raccolta dati.
- Novembre (4 giorni) stesso discorso
- La variazione del prezzo medio non viene interpretata per ora.

### Concentrazione degli incassi

- Il cinema 448 genera da solo il 12,2% dell'incasso totale, più del doppio del secondo (5,8%).
- I primi 10 cinema per incassi (4% dei cinema) generano il 41% dell'incasso; i primi 16 (6,5%) superano il 50%; i primi 54 (22%) arrivano all'80%: la distribuzione segue la regola dell'80/20, cioè il 20% dei cinema genera l'80% degli incassi della catena del cinema.
- La metà meno redditizia dei cinema (123) genera circa il 4,5% dell'incasso totale.

### Interpretazione
- Il business è fortemente concentrato: la catena dipende da un numero ridotto di cinema, e in particolare dal 448. Questo rappresenta un rischio da monitorare.
- I cinema della coda andrebbero valutati incrociando gli incassi con i costi di gestione, non disponibili in questo dataset: un incasso basso non implica necessariamente una perdita.
### Limiti
- Il dataset non contiene costi: non è possibile valutare la redditività dei singoli cinema, ma solo il loro contributo agli incassi.
- Alcuni cinema sono presenti solo per una parte del periodo; il loro contributo è sottostimato rispetto a un periodo completo.

### Domanda 3  Quali cinema si riempiono di più e quali restano vuoti?
 Occupazione per cinema 
Metrica: occupazione ponderata = biglietti venduti / capienza × 100, calcolata solo sulle righe con capienza disponibile. Inclusi 233 cinema con almeno 30 giorni di attività.

- L'occupazione è bassa in tutta la catena: il cinema,usando la mediana, si ferma intorno al 12% (circa 9 posti su 10 restano vuoti).
- Solo due cinema superano il 50%: il 390 (61%) e il 474 (58%), entrambi con circa 17 proiezioni al giorno.
- I cinema con più incassi sono anche tra i più efficienti: il 448 è terzo per occupazione (48%) con oltre 72 proiezioni al giorno; anche 304 e 163 sono nella parte alta.
- Circa 100 cinema sono sotto il 10% di occupazione.
- Diversi cinema hanno molte proiezioni e sale quasi vuote: es. 88 (19 proiezioni al giorno, 3,5%), 94, 204, 61 e 170 (oltre 11 proiezioni al giorno, meno del 2%).

### Interpretazione e possibili azioni
- Nei cinema con molte proiezioni e occupazione molto bassa, ridurre il numero di spettacoli è l'intervento più immediato,in modo da salvaguardare denaro ed energia.
- Nei cinema più pieni (390, 474) si potrebbe valutare un aumento delle proiezioni, ma solo se alcuni spettacoli risultano già vicini al tutto esaurito (non verificato).
- Per i cinema sotto il 10%, eventuali decisioni più drastiche richiedono dati sui costi di gestione, non disponibili.

### Limiti
- L'occupazione dipende da `capacity`, colonna calcolata e non del tutto affidabile (vedi `data_issues.md`).
- Esclusi i cinema con meno di 30 giorni di attività.


###  incasso e occupazione 
Metriche: incasso medio giornaliero e occupazione ponderata. Confine tra "alto" e "basso": mediana (circa 10,3 milioni al giorno di incasso; 11,4% di occupazione). Inclusi 233 cinema con almeno 30 giorni di attività.

| Gruppo | Incasso | Occupazione | Cinema |
|--------|---------|-------------|--------|
| Punti di forza | alto | alta | 86 |
| Potenziale non sfruttato | alto | bassa | 31 |
| Piccoli ma pieni | basso | alta | 31 |
| Da analizzare | basso | bassa | 85 |

- Più di due terzi dei cinema sono nei due gruppi "coerenti": incasso e occupazione vanno quasi sempre insieme. I cinema che incassano di più sono anche quelli che riempiono meglio le sale.
- Nessuno dei primi 10 cinema per incasso è nel gruppo "Potenziale non sfruttato".
- Il gruppo "Potenziale non sfruttato" è formato soprattutto da cinema di media grandezza (circa 12–40 milioni al giorno), con molte proiezioni (tipicamente 11–24 al giorno) e occupazione tra il 5% e l'11%. I casi più marcati: 88 (19 proiezioni al giorno, 3,5%), 162 (3,6%), 33 (4,6%), 144 e 56 (oltre 21 proiezioni, meno del 7%).

### Interpretazione e possibili azioni
- I cinema "Potenziale non sfruttato" hanno una base di pubblico, ma la distribuiscono su troppi spettacoli. Concentrare la programmazione su meno proiezioni, nei giorni e negli orari più forti (giovedì, venerdì, martedì con lo sconto), potrebbe aumentare l'occupazione senza ridurre in modo significativo l'incasso, abbassando i costi per spettacolo.
- I cinema "Piccoli ma pieni" potrebbero avere una domanda superiore all'offerta: da valutare un aumento delle proiezioni nei giorni di picco.
- I cinema "Da analizzare" richiedono il confronto con i costi di gestione prima di qualsiasi decisione.

### Limiti
- La mediana è un confine arbitrario: i cinema vicini al confine (es. 266 e 51, occupazione intorno all'11%) non sono sostanzialmente diversi da quelli appena oltre. Le priorità vanno date ai cinema lontani dal confine.
- L'occupazione dipende da `capacity`, colonna non del tutto affidabile.