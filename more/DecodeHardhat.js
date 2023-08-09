// Run: npx hardhat run scripts/Decode.ts
import { ethers } from "hardhat";

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
      const Contract = await ethers.getContractFactory("ContractName");
      const contractInstance = Contract.attach(contractAddress);
      const decodedData = contractInstance.interface.decodeFunctionData(functionName, transaction.data);
  
      console.log('Decoded Input Data:');
      console.log(decodedData);
    } catch (error) {
      console.error('Error decoding transaction:', error);
    }
  }

  decodeTransaction().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });
