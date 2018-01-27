pragma solidity ^0.4.8;

contract SharkCoin {
  // TODO: Generate and add supply
  /* function totalSupply() public constant returns (uint);

  So here is how we will do this
  1: we generate a total supply to owner of contract
  2: we grant 100 coins to users created by our user factory which is pretty cool
  3: we add to total supply on initialization, we add coints to total supply on enew user event from factory, and we remove coins when they are burned on reputation
  4: we have to add knowledge of our factory
   */

  address public owner;
  uint public constant totalSupply;

  mapping(address => uint256) balances;
  mapping(address => uint256) reputations;

  string public constant name = "Shark Coin";
  string public constant symbol = "SHK";
  uint8 public constant decimals = 0;

  function SharkCoin() public {

  }

  function balanceOf(address sharkUser) public constant returns (uint balance) {
    return balances[sharkUser];
  }

  function transfer(address to, uint tokens) public returns (bool success) {
    if (balances[msg.sender] < tokens) {
      Error("You are too poor");
      return false;
    }

    balances[msg.sender] = balances[msg.sender].sub(tokens);
    balances[to] = balances[to].add(tokens);
    Transfer(msg.sender, to, tokens);

    return true;
  }

  function reputate(address to, uint tokens) public returns (bool success) {
    // TODO: we can only send reputation to addresses that have a registered user with our user factory
    if (balances[msg.sender] < tokens) {
      Error("You are too poor");
      return false;
    }

    balances[msg.sender] = balances[msg.sender].sub(tokens);
    reputations[to] = reputations[to].add(tokens);
    Reputate(msg.sender, to, tokens);

    return true;
  }

  event Error(string msg);
  event Transfer(address indexed from, address indexed to, uint tokens);
  event Reputate(address indexed from, address indexed to, uint tokens);

  // TODO: Add loan functionality
  // TODO: Allow rules to be set for these loans
}
