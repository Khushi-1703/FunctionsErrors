# FunctionsErrors
## Overview
This repository contains a Solidity smart contract named "SmartContract" that implements a simple financial system for depositing and withdrawing funds. The contract is designed to be deployed on the Ethereum blockchain and follows the ERC-20 standard. The contract uses Solidity version 0.8.18 and is licensed under the MIT license.

## Contract Details
Contract Name: SmartContract
This is the main contract that handles depositing and withdrawing of funds.

### Prerequisites
Solidity compiler version 0.8.18 or compatible.
An Ethereum development environment or testnet to deploy and interact with the contract.
### Deployment
To deploy the SmartContract on the Ethereum blockchain, follow these steps:

Use the Solidity compiler to compile the contract.
Deploy the compiled contract using your preferred Ethereum development environment or testnet.
Once deployed, take note of the contract's address for interacting with it.
### SmartContract Functions
Constructor
Function: constructor()
Visibility: Public
Description: The constructor initializes the contract and sets an initial balance of 800 for the contract.
Deposit
Function: deposit(uint256 amount)
Visibility: External
Description: The deposit function allows external accounts to deposit funds into the contract. The amount parameter should be greater than zero; otherwise, the transaction will revert. The deposited amount is added to the contract's balance.
Withdraw
Function: withdraw(uint256 amount)
Visibility: External
Description: The withdraw function enables external accounts to withdraw funds from the contract. The amount parameter specifies the amount to withdraw, and it should not exceed the contract's current balance; otherwise, the transaction will revert. Additionally, the function checks if the withdrawal amount is more than 300. If it is, the transaction reverts with a warning to prevent potential scams.
## License
This SmartContract is licensed under the MIT License. Please see the LICENSE file for more details.

## Disclaimer
This smart contract is provided as-is with no warranties or guarantees. Use it at your own risk.
Be cautious when interacting with smart contracts and ensure you understand the functionality and implications of your actions.
## Examples
Below are examples of how to interact with the SmartContract using web3.js.

### Deployment Example
javascript
Copy code
// Assuming you have an Ethereum provider set up (e.g., via MetaMask)
const Web3 = require('web3');
const contractJson = require('path/to/SmartContract.json');

const web3 = new Web3('YOUR_ETHEREUM_PROVIDER_URL');
const contract = new web3.eth.Contract(contractJson.abi);

async function deployContract() {
  const accounts = await web3.eth.getAccounts();
  const deployedContract = await contract.deploy({
    data: contractJson.bytecode,
  }).send({
    from: accounts[0],
    gas: '5000000',
  });

  console.log('Contract deployed at:', deployedContract.options.address);
}

deployContract();
Interacting with the Contract Example
javascript
Copy code
// Assuming you have an already deployed contract instance
const Web3 = require('web3');
const contractJson = require('path/to/SmartContract.json');

const web3 = new Web3('YOUR_ETHEREUM_PROVIDER_URL');
const contract = new web3.eth.Contract(contractJson.abi, 'CONTRACT_ADDRESS');

async function depositFunds(amount) {
  const accounts = await web3.eth.getAccounts();
  await contract.methods.deposit(amount).send({
    from: accounts[0],
    gas: '200000',
  });

  console.log(`${amount} wei deposited successfully.`);
}

async function withdrawFunds(amount) {
  const accounts = await web3.eth.getAccounts();
  await contract.methods.withdraw(amount).send({
    from: accounts[0],
    gas: '200000',
  });

  console.log(`${amount} wei withdrawn successfully.`);
}

// Example usage
depositFunds(500); // Deposits 500 wei to the contract
withdrawFunds(200); // Withdraws 200 wei from the contract
Please ensure that you replace 'YOUR_ETHEREUM_PROVIDER_URL' and 'CONTRACT_ADDRESS' with your actual Ethereum provider URL and deployed contract address, respectively.
