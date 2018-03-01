pragma solidity ^0.4.0;

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
  function store_info(bytes32 information, string date) public returns (bool){
    storage_map[msg.sender] = StorageInfo(information, date);
    return true;
  }

  // A function to retrieve information from our map.
  function get_info() public view returns(bytes32 information) {
    return storage_map[msg.sender].information;
  }
}
