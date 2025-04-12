const hre = require("hardhat");

async function main() {
  const IdentityNFT = await hre.ethers.getContractFactory("IdentityNFT");
  const identityNFT = await IdentityNFT.deploy();

  // ✅ Use waitForDeployment instead of deployed
  await identityNFT.waitForDeployment();

  console.log(`Contract deployed to: ${identityNFT.target}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

// Contract deployed to: 0x7d5d4D70667433884fb3846a0A1bf298c2F7b0fD