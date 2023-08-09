// Run: npx hardhat run scripts/Decode.ts --network sepolia
import { ethers } from "hardhat";

const contractAddress = '';
const transactionHash = '';
const functionName = ''; 

async function decodeTransaction() {
 
      // Step 1: Get the transaction details (make sure the network URL with provider and API key is set at config)
      const transaction = await ethers.provider.getTransaction(transactionHash);
      if (!transaction) {
        console.log('Transaction not found.');
        return;
      }
      // Step 2: Decode the input data using the contract's details
      const Contract = await ethers.getContractFactory("ContractName");
      const contractInstance = Contract.attach(contractAddress);
      const decodedData = contractInstance.interface.decodeFunctionData(functionName, transaction.data);
  
      console.log('Decoded Input Data:');
      console.log(decodedData);
  }

  decodeTransaction().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });
