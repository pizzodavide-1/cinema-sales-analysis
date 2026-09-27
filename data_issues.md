Dataset ha 142.524 righe dal 21/02/2018 al 04/11/2018

I problemi su dati anomali/mancanti riguardano circa 500 righe che corrispondono circa allo 0,4% del dataset,quindi una cifra irrisoria.

106 righe sono duplicate:si terrà una solo copia e si elimineranno le altre
I valori NULL in occu_perc e capacity,nelle stesse righe: si tengono le righe,ma ignorate sulle analisi sulla capacità.
occu_perc fuori dall intervallo 0-100 in 164 righe e si imposta a questi valori impossibili NULL
In 54 righe c'è come valore di capacity -2,indicante la mancanza del dato: verrà impostato a NULL.
In 61 casi c'è ticket_use negativo: si eliminano le righe vista la centralità del dato.

NOTE/ASSUNZIONI:
Il dataset dovrebbe provenire dall'Iran,per questo ci sono valori cosi elevati ai prezzi,basati su una specifica valuta;
la capacity sembra essere una colonna calcolata dal rapporto tra biglietti venduti e occupazione
1 riga= 1 film in 1 saka in 1 giorno

Giorni mancanti
Mancano 23 giorni: il 22 febbraio, dal 24 febbraio al 13 marzo, il 4 e il 6 giugno, il 19 e il 20 settembre.
Di conseguenza le settimane del 26 febbraio e del 5 marzo sono assenti del tutto, e altre quattro settimane sono incomplete.

Ipotesi (non verificabili con i dati disponibili):
- 4 e 6 giugno, 19 e 20 settembre: probabili chiusure in corrispondenza di ricorrenze religiose del calendario iraniano (Ramadan, Tasua e Ashura).
- 24 febbraio – 13 marzo: probabile interruzione nella raccolta dei dati.
