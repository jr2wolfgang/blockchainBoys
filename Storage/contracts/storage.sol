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

  address current_user;
  MappingComputation map;

  // Constructor function that initializes the map contract.
  function Storage() public payable {
    map = new MappingComputation();
    current_user = msg.sender;
  }

  // A function to store information into our array of information.
  function store_info(bytes32 information, string date) public payable {
    map.update(information, date);
  }

  // A function to retrieve information from our array of information.
  function get_info(uint id) public view returns(bytes32 information) {
    return map.retrieve_information(id);
  }

  // A function to get the id of where the next set of information will be stored in.
  function get_id() public view returns(uint id_number) {
    return map.get_id();
  }

}
