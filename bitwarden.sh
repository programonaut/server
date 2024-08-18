if [[ echo $0 | sed "s/-//g" -ne "bash" ]]
then
    read "BITWARDEN_SERVER?Enter your bitwarden server [bitwarden.com]: "
    BITWARDEN_SERVER=${BITWARDEN_SERVER:-bitwarden.com}

    read "BITWARDEN_EMAIL?Enter your email: "
    BITWARDEN_EMAIL=${BITWARDEN_EMAIL}
else
    read -p "Enter your bitwarden server [bitwarden.com]: " BITWARDEN_SERVER
    BITWARDEN_SERVER=${BITWARDEN_SERVER:-bitwarden.com}

    read -p "Enter your email: " BITWARDEN_EMAIL
    BITWARDEN_EMAIL=${BITWARDEN_EMAIL}
fi


bw config server ${BITWARDEN_SERVER}
if [[ $BW_SESSION == "" ]]
then
    export BW_SESSION=$(bw login ${BITWARDEN_EMAIL} --raw)
    export BW_SESSION=$(bw unlock --raw)
fi