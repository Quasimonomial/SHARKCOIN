pragma solidity ^0.4.8;

contract SharkCoin {
  // TODO: Generate and add supply
  /* function totalSupply() public constant returns (uint);
   */

  mapping(address => uint256) balances;
  mapping(address => uint256) reputations;

  string public constant name = "Shark Coin";
  string public constant symbol = "SHK";
  uint8 public constant decimals = 0;

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
