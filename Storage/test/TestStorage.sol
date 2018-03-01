pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Storage.sol";

contract TestStorage {
    Storage str = Storage(DeployedAddresses.Storage());
    bytes32 testinfo = "asdfa";
    // Testing the adopt() function
  function testUserCanStore() public {
    bool returned = str.store_info(testinfo, "010318");

    Assert.equal(returned, true, "Storage should have returned true.");
  }
  // Testing retrieval of a single pet's owner
  function testGetStorageInfo() public {
    // Expected owner is this contract
    bytes32 expected = testinfo;
    bytes32 actual = str.get_info();
    Assert.equal(expected, actual, "Stored value should have been asdf");
  }
}
