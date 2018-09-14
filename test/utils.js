const Web3Utils = require('web3-utils');

const keccak256 = Web3Utils.sha3;

const sendRpc = (web3, method, params) => web3.currentProvider.sendAsync({
    jsonrpc: '2.0',
    method: method,
    params: params || [],
    id: new Date().getTime()
});

module.exports = {
    sendRpc, keccak256,
};
