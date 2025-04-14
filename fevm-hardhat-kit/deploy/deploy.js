const hre = require("hardhat");

async function main() {
  const Todo = await hre.ethers.getContractFactory("Todo");
  const todo = await Todo.deploy({
    gasLimit: 8000000 // Increase gas limit
  });

  // Wait for the contract to be deployed
  await todo.waitForDeployment();

  const todoAddress = await todo.getAddress();
  console.log("Todo deployed to:", todoAddress);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});