const fs = require('fs');
const HDWalletProvider = require('truffle-hdwallet-provider');

const PRIVATE_FILE = './.private.json';

let privateJson = {};

process.env.NODE_TLS_REJECT_UNAUTHORIZED = '0';

const truffleExport = {
    networks: {
        development: {
            host: 'localhost',
            port: 8545,
            network_id: '*',
            gas: 2000000,
            gasPrice: 10000000000,
        }
    },
    solc: {
        optimizer: {
            enabled: true,
            runs: 200
        }
    },
    mocha: {
        useColors: true
    }
};

// Example of .private.json
//
// {
//     "name": "my_private_net",
//     "endpoint": "https://production.consortium.com",
//     "network_id": "*",
//     "apikey": "...",
//     "apisecret": "...",
//     "address": "0xab123..89zyx",
//     "account": 0,
//     "gas": 2000000,
//     "gas": 20000000000,
//     "privateKey": "0x890abc..12xyz",
//     "mnemonic": "the world is too small to not care",
//     "password": "bananas_are_not_meant_to_be_yellow!1!!1"
// }

if (fs.existsSync(PRIVATE_FILE)) {
    privateJson = require(PRIVATE_FILE);

    truffleExport.networks[privateJson.name] = {
        provider: () => new HDWalletProvider(privateJson.mnemonic, privateJson.endpoint, privateJson.account || 0),
        from: privateJson.address,
        network_id: privateJson.network_id,
        gas: privateJson.gas || 2000000,
        gasPrice: privateJson.gasPrice || 20000000000,
    };
}

module.exports = truffleExport;
