const HDWalletProvider = require('@truffle/hdwallet-provider');
const provider = new HDWalletProvider({
   privateKeys: ['<Mi wallet private key>'],
   providerOrUrl: '<Infura Url>',
})


module.exports = {
  networks: {
    rinkeby: {
      provider: () => provider,
      network_id: 4,
      skipDryRun: true,
      gas: 10000000,
      gasLimit: 30000000
    },
    binanceTestnet: {
      provider: () => provider,
      network_id: 97,
      port: 8545,
    },
  },
  compilers: {
    solc: {
      version: "^0.8.10",
    }
  }
};
