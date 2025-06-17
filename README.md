# 2FA-on-SSH-Linux
# 🔐 SSH con Autenticazione a Due Fattori (2FA) su Linux

Questo progetto dimostra come configurare l'autenticazione a due fattori (2FA) per connessioni SSH su un sistema Linux, utilizzando **Google Authenticator**.  
È una guida pratica pensata per migliorare la sicurezza dei tuoi server Linux.

## 🛠️ Requisiti

- Distribuzione Linux (Debian, Ubuntu o compatibile)
- Accesso root o sudo
- Connessione SSH attiva
- Applicazione per OTP (es. Google Authenticator, Authy)

## 📦 Installazione

1. **Aggiorna i pacchetti:**
   sudo apt update && sudo apt upgrade -y
   
Installa Google Authenticator PAM:
sudo apt install libpam-google-authenticator -y

Configura l'utente per 2FA:
google-authenticator
Rispondi "sì" alle domande per abilitare il 2FA.

Modifica PAM per SSH:
sudo nano /etc/pam.d/sshd

Aggiungi in alto (dopo eventuali commenti):
auth required pam_google_authenticator.so


Abilita l'autenticazione tramite challenge-response:
sudo nano /etc/ssh/sshd_config

E assicurati che queste direttive siano presenti:
ChallengeResponseAuthentication yes
UsePAM yes

Riavvia il servizio SSH:
sudo systemctl restart ssh
✅ Verifica

Effettua una connessione SSH:
ssh utente@ip_del_server
Dopo l’inserimento della password, ti verrà chiesto di inserire il codice OTP generato dall’app.

📺 Video dimostrativo
Guarda il video dimostrativo su YouTube:
https://youtu.be/5_btNtWLytM 🎥 
