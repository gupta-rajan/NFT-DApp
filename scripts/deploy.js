const hre = require("hardhat");

async function main() {
  const IdentityNFT = await hre.ethers.getContractFactory("IITIdentityNFT");
  const identityNFT = await IdentityNFT.deploy();

  // ✅ Use waitForDeployment instead of deployed
  await identityNFT.waitForDeployment();

  console.log(`Contract deployed to: ${identityNFT.target}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

// Contract deployed to: 0xC584C8A851671c5d99A34A89cBAD1Fb62Fe7326c