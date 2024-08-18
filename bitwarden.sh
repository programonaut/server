TMP=$(echo $0 | sed "s/-//g")
echo "Current shell: $TMP"

if [[ $(echo $0 | sed "s/-//g") == "bash" ]]
then
    echo "bash"
    read -p "Enter your bitwarden server [bitwarden.com]: " BITWARDEN_SERVER
    BITWARDEN_SERVER=${BITWARDEN_SERVER:-bitwarden.com}

    read -p "Enter your email: " BITWARDEN_EMAIL
    BITWARDEN_EMAIL=${BITWARDEN_EMAIL}
else
    echo "zsh"
    read "BITWARDEN_SERVER?Enter your bitwarden server [bitwarden.com]: "
    BITWARDEN_SERVER=${BITWARDEN_SERVER:-bitwarden.com}

    read "BITWARDEN_EMAIL?Enter your email: "
    BITWARDEN_EMAIL=${BITWARDEN_EMAIL}
fi


bw config server ${BITWARDEN_SERVER}
if [[ $BW_SESSION == "" ]]
then
    export BW_SESSION=$(bw login ${BITWARDEN_EMAIL} --raw)
    export BW_SESSION=$(bw unlock --raw)
fi