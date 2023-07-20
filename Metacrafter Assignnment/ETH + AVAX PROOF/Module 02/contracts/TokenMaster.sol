// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

//State Variables:

//owner: This variable stores the address of the contract owner, who will have certain administrative privileges.
//totalOccasions: This variable keeps track of the total number of occasions/events listed in the contract.
//totalSupply: This variable keeps track of the total number of tickets  sold across all occasions.

contract TokenMaster is ERC721 {
    address public owner;
    uint256 public totalOccasions;
    uint256 public totalSupply;

    // Struct to store the details of each occasion/event.
    struct Occasion {
        uint256 id;
        string name;
        uint256 cost;
        uint256 tickets;
        uint256 maxTickets;
        string date;
        string time;
        string location;
    }

//Mappings:

//occasions: This mapping stores occasion ID (uint256) to the corresponding Occasion struct, which holds all the details of that occasion.
//hasBought: This mapping keeps track of whether a particular address has bought a ticket for a specific occasion (occasion ID).
//seatTaken: This mapping keeps track of which address has taken a particular seat (seat number) for a specific occasion (occasion ID).
//seatsTaken: This mapping stores an array of seat numbers that have been taken for a specific occasion.

    mapping(uint256 => Occasion) occasions;
    mapping(uint256 => mapping(address => bool)) public hasBought;
    mapping(uint256 => mapping(uint256 => address)) public seatTaken;
    mapping(uint256 => uint256[]) seatsTaken;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    // Constructor: Initializes the contract and sets the contract owner as the deployer's address.
    constructor(
        string memory _name,
        string memory _symbol
    ) ERC721(_name, _symbol) {
        owner = msg.sender;
    }

//This function is used by the contract owner to list a new occasion/event. It takes various parameters representing the occasion details and adds the occasion to the occasions mapping.
    function list(
        string memory _name,
        uint256 _cost,
        uint256 _maxTickets,
        string memory _date,
        string memory _time,
        string memory _location
    ) public onlyOwner {
        totalOccasions++;
        occasions[totalOccasions] = Occasion(
            totalOccasions,
            _name,
            _cost,
            _maxTickets,
            _maxTickets,
            _date,
            _time,
            _location
        );
    }

//This function allows users to purchase tickets for a specific occasion. Users must send enough Ether to cover the cost of the ticket.
    function mint(uint256 _id, uint256 _seat) public payable {
        // Require that _id is not 0 or less than total occasions...
        require(_id != 0);
        require(_id <= totalOccasions);

        // Require that ETH sent is greater than cost...
        require(msg.value >= occasions[_id].cost);

        // Require that the seat is not taken, and the seat exists...
        require(seatTaken[_id][_seat] == address(0));
        require(_seat <= occasions[_id].maxTickets);

        occasions[_id].tickets -= 1; // <-- Update ticket count

        hasBought[_id][msg.sender] = true; // <-- Update buying status
        seatTaken[_id][_seat] = msg.sender; // <-- Assign seat

        seatsTaken[_id].push(_seat); // <-- Update seats currently taken

        totalSupply++;

        _safeMint(msg.sender, totalSupply);
    }

//This function allows anyone to query the details of a specific occasion by providing the occasion ID. It returns the 'Occasion' struct for that occasion.
    function getOccasion(uint256 _id) public view returns (Occasion memory) {
        return occasions[_id];
    }

//This function allows anyone to get the list of seats that have been taken for a specific occasion.
    function getSeatsTaken(uint256 _id) public view returns (uint256[] memory) {
        return seatsTaken[_id];
    }

//This function allows the contract owner to withdraw the contract's balance to their address.
    function withdraw() public onlyOwner {
        (bool success, ) = owner.call{value: address(this).balance}("");
        require(success);
    }
}
