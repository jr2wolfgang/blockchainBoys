console.log("index.js executing");
var provider = new Web3.providers.HttpProvider("http://localhost:8545");
var contract = TruffleContract({
  abi: ...,
  unlinked_binary: ...,
  address: ..., // optional
  // many more
});
console.log(contract);

var MyContract = contract()

MyContract.setProvider(provider);

var deployed;

MyContract.deployed().then(function(instance) {
      var deployed = instance;
      return instance.someFunction(5);
}).then(function(result) {
      // Do something with the result or continue with more transactions.
});
