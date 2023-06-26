/*
Assessment Requirements
1. Create a variable that can hold a number of NFT's. What type of variable might this be?
2. Create an object inside your mintNFT function that will hold the metadata for your NFTs. 
   The metadata values will be passed to the function as parameters. When the NFT is ready, 
   you will store it in the variable you created in step 1
3. Your listNFTs() function will print all of your NFTs metadata to the console (i.e. console.log("Name: " + someNFT.name))
4. For good measure, getTotalSupply() should return the number of NFT's you have created
*/

// create a variable to hold your NFT's
let nftCount = 0;
const nfts = [];

// thus functiont will take in som values as parameters,create an NFT object using the parametes passed to it for its metadata and store it in the variable above. 
function mintNFT(_name, _eyecolor, _shirtType, _bling) {
    const nft = {
        "name": _name,
        "eyecolor": _eyecolor,
        "shirtType": _shirtType,
        "bling": _bling
    };
    nfts.push(nft);
    nftCount++;
    console.log("Minted: "+ _name)
}

// create a "loop" that will go through an "array" of NFT's and print their metadata with console.log()
function listNFTs() {
    for (let i = 0; i < nftCount; i++) {
        const nft = nfts[i];
        console.log("\nID:         "+(i+1));
        console.log("Name:       "+ nft.name);
        console.log("Eye Color:  "+ nft.eyecolor);
        console.log("Shirt Type: "+ nft.shirtType);
        console.log("Bling:      "+ nft.bling);
        console.log("------------------------");
    }
}

// print the total number of NFts we have minted to the console  
function getTotalSupply() {
  return nftCount;
}

// call your function below this line
const nft1 = mintNFT("Crit", "Blue", "Hoodie", "Gold");
const nft2 = mintNFT("Craw", "Red", "T-Shirt","Silver" );
const nft3 = mintNFT("Persian", "Grey", "Shirt", "Platinum");
const nft4 = mintNFT("Whiskers", "Green", "Jacket", "Sapphire");
const nft5 = mintNFT("Meowton", "Yellow", "Sweater","Emerald");
const nft6 = mintNFT("Parly", "Purple", "Tank Top", "Ruby");

listNFTs();
console.log("Total NFTs: " + getTotalSupply());