# CopyParty Home Assistant Addon

Questo addon per Home Assistant installa e configura [CopyParty](https://github.com/9001/copyparty), un server di condivisione file e sincronizzazione.

## Descrizione

CopyParty è un server web leggero e versatile che permette di condividere file e cartelle attraverso un'interfaccia web. Supporta funzionalità come:
- Condivisione file e cartelle
- Sincronizzazione file
- Accesso protetto con utenti e password
- Interfaccia web responsive

## Installazione

1. Aggiungi il repository dell'addon a Home Assistant
2. Installa l'addon "CopyParty"
3. Configura le opzioni desiderate
4. Avvia l'addon

## Configurazione

L'addon può essere configurato attraverso l'interfaccia di Home Assistant con le seguenti opzioni:

- `log_level`: Livello di log dell'addon (default: info)
- `shared_folders`: Lista delle cartelle da condividere (default: [/share/copyparty/data])
- `config_folder`: Cartella dove salvare il file di configurazione (default: /share/copyparty/config)
- `admin_user`: Nome utente dell'amministratore (default: admin)
- `admin_password`: Password dell'amministratore (default: password)

## Utilizzo

Dopo l'avvio dell'addon, l'interfaccia web di CopyParty sarà accessibile in due modi:

1. Direttamente all'indirizzo: `http://<home_assistant_ip>:8080`
2. Attraverso ingress (se abilitato): `http://<home_assistant_ip>:<port>/addon/<slug>/`

Puoi accedere con le credenziali dell'utente admin configurate nelle opzioni dell'addon.

## Testing

Per testare l'addon:

1. Aggiungi il repository dell'addon a Home Assistant
2. Installa l'addon "CopyParty"
3. Configura le opzioni desiderate
4. Avvia l'addon
5. Accedi all'interfaccia web attraverso uno dei due metodi sopra descritti
6. Verifica che le cartelle configurate siano accessibili e modificabili

## Note

- Le cartelle condivise devono essere accessibili da Home Assistant (es. /share, /config, /media)
- Il file di configurazione viene generato automaticamente al primo avvio se non esiste
- Le modifiche ai file condivisi saranno sincronizzate con le cartelle di Home Assistant
- L'immagine Docker viene costruita localmente dal Dockerfile incluso nell'addon, non viene scaricata da un registry esterno