const hre = require("hardhat");
const tokenContractJSON = require("../artifacts/contracts/OnePiece.sol/OnePiece.json");

const tokenAddress = "0xE14840C9EE11ED114534403A498d39d98453DfcC"; // Ethereum address of the deployed ERC721A contract
const tokenABI = tokenContractJSON.abi;
const walletAddress = "0x3188559f9931dCFE410FE91326c1FeED190B73Ab"; // Ethereum public address for the wallet

async function main() {
    // Get the contract instance of the deployed ERC721A contract
    const token = await hre.ethers.getContractAt(tokenABI, tokenAddress);

    // Log the total number of ERC721A tokens owned by the specified wallet address
    console.log("You now have a total number of: " + await token.balanceOf(walletAddress) + " tokens");
  }
  
 // Call the main function and handle any errors
  main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });
