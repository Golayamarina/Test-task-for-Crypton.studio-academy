require("@nomiclabs/hardhat-waffle")
require("@nomiclabs/hardhat-etherscan")
require("@nomiclabs/hardhat-web3");
require("dotenv").config()

task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

module.exports = {
  solidity: "0.8.4",
  networks: {
    rinkeby: {
     url: 'https://eth-rinkeby.alchemyapi.io/v2/${process.env.ALCHEMY_KEY}',
      
      accounts: [process.env.PRIVATE_KEY],
      plugins: ["solidity-coverage"],
      //gas: 2100000,
        //gasPrice: 8000000000,
        //saveDeployments: true,

    },
    hardhat: {
      chainId: 1337
    }
  },
  etherscan: {
    apiKey: '${process.env.ETHERSCAN_KEY}'
  }
};
