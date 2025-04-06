const hre = require("hardhat");

async function main() {
  const Filecoin = await hre.ethers.getContractFactory("Filecoin");
  const filecoin = await Filecoin.deploy();
  
  // Wait for the contract to be deployed
  await filecoin.waitForDeployment();
  
  
  const filecoinAddress = await filecoin.getAddress();
  
  console.log("Counter deployed to:", filecoinAddress);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});