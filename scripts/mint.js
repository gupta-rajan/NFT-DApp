const hre = require("hardhat");

async function main() {
  const [deployer] = await hre.ethers.getSigners();

  const contractAddress = "0x5FbDB2315678afecb367f032d93F642f64180aa3"; // your local deployment address
  const IdentityNFT = await hre.ethers.getContractFactory("IITIdentityNFT");

  const identityNFT = await IdentityNFT.attach(contractAddress);

  const tokenURI = "ipfs://Qm..."; // replace with a real or dummy IPFS URI

  const tx = await identityNFT.mint(deployer.address, tokenURI);
  await tx.wait();

  console.log(`NFT minted to ${deployer.address}`);
}
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});