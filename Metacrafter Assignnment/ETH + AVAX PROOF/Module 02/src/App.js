//This is a React.js application code that interacts with an Ethereum blockchain smart contract to display and manage event tickets. It uses the ethers.js library to interact with the Ethereum network and the TokenMaster contract, which is defined in the TokenMaster.json ABI file.

import { useEffect, useState } from 'react'
import { ethers } from 'ethers'

// Import custom components
import Navigation from './components/Navigation'
import Sort from './components/Sort'
import Card from './components/Card'
import SeatChart from './components/SeatChart'

// Import the ABI for the TokenMaster contract
import TokenMaster from './abis/TokenMaster.json'

// Import configuration data for the contract
import config from './config.json'

// State variables to store provider, account, contract instance, occasions, selected occasion, and toggle status
//provider: Holds the instance of the Web3Provider from ethers.js, used to interact with the Ethereum blockchain.
//account: Holds the Ethereum address of the user's account (wallet).
//tokenMaster: Holds the instance of the TokenMaster contract, created using ethers.js Contract class.
//occasions: An array that stores the details of all occasions/events listed on the contract.
//occasion: Holds the details of the selected occasion/event.
//toggle: A boolean variable that controls the visibility of the SeatChart component.
function App() {
  const [provider, setProvider] = useState(null)
  const [account, setAccount] = useState(null)

  const [tokenMaster, setTokenMaster] = useState(null)
  const [occasions, setOccasions] = useState([])

  const [occasion, setOccasion] = useState({})
  const [toggle, setToggle] = useState(false)

  //This function is responsible for loading the necessary data from the blockchain when the application starts. It connects to the user's Ethereum wallet using the Web3Provider, retrieves the network information, initializes the TokenMaster contract instance using the contract address from the config.json, fetches the list of occasions from the contract, and updates the state variables accordingly.
  const loadBlockchainData = async () => {
    const provider = new ethers.providers.Web3Provider(window.ethereum)
    setProvider(provider)

    const network = await provider.getNetwork()
    const tokenMaster = new ethers.Contract(config[network.chainId].TokenMaster.address, TokenMaster, provider)
    setTokenMaster(tokenMaster)

    // Fetch the total number of occasions from the contract and retrieve details of each occasion
    const totalOccasions = await tokenMaster.totalOccasions()
    const occasions = []

    for (var i = 1; i <= totalOccasions; i++) {
      const occasion = await tokenMaster.getOccasion(i)
      occasions.push(occasion)
    }

    // Update the state with the fetched occasions
    setOccasions(occasions)

    // Listen for changes in the connected Ethereum accounts
    window.ethereum.on('accountsChanged', async () => {
      const accounts = await window.ethereum.request({ method: 'eth_requestAccounts' })
      const account = ethers.utils.getAddress(accounts[0])
      setAccount(account)
    })
  }

  //This hook is used to call the loadBlockchainData() function when the component mounts (i.e., when the application starts).
  useEffect(() => {
    loadBlockchainData()
  }, [])

  // JSX to render the application UI
  return (
    <div>
      <header>
        <Navigation account={account} setAccount={setAccount} />

        <h2 className="header__title"><strong>Event</strong> Tickets</h2>
      </header>

      <Sort />

      <div className='cards'>
         {/* Map through the occasions and render a Card component for each */}
        {occasions.map((occasion, index) => (
          <Card
            occasion={occasion}
            id={index + 1}
            tokenMaster={tokenMaster}
            provider={provider}
            account={account}
            toggle={toggle}
            setToggle={setToggle}
            setOccasion={setOccasion}
            key={index}
          />
        ))}
      </div>
      
      {/* Render the SeatChart component if toggle is true */}
      {toggle && (
        <SeatChart
          occasion={occasion}
          tokenMaster={tokenMaster}
          provider={provider}
          setToggle={setToggle}
        />
      )}
    </div>
  );
}

export default App;