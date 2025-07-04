
# MIT License
# Copyright (c) 2025 Manuel Ricci
# See LICENSE file in the root of this repository for full license information.

#!/bin/bash
# File di origine (log di sistema)
LOG_SORGENTE="/var/log/auth.log"

# File di destinazione
LOG_DESTINAZIONE="logSSH"

# Crea/intestazione del file di logSSH
echo "LOG ACCESSI SSH - generato il $(date)" > "$LOG_DESTINAZIONE"
echo "==============================================" >> "$LOG_DESTINAZIONE"
echo "" >> "$LOG_DESTINAZIONE"

# Accessi riusciti
echo "[ACCESSI RIUSCITI]" >> "$LOG_DESTINAZIONE"
grep "sshd.*Accepted" "$LOG_SORGENTE" >> "$LOG_DESTINAZIONE"
echo "" >> "$LOG_DESTINAZIONE"

# Accessi falliti
echo "[ACCESSI FALLITI]" >> "$LOG_DESTINAZIONE"
grep "sshd.*Failed" "$LOG_SORGENTE" >> "$LOG_DESTINAZIONE"
echo "" >> "$LOG_DESTINAZIONE"

# Utenti non validi
echo "[TENTATIVI CON UTENTI NON VALIDI]" >> "$LOG_DESTINAZIONE"
grep "Invalid user" "$LOG_SORGENTE" >> "$LOG_DESTINAZIONE"
echo "" >> "$LOG_DESTINAZIONE"

# Fine
echo "Log salvato in: $(realpath "$LOG_DESTINAZIONE")"
