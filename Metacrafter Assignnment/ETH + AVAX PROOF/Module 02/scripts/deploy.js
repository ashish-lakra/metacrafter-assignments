// Import hardhat and ethers.js libraries
const hre = require("hardhat")
const { ethers } = require("ethers")

// Utility function to convert a number of tokens to its equivalent wei value
const tokens = (n) => {
  return ethers.utils.parseUnits(n.toString(), 'ether')
}

//This is the main function that deploys the contract and lists the events.
async function main() {
  const [deployer] = await ethers.getSigners()
  const NAME = "TokenMaster"
  const SYMBOL = "TM"

  // Deploy the contract with the specified name and symbol using the deployer's account
  const TokenMaster = await ethers.getContractFactory("TokenMaster")
  const tokenMaster = await TokenMaster.deploy(NAME, SYMBOL)
  await tokenMaster.deployed()

  // Print the address of the deployed TokenMaster contract
  console.log(`Deployed TokenMaster Contract at: ${tokenMaster.address}\n`)

  // This is an array of objects, each representing an occasion/event that will be listed on the contract. Each object contains details such as name, cost, number of tickets available, date, time, and location.
  const occasions = [
    {
       name: "Cricket Match - Mumbai vs. Delhi",
      cost: tokens(3),
      tickets: 0,
      date: "Aug 15",
      time: "7:00PM IST",
      location: "Wankhede Stadium - Mumbai, India"
    },
    {
      name: "Music Festival - Bangalore",
      cost: tokens(1),
      tickets: 125,
      date: "Aug 20",
      time: "4:00PM IST",
      location: "Palace Grounds - Bangalore, India"
    },
    {
      name: "Tech Conference - Hyderabad",
      cost: tokens(0.25),
      tickets: 200,
      date: "Aug 25",
      time: "10:00AM IST",
      location: "HICC - Hyderabad, India"
    },
    {
      name: "Food Festival - Delhi",
      cost: tokens(5),
      tickets: 0,
      date: "Aug 30",
      time: "12:00PM IST",
      location: "Jawaharlal Nehru Stadium - Delhi, India"
    },
    {
      name: "Art Exhibition - Chennai",
      cost: tokens(1.5),
      tickets: 125,
      date: "Sep 5",
      time: "3:00PM IST",
      location: "Chennai Trade Centre - Chennai, India"
    }
  ]

  //The for loop is used to list the events on the contract. It iterates through the occasions array, and for each event, it calls the list function of the TokenMaster contract to add the event to the contract.
  for (var i = 0; i < 5; i++) {
    const transaction = await tokenMaster.connect(deployer).list(
      occasions[i].name,
      occasions[i].cost,
      occasions[i].tickets,
      occasions[i].date,
      occasions[i].time,
      occasions[i].location,
    )

    await transaction.wait()

    console.log(`Listed Event ${i + 1}: ${occasions[i].name}`)
  }
}

// Call the main function to deploy the contract and list the events
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});