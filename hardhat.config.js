require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.28",
  networks: {
    ganache: {
      url: "http://127.0.0.1:7545",
      accounts: [
        "0x695be23744149e2b47fe0757668d1f688e925ad2615d98bd7047e2dd9fbcc2b8" 
      ]
    }
  }
};