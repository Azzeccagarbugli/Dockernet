<p align="center">
    <img src ="https://imgur.com/SAVPZRb.png" />
</p>

Dockernet è un container **Docker** il quale contiene l'applicativo software **[UFONet](https://ufonet.03c8.net/)**, una BotNet, che sfrutta delle vulnerabilità presenti nel 7° livello OSI, pensata per attacchi informatici di natura DoS e DDoS.

---

# Idea e scopo

L'idea che c'è alla base di **Dockernet** è quella di utilizzare le potenzialità di **[Docker](https://it.wikipedia.org/wiki/Docker)**, progetto open-source che automatizza il deployment fornendo un'astrazione aggiuntiva grazie alla *virtualizzazione* a livello di Sistema Operativo di Linux, per creare in maniera semplice un ambiente isolato sul quale far girare UFONet. 

In questo modo viene incrementata **esponenzialmente l'accessibilià** a questo determinato applicativo software in quanto l'utente non dovrà preoccuparsi di installare le varie dipendenze richieste da quest'ultimo, ma dovrà semplicemente fare il  ```run ``` del container per accedere alla BotNet.

Fondamentalmente grazie a questa tecnologia è possibile virtualizzare un applicazione qualsiasi che sia **totalmente indipendente** dal Sistema Operativo sulla quale stia girando.

# Caratteristiche

Ovviamente le caratteristiche di base di UFONet non vengono influenzate in nessun modo, ed è quindi possibile andarle ad utilizzare come se si stesse lavorando su una classica shell. 

È anche possibile utilizzare la stessa interfaccia grafica messa a disposizione da UFONet per accedere più facilmente alle possibilità che esso offre. Per fare ciò basterà utilizzare il comando ```docker-machine ip``` che restituirà appunto un indrizzio IP. Una volta visualizzato sarà possibile visitarlo alla porta **9999** all'interno di un qualsivoglia browser e la *Mothership* salperà lontano nel vasto oceano della rete.

# Installazione

Dopo aver installato correttamente Docker, e sopratutto dopo aver verificato che il suo *deamon* sia attivo in background, si potrà procedere al download del container tramite il seguente comando, che non farà nient'altro che una *pull request* verso il **DockerHub** per ottenere l'immagine di UFONet richiesta:

```docker
docker run -d --name ufonet -p 9999:9999 alexandreoda/ufonet
```

A questo punto verranno eseguite una serie di operazioni, **in maniera automatica**, che porteranno al deploy instantaneo di UFONet, senza che l'utente si preoccupi delle varie dipendenze richieste. 

Fatto ciò si potrà accedere alla bash di UFONet mediante questo comando:

```docker
docker exec -ti ufonet /bin/bash
```

L'interfaccia grafica è stata pensata per essere attiva già di default, ma sarà possibile lanciare il seguente comando per verificare che il server Tor Proxy sia attivo e funzionante:

```bash
./ufonet --check-tor --proxy="http://127.0.0.1:8118"
```