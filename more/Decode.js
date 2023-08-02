// Run: npx hardhat run scripts/Decode.ts
import { ethers } from "hardhat";
const ContractABI = require('../artifacts/contracts/Contract.sol/Contract.json').abi;

const url = ('https://sepolia.infura.io/v3/' + process.env.SEPOLIA_TESTNET_KEY);
const customHttpProvider = new ethers.providers.JsonRpcProvider(url);

const contractAddress = '';
const transactionHash = '';
const functionName = ''; 


async function decodeTransaction() {
    try {
      // Step 1: Get the transaction details
      const transaction = await customHttpProvider.getTransaction(transactionHash);
      if (!transaction) {
        console.log('Transaction not found.');
        return;
      }
      // Step 2: Decode the input data using the contract's ABI
      const contractInstance = new ethers.Contract(contractAddress, contractABI, customHttpProvider);
      const decodedData = contractInstance.interface.decodeFunctionData(functionName, transaction.data);
  
      console.log('Decoded Input Data:');
      console.log(decodedData);
    } catch (error) {
      console.error('Error decoding transaction:', error);
    }
  }

  decodeTransaction();
