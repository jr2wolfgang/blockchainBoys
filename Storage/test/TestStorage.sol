pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/storage.sol";

contract TestStorage {
    Storage storage = Storage(DeployedAddresses.Storage());
}
