#!/bin/bash

function make_user_accounts () {
    # Make an account for each user
    for u in 'giuseppe' 'andy' 'will' 'john' 'sonja' 'yong' 'justin'
    do
        useradd --create-home --shell /bin/bash $u --password SPECTechJupyter
    done
}

mkdir /shares && chmod 777 /shares
make_user_accounts
