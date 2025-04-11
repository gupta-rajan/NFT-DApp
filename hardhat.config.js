require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.28",
  networks: {
    ganache: {
      url: "http://127.0.0.1:7545",
      accounts: [
        "0xe644bc050c221f58c7ca78bec35beb8b7a5582a73ba98e0223c48f5f65b8ab79" 
      ]
    }
  }
};