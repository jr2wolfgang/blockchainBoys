pragma solidity ^0.4.0;

// A contract that handles the computation to update, and retrieve information from an array.
contract MappingComputation {
  address current_user; // The current user who interacts with the contract.
  User[] information; // An array of type User, which is used to store information inputted by the user.
  uint counter = 0; // A counter to keep track of which index at the array we are currently at.

  // A struct User that represents information that can be stored into our array.
  struct User {
    address name;
    bytes32 information;
    string date;
  }

  // A constructor that sets the current_user to the current individual interacting with the contract.
  function MappingComputation() public payable {
    current_user = msg.sender;
  }

  // An update function to update the information array with the desired inputted information from the current user.
  function update(bytes32 info, string date) public {
    information[counter] = User(current_user, info, date);
    counter = counter + 1;
  }

  // A get_id function that displays the index of the array which is going to be filled up next.
  function get_id() public view returns(uint id) {
    return counter;
  }

  // A function to retrieve information from the array information.
  function retrieve_information(uint id) public view returns (bytes32 info_requir) {
    return information[id].information;
  }

}

// The contract that the users will be interacting with.
contract Storage {

  // A mapping that maps user addresses to StorageInfo.
  mapping(address => StorageInfo) storage_map;

  // A struct StorageInfo that represents information that can be stored into our array.
  struct StorageInfo {
    bytes32 information;
    string date;
  }

  // Constructor function.
  function Storage() public {
  }

  // A function to store information into our map. 
  function store_info(bytes32 information, string date) public { 
    storage_map[msg.sender] = StorageInfo(information, date);
  }

  // A function to retrieve information from our map. 
  function get_info() public view returns(bytes32 information) {
    return storage_map[msg.sender].information;
  }

}
