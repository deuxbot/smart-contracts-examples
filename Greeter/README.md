# Greeter 
## Description
This is a simple example on how to interact with smart contracts with the Ethereum JavaScript API (web3).

The name of the person to greet (stored in the blockchain) can be retrieved and modified from the front-end.

## Requisites

`npm install -g truffle`  
`npm install -g ganache-cli `  

## Usage

`ganache-cli` # Run a local ethereum node  
`truffle migrate --network development` # Deploy the contract  
Open *index.html* on browser (you may have to reload the page after setting a new name)
