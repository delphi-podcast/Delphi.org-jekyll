#!/bin/bash

# Configuration
DOMAIN="delphi.org"
WWW_DOMAIN="www.delphi.org"
GH_USER="delphiorg"
GH_TARGET="${GH_USER}.github.io."
TXT_CHALLENGE="_github-pages-challenge-${GH_USER}.${DOMAIN}"

# The 4 required GitHub IPs
EXPECTED_IPS="185.199.108.153 185.199.109.153 185.199.110.153 185.199.111.153"

# List of DNS Resolvers to check (Name:IP)
RESOLVERS=(
    "Directnic (Auth):ns0.directnic.com"
    "Google:8.8.8.8"
    "Cloudflare:1.1.1.1"
    "Quad9:9.9.9.9"
    "OpenDNS:208.67.222.222"
    "Level3:4.2.2.1"
    "Verisign:64.6.64.6"
    "Comodo:8.26.56.26"
    "DNS.WATCH:84.200.69.80"
    "AdGuard:94.140.14.14"
    "Control D:76.76.2.0"
)

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "Checking DNS propagation for ${YELLOW}${DOMAIN}${NC}..."
echo "--------------------------------------------------------------------------------"
printf "%-20s | %-14s | %-25s | %-10s\n" "Provider" "A Records" "WWW CNAME" "TXT Record"
echo "--------------------------------------------------------------------------------"

for item in "${RESOLVERS[@]}"; do
    NAME="${item%%:*}"
    IP="${item##*:}"

# 1. Check A Records
    # Capture stderr (2>&1) and use timeouts (+time=2)
    RAW_OUTPUT=$(dig @$IP $DOMAIN +short A +time=2 +tries=1 2>&1 | sort)

    # Filter output: Keep ONLY lines that look like IP addresses
    # This discards error messages like ";; connection timed out"
    CLEAN_IPS=$(echo "$RAW_OUTPUT" | grep -E '^[0-9.]+$' | tr '\n' ' ' | sed 's/ $//')
    
    # Sort and clean the expected IPs for strict comparison
    SORTED_EXPECTED=$(echo $EXPECTED_IPS | tr ' ' '\n' | sort | tr '\n' ' ' | sed 's/ $//')

    if [ "$CLEAN_IPS" == "$SORTED_EXPECTED" ]; then
        # Perfect Match
        A_STATUS="${GREEN}PASS (4/4)${NC}"

    elif [[ "$RAW_OUTPUT" == *";; connection timed out"* ]]; then
        # The raw output contained a timeout error
        A_STATUS="${YELLOW}TIMEOUT${NC}"

    elif [ -z "$CLEAN_IPS" ]; then
        # No IPs found (and not a timeout)
        A_STATUS="${RED}MISSING${NC}"
        
    else
        # IPs found, but they don't match the expected list perfectly
        # Now we count actual IPs, not error words
        COUNT=$(echo "$CLEAN_IPS" | wc -w)
        
        # If we found 0 real IPs (but maybe some garbage text), mark as Missing/Error
        if [ "$COUNT" -eq 0 ]; then
             A_STATUS="${RED}ERROR${NC}"
        else
             A_STATUS="${YELLOW}PARTIAL ($COUNT)${NC}"
        fi
    fi

    # 2. Check WWW CNAME
    CNAME_RECORD=$(dig @$IP $WWW_DOMAIN +short CNAME)
    
    if [ "$CNAME_RECORD" == "$GH_TARGET" ]; then
        CNAME_STATUS="${GREEN}PASS${NC}"
    elif [ -z "$CNAME_RECORD" ]; then
        CNAME_STATUS="${RED}MISSING${NC}"
    else
        CNAME_STATUS="${YELLOW}MISMATCH${NC}"
    fi

# 3. Check TXT Record
    # We add +time=2 to stop it from hanging
    # We add 2>&1 to capture error messages (like timeouts) into the variable
    TXT_RECORD=$(dig @$IP $TXT_CHALLENGE +short TXT +time=2 +tries=1 2>&1)

    # Sanitize: Remove quotes that dig sometimes adds around TXT strings
    CLEAN_TXT=$(echo "$TXT_RECORD" | tr -d '"')

    if [ -z "$CLEAN_TXT" ]; then
        # Result was completely empty
        TXT_STATUS="${RED}MISSING${NC}"
    
    elif [[ "$TXT_RECORD" == *";; connection timed out"* ]]; then
        # Specific dig timeout message
        TXT_STATUS="${YELLOW}TIMEOUT${NC}"

    elif [[ "$CLEAN_TXT" =~ ^[a-zA-Z0-9-]+$ ]]; then
        # Regex check: If it contains only letters, numbers, and dashes, it's our code
        TXT_STATUS="${GREEN}FOUND${NC}"
        
    else
        # It returned something unexpected (like an error code or garbage)
        # We print the first 15 chars so it fits the column
        TXT_STATUS="${YELLOW}${CLEAN_TXT:0:15}..${NC}"
    fi

    # Print Row
    printf "%-20s | %-25b | %-36b | %-21b\n" "$NAME" "$A_STATUS" "$CNAME_STATUS" "$TXT_STATUS"
done
echo "--------------------------------------------------------------------------------"