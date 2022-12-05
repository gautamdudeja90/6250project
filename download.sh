  #ENV vars
GREEN='\033[1;32m'
NC='\033[0m'

#Checking for relevant commands
if ! command -v wget &> /dev/null
then
    echo "${GREEN}wget could not be found - terminating${NC}"
    exit
fi

if [[ "$1" == "" ]]; then
    echo "${GREEN}Script that downloads all relevant files."
    echo
    echo "Flags [-o|c]"
    echo "options:"
    echo "o     Download the FULL orbda dataset"
    echo "c     Download pre-setup CSV"
    echo "${NC}"
fi

if [[ "$1" == "-o" ]] || [[ "$2" == "-o" ]]; then
    #Download all parts of orbda dataset
    echo "${GREEN}======= BEGIN FULL ORBDA DATA DOWNLOAD =======${NC}"
    echo "${GREEN}Deleting data directory IF exists${NC}"
    rm -rf orbda

    echo "${GREEN}Creating dataset directory${NC}"
    mkdir orbda
    cd orbda

    echo "${GREEN}=======Downloading part 0=======${NC}"
    wget http://www.lampada.uerj.br/arquivosdb/part0.zip
    unzip part0.zip
    rm part0.zip

    echo "${GREEN}=======Downloading part 1=======${NC}"
    wget http://www.lampada.uerj.br/arquivosdb/part1.zip
    unzip part1.zip
    rm part1.zip

    echo "${GREEN}=======Downloading part 2=======${NC}"
    wget http://www.lampada.uerj.br/arquivosdb/part2.zip
    unzip part2.zip
    rm part2.zip

    echo "${GREEN}=======Downloading part 3=======${NC}"
    wget http://www.lampada.uerj.br/arquivosdb/part3.zip
    unzip part3.zip
    rm part3.zip

    echo "${GREEN}=======Downloading part 4=======${NC}"
    wget http://www.lampada.uerj.br/arquivosdb/part4.zip
    unzip part4.zip
    rm part4.zip

    echo "${GREEN}=======Downloading part 5=======${NC}"
    wget http://www.lampada.uerj.br/arquivosdb/part5.zip
    unzip part5.zip
    rm part5.zip

    echo "${GREEN}======= FINISHED FULL ORBDA DATA DOWNLOAD =======${NC}"
fi


if [[ "$1" == "-c" ]] || [[ "$2" == "-c" ]]; then
    echo "${GREEN}======= BEGIN DATA CSV DOWNLOAD =======${NC}"
    # wget --load-cookies /tmp/cookies.txt "https://drive.google.com/uc\?id\=1uBv9j602LGyN43wvbQDpvka49rR9eNUQ\&confirm\=t" -o data.csv
    wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1usHCOpPm3FP7Yk7guPR-rEo4yMSPQFbO' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1usHCOpPm3FP7Yk7guPR-rEo4yMSPQFbO" -O data.csv && rm -rf /tmp/cookies.txt
fi