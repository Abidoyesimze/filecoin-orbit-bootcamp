const hre = require("hardhat");

async function main() {
    const Todo = await hre.ethers.getContractFactory("Todo");
    const todo = await Todo.deploy({
        gasLimit: 5000000 // Set a gas limit higher than the required minimum
    });

    await todo.waitForDeployment();
    const todoAddress = await todo.getAddress();
    console.log("Todo deployed to:", todoAddress)
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});