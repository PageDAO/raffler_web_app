import 'package:Raffler/models/contract.dart';

class Contracts {
  Contract get test => Contract(
        abi:
            '[{"constant":false,"inputs":[{"name":"newMessage","type":"string"}],"name":"update","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"message","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"inputs":[{"name":"initMessage","type":"string"}],"payable":false,"stateMutability":"nonpayable","type":"constructor"}]',
        byteCode:
            '0x608060405236156054577f360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc54600090819081906001600160a01b0316368280378136915af43d82803e156050573d90f35b3d90fd5b7f360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc54600090819081906001600160a01b0316368280378136915af43d82803e156050573d90f3fea264697066735822122027660565f0680616f26e00bfb31d23ddde0342242b573171ba22b74b020c766764736f6c63430008110033',
        contractAddress: '0x70d25f0Fa2acBbaD57832810928649bcB5D595Fe',
      );

  Contract get pageDAOTicketNFTContract => Contract(
        abi: """[
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "_defaultURI",
				"type": "string"
			},
			{
				"internalType": "address",
				"name": "initialOwner",
				"type": "address"
			}
		],
		"stateMutability": "nonpayable",
		"type": "constructor"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "sender",
				"type": "address"
			},
			{
				"internalType": "uint256",
				"name": "tokenId",
				"type": "uint256"
			},
			{
				"internalType": "address",
				"name": "owner",
				"type": "address"
			}
		],
		"name": "ERC721IncorrectOwner",
		"type": "error"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "operator",
				"type": "address"
			},
			{
				"internalType": "uint256",
				"name": "tokenId",
				"type": "uint256"
			}
		],
		"name": "ERC721InsufficientApproval",
		"type": "error"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "approver",
				"type": "address"
			}
		],
		"name": "ERC721InvalidApprover",
		"type": "error"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "operator",
				"type": "address"
			}
		],
		"name": "ERC721InvalidOperator",
		"type": "error"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "owner",
				"type": "address"
			}
		],
		"name": "ERC721InvalidOwner",
		"type": "error"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "receiver",
				"type": "address"
			}
		],
		"name": "ERC721InvalidReceiver",
		"type": "error"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "sender",
				"type": "address"
			}
		],
		"name": "ERC721InvalidSender",
		"type": "error"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "tokenId",
				"type": "uint256"
			}
		],
		"name": "ERC721NonexistentToken",
		"type": "error"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "owner",
				"type": "address"
			}
		],
		"name": "OwnableInvalidOwner",
		"type": "error"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "account",
				"type": "address"
			}
		],
		"name": "OwnableUnauthorizedAccount",
		"type": "error"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": true,
				"internalType": "address",
				"name": "owner",
				"type": "address"
			},
			{
				"indexed": true,
				"internalType": "address",
				"name": "approved",
				"type": "address"
			},
			{
				"indexed": true,
				"internalType": "uint256",
				"name": "tokenId",
				"type": "uint256"
			}
		],
		"name": "Approval",
		"type": "event"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": true,
				"internalType": "address",
				"name": "owner",
				"type": "address"
			},
			{
				"indexed": true,
				"internalType": "address",
				"name": "operator",
				"type": "address"
			},
			{
				"indexed": false,
				"internalType": "bool",
				"name": "approved",
				"type": "bool"
			}
		],
		"name": "ApprovalForAll",
		"type": "event"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": true,
				"internalType": "address",
				"name": "previousOwner",
				"type": "address"
			},
			{
				"indexed": true,
				"internalType": "address",
				"name": "newOwner",
				"type": "address"
			}
		],
		"name": "OwnershipTransferred",
		"type": "event"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": true,
				"internalType": "address",
				"name": "from",
				"type": "address"
			},
			{
				"indexed": true,
				"internalType": "address",
				"name": "to",
				"type": "address"
			},
			{
				"indexed": true,
				"internalType": "uint256",
				"name": "tokenId",
				"type": "uint256"
			}
		],
		"name": "Transfer",
		"type": "event"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "to",
				"type": "address"
			},
			{
				"internalType": "uint256",
				"name": "tokenId",
				"type": "uint256"
			}
		],
		"name": "approve",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "owner",
				"type": "address"
			}
		],
		"name": "balanceOf",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "tokenId",
				"type": "uint256"
			}
		],
		"name": "burn",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "collectedDEGEN",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "currentTokenId",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "defaultURI",
		"outputs": [
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "tokenId",
				"type": "uint256"
			}
		],
		"name": "getApproved",
		"outputs": [
			{
				"internalType": "address",
				"name": "",
				"type": "address"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "",
				"type": "address"
			}
		],
		"name": "hasMintedFree",
		"outputs": [
			{
				"internalType": "bool",
				"name": "",
				"type": "bool"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "owner",
				"type": "address"
			},
			{
				"internalType": "address",
				"name": "operator",
				"type": "address"
			}
		],
		"name": "isApprovedForAll",
		"outputs": [
			{
				"internalType": "bool",
				"name": "",
				"type": "bool"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "tokenId",
				"type": "uint256"
			}
		],
		"name": "lockTokenURI",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"name": "lockedTokenURIs",
		"outputs": [
			{
				"internalType": "bool",
				"name": "",
				"type": "bool"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "to",
				"type": "address"
			}
		],
		"name": "mintFree",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "to",
				"type": "address"
			}
		],
		"name": "mintWithDEGEN",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "name",
		"outputs": [
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "owner",
		"outputs": [
			{
				"internalType": "address",
				"name": "",
				"type": "address"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "tokenId",
				"type": "uint256"
			}
		],
		"name": "ownerOf",
		"outputs": [
			{
				"internalType": "address",
				"name": "",
				"type": "address"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "renounceOwnership",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "from",
				"type": "address"
			},
			{
				"internalType": "address",
				"name": "to",
				"type": "address"
			},
			{
				"internalType": "uint256",
				"name": "tokenId",
				"type": "uint256"
			}
		],
		"name": "safeTransferFrom",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "from",
				"type": "address"
			},
			{
				"internalType": "address",
				"name": "to",
				"type": "address"
			},
			{
				"internalType": "uint256",
				"name": "tokenId",
				"type": "uint256"
			},
			{
				"internalType": "bytes",
				"name": "data",
				"type": "bytes"
			}
		],
		"name": "safeTransferFrom",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "operator",
				"type": "address"
			},
			{
				"internalType": "bool",
				"name": "approved",
				"type": "bool"
			}
		],
		"name": "setApprovalForAll",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "_tokenURI",
				"type": "string"
			}
		],
		"name": "setDefaultTokenURI",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "tokenId",
				"type": "uint256"
			},
			{
				"internalType": "string",
				"name": "_tokenURI",
				"type": "string"
			}
		],
		"name": "setTokenURI",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "bytes4",
				"name": "interfaceId",
				"type": "bytes4"
			}
		],
		"name": "supportsInterface",
		"outputs": [
			{
				"internalType": "bool",
				"name": "",
				"type": "bool"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "symbol",
		"outputs": [
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "tokenId",
				"type": "uint256"
			}
		],
		"name": "tokenURI",
		"outputs": [
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"name": "tokenURIs",
		"outputs": [
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "from",
				"type": "address"
			},
			{
				"internalType": "address",
				"name": "to",
				"type": "address"
			},
			{
				"internalType": "uint256",
				"name": "tokenId",
				"type": "uint256"
			}
		],
		"name": "transferFrom",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "newOwner",
				"type": "address"
			}
		],
		"name": "transferOwnership",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "withdrawDEGEN",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	}
]""",
        byteCode:
            '0x608060405234801561001057600080fd5b50600436106101ce5760003560e01c806370a0823111610104578063b88d4fde116100a2578063e55fcf2d11610071578063e55fcf2d146103d6578063e985e9c5146103e9578063f274bc19146103fc578063f2fde38b1461040457600080fd5b8063b88d4fde14610384578063c513d02914610397578063c87b56dd146103ba578063d1daf85f146103cd57600080fd5b806395d89b41116100de57806395d89b41146103435780639de9917e1461034b578063a125c8241461035e578063a22cb4651461037157600080fd5b806370a0823114610317578063715018a61461032a5780638da5cb5b1461033257600080fd5b80633a367a671161017157806345c0c5021161014b57806345c0c502146102bb5780636352211e146102ce5780636c8b703f146102e15780636e858926146102f457600080fd5b80633a367a671461028d57806342842e0e1461029557806342966c68146102a857600080fd5b8063081812fc116101ad578063081812fc14610227578063095ea7b314610252578063162094c41461026757806323b872dd1461027a57600080fd5b80629a9b7b146101d357806301ffc9a7146101ef57806306fdde0314610212575b600080fd5b6101dc60075481565b6040519081526020015b60405180910390f35b6102026101fd3660046111c8565b610417565b60405190151581526020016101e6565b61021a610469565b6040516101e69190611232565b61023a610235366004611245565b6104fb565b6040516001600160a01b0390911681526020016101e6565b610265610260366004611275565b610524565b005b61026561027536600461134b565b610533565b610265610288366004611392565b6105b2565b61021a61063d565b6102656102a3366004611392565b6106cb565b6102656102b6366004611245565b6106e6565b6102656102c9366004611245565b6106f2565b61023a6102dc366004611245565b610715565b61021a6102ef366004611245565b610720565b610202610302366004611245565b600a6020526000908152604090205460ff1681565b6101dc6103253660046113ce565b610739565b610265610781565b6006546001600160a01b031661023a565b61021a610795565b6102656103593660046113ce565b6107a4565b61026561036c3660046113e9565b6108ba565b61026561037f36600461142c565b6108ce565b610265610392366004611463565b6108d9565b6102026103a53660046113ce565b600c6020526000908152604090205460ff1681565b61021a6103c8366004611245565b6108f0565b6101dc600b5481565b6102656103e43660046113ce565b6109c6565b6102026103f73660046114df565b610a6f565b610265610a9d565b6102656104123660046113ce565b610bb9565b60006001600160e01b031982166380ac58cd60e01b148061044857506001600160e01b03198216635b5e139f60e01b145b8061046357506301ffc9a760e01b6001600160e01b03198316145b92915050565b60606000805461047890611512565b80601f01602080910402602001604051908101604052809291908181526020018280546104a490611512565b80156104f15780601f106104c6576101008083540402835291602001916104f1565b820191906000526020600020905b8154815290600101906020018083116104d457829003601f168201915b5050505050905090565b600061050682610bf7565b506000828152600460205260409020546001600160a01b0316610463565b61052f828233610c30565b5050565b61053b610c3d565b6000828152600a602052604090205460ff16156105955760405162461bcd60e51b8152602060048201526013602482015272151bdad95b88155492481a5cc81b1bd8dad959606a1b60448201526064015b60405180910390fd5b60008281526009602052604090206105ad828261159a565b505050565b6001600160a01b0382166105dc57604051633250574960e11b81526000600482015260240161058c565b60006105e9838333610c6a565b9050836001600160a01b0316816001600160a01b031614610637576040516364283d7b60e01b81526001600160a01b038086166004830152602482018490528216604482015260640161058c565b50505050565b6008805461064a90611512565b80601f016020809104026020016040519081016040528092919081815260200182805461067690611512565b80156106c35780601f10610698576101008083540402835291602001916106c3565b820191906000526020600020905b8154815290600101906020018083116106a657829003601f168201915b505050505081565b6105ad838383604051806020016040528060008152506108d9565b61052f60008233610c6a565b6106fa610c3d565b6000908152600a60205260409020805460ff19166001179055565b600061046382610bf7565b6009602052600090815260409020805461064a90611512565b60006001600160a01b038216610765576040516322718ad960e21b81526000600482015260240161058c565b506001600160a01b031660009081526003602052604090205490565b610789610c3d565b6107936000610d63565b565b60606001805461047890611512565b6040516323b872dd60e01b815233600482015230602482015268056bc75e2d63100000604482015273888f05d02ea7b42f32f103c089c1750170830642906323b872dd906064016020604051808303816000875af115801561080a573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040525081019061082e919061165a565b6108765760405162461bcd60e51b81526020600482015260196024820152782330b4b632b2103a37903a3930b739b332b910122222a3a2a760391b604482015260640161058c565b61088281600754610db5565b600780549060006108928361168d565b919050555068056bc75e2d63100000600b60008282546108b291906116a6565b909155505050565b6108c2610c3d565b600861052f828261159a565b61052f338383610e1a565b6108e48484846105b2565b61063784848484610eb9565b60008181526009602052604081208054606092919061090e90611512565b905011156109b4576000828152600960205260409020805461092f90611512565b80601f016020809104026020016040519081016040528092919081815260200182805461095b90611512565b80156109a85780601f1061097d576101008083540402835291602001916109a8565b820191906000526020600020905b81548152906001019060200180831161098b57829003601f168201915b50505050509050919050565b6008805461092f90611512565b919050565b336000908152600c602052604090205460ff1615610a315760405162461bcd60e51b815260206004820152602260248201527f596f75206861766520616c7265616479206d696e74656420612066726565204e604482015261119560f21b606482015260840161058c565b610a3d81600754610db5565b60078054906000610a4d8361168d565b9091555050336000908152600c60205260409020805460ff1916600117905550565b6001600160a01b03918216600090815260056020908152604080832093909416825291909152205460ff1690565b610aa5610c3d565b600b5480610aed5760405162461bcd60e51b81526020600482015260156024820152744e6f2024444547454e20746f20776974686472617760581b604482015260640161058c565b60405163a9059cbb60e01b81523360048201526024810182905273888f05d02ea7b42f32f103c089c17501708306429063a9059cbb906044016020604051808303816000875af1158015610b45573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250810190610b69919061165a565b610bb15760405162461bcd60e51b81526020600482015260196024820152782330b4b632b2103a37903a3930b739b332b910122222a3a2a760391b604482015260640161058c565b506000600b55565b610bc1610c3d565b6001600160a01b038116610beb57604051631e4fbdf760e01b81526000600482015260240161058c565b610bf481610d63565b50565b6000818152600260205260408120546001600160a01b03168061046357604051637e27328960e01b81526004810184905260240161058c565b6105ad8383836001610fe2565b6006546001600160a01b031633146107935760405163118cdaa760e01b815233600482015260240161058c565b6000828152600260205260408120546001600160a01b0390811690831615610c9757610c978184866110e8565b6001600160a01b03811615610cd557610cb4600085600080610fe2565b6001600160a01b038116600090815260036020526040902080546000190190555b6001600160a01b03851615610d04576001600160a01b0385166000908152600360205260409020805460010190555b60008481526002602052604080822080546001600160a01b0319166001600160a01b0389811691821790925591518793918516917fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef91a4949350505050565b600680546001600160a01b038381166001600160a01b0319831681179093556040519116919082907f8be0079c531659141344cd1fd0a4f28419497f9722a3daafe3b4186f6b6457e090600090a35050565b6001600160a01b038216610ddf57604051633250574960e11b81526000600482015260240161058c565b6000610ded83836000610c6a565b90506001600160a01b038116156105ad576040516339e3563760e11b81526000600482015260240161058c565b6001600160a01b038216610e4c57604051630b61174360e31b81526001600160a01b038316600482015260240161058c565b6001600160a01b03838116600081815260056020908152604080832094871680845294825291829020805460ff191686151590811790915591519182527f17307eab39ab6107e8899845ad3d59bd9653f200f220920489ca2b5937696c31910160405180910390a3505050565b6001600160a01b0383163b1561063757604051630a85bd0160e11b81526001600160a01b0384169063150b7a0290610efb9033908890879087906004016116b9565b6020604051808303816000875af1925050508015610f36575060408051601f3d908101601f19168201909252610f33918101906116f6565b60015b610f9f573d808015610f64576040519150601f19603f3d011682016040523d82523d6000602084013e610f69565b606091505b508051600003610f9757604051633250574960e11b81526001600160a01b038516600482015260240161058c565b805181602001fd5b6001600160e01b03198116630a85bd0160e11b14610fdb57604051633250574960e11b81526001600160a01b038516600482015260240161058c565b5050505050565b8080610ff657506001600160a01b03821615155b156110b857600061100684610bf7565b90506001600160a01b038316158015906110325750826001600160a01b0316816001600160a01b031614155b801561104557506110438184610a6f565b155b1561106e5760405163a9fbf51f60e01b81526001600160a01b038416600482015260240161058c565b81156110b65783856001600160a01b0316826001600160a01b03167f8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b92560405160405180910390a45b505b5050600090815260046020526040902080546001600160a01b0319166001600160a01b0392909216919091179055565b6110f383838361114c565b6105ad576001600160a01b03831661112157604051637e27328960e01b81526004810182905260240161058c565b60405163177e802f60e01b81526001600160a01b03831660048201526024810182905260440161058c565b60006001600160a01b038316158015906111aa5750826001600160a01b0316846001600160a01b0316148061118657506111868484610a6f565b806111aa57506000828152600460205260409020546001600160a01b038481169116145b949350505050565b6001600160e01b031981168114610bf457600080fd5b6000602082840312156111da57600080fd5b81356111e5816111b2565b9392505050565b6000815180845260005b81811015611212576020818501810151868301820152016111f6565b506000602082860101526020601f19601f83011685010191505092915050565b6020815260006111e560208301846111ec565b60006020828403121561125757600080fd5b5035919050565b80356001600160a01b03811681146109c157600080fd5b6000806040838503121561128857600080fd5b6112918361125e565b946020939093013593505050565b634e487b7160e01b600052604160045260246000fd5b600067ffffffffffffffff808411156112d0576112d061129f565b604051601f8501601f19908116603f011681019082821181831017156112f8576112f861129f565b8160405280935085815286868601111561131157600080fd5b858560208301376000602087830101525050509392505050565b600082601f83011261133c57600080fd5b6111e5838335602085016112b5565b6000806040838503121561135e57600080fd5b82359150602083013567ffffffffffffffff81111561137c57600080fd5b6113888582860161132b565b9150509250929050565b6000806000606084860312156113a757600080fd5b6113b08461125e565b92506113be6020850161125e565b9150604084013590509250925092565b6000602082840312156113e057600080fd5b6111e58261125e565b6000602082840312156113fb57600080fd5b813567ffffffffffffffff81111561141257600080fd5b6111aa8482850161132b565b8015158114610bf457600080fd5b6000806040838503121561143f57600080fd5b6114488361125e565b915060208301356114588161141e565b809150509250929050565b6000806000806080858703121561147957600080fd5b6114828561125e565b93506114906020860161125e565b925060408501359150606085013567ffffffffffffffff8111156114b357600080fd5b8501601f810187136114c457600080fd5b6114d3878235602084016112b5565b91505092959194509250565b600080604083850312156114f257600080fd5b6114fb8361125e565b91506115096020840161125e565b90509250929050565b600181811c9082168061152657607f821691505b60208210810361154657634e487b7160e01b600052602260045260246000fd5b50919050565b601f8211156105ad57600081815260208120601f850160051c810160208610156115735750805b601f850160051c820191505b818110156115925782815560010161157f565b505050505050565b815167ffffffffffffffff8111156115b4576115b461129f565b6115c8816115c28454611512565b8461154c565b602080601f8311600181146115fd57600084156115e55750858301515b600019600386901b1c1916600185901b178555611592565b600085815260208120601f198616915b8281101561162c5788860151825594840194600190910190840161160d565b508582101561164a5787850151600019600388901b60f8161c191681555b5050505050600190811b01905550565b60006020828403121561166c57600080fd5b81516111e58161141e565b634e487b7160e01b600052601160045260246000fd5b60006001820161169f5761169f611677565b5060010190565b8082018082111561046357610463611677565b6001600160a01b03858116825284166020820152604081018390526080606082018190526000906116ec908301846111ec565b9695505050505050565b60006020828403121561170857600080fd5b81516111e5816111b256fea2646970667358221220a39bfa8f1e1547da8f1f43bf8eee17817a7689203c3e9167384e4229a5c3b1d564736f6c63430008140033',
        contractAddress: '0x2c8ff9bac2d743235c84f9cb8e8027945c720bd5',
      );

  Contract get raffleTicket => Contract(
        abi:
            '[{"inputs":[{"internalType":"address","name":"_mintFeeRecipient","type":"address"},{"internalType":"address","name":"_upgradeGate","type":"address"},{"internalType":"address","name":"_protocolRewards","type":"address"}],"stateMutability":"nonpayable","type":"constructor"},{"inputs":[],"name":"ADDRESS_DELEGATECALL_TO_NON_CONTRACT","type":"error"},{"inputs":[],"name":"ADDRESS_LOW_LEVEL_CALL_FAILED","type":"error"},{"inputs":[{"internalType":"address","name":"operator","type":"address"},{"internalType":"address","name":"user","type":"address"}],"name":"Burn_NotOwnerOrApproved","type":"error"},{"inputs":[],"name":"CREATOR_FUNDS_RECIPIENT_NOT_SET","type":"error"},{"inputs":[{"internalType":"bytes","name":"reason","type":"bytes"}],"name":"CallFailed","type":"error"},{"inputs":[],"name":"Call_TokenIdMismatch","type":"error"},{"inputs":[],"name":"CallerNotZoraCreator1155","type":"error"},{"inputs":[{"internalType":"uint256","name":"tokenId","type":"uint256"},{"internalType":"uint256","name":"quantity","type":"uint256"},{"internalType":"uint256","name":"totalMinted","type":"uint256"},{"internalType":"uint256","name":"maxSupply","type":"uint256"}],"name":"CannotMintMoreTokens","type":"error"},{"inputs":[{"internalType":"address","name":"proposedAddress","type":"address"}],"name":"Config_TransferHookNotSupported","type":"error"},{"inputs":[],"name":"ERC1155_ACCOUNTS_AND_IDS_LENGTH_MISMATCH","type":"error"},{"inputs":[],"name":"ERC1155_ADDRESS_ZERO_IS_NOT_A_VALID_OWNER","type":"error"},{"inputs":[],"name":"ERC1155_BURN_AMOUNT_EXCEEDS_BALANCE","type":"error"},{"inputs":[],"name":"ERC1155_BURN_FROM_ZERO_ADDRESS","type":"error"},{"inputs":[],"name":"ERC1155_CALLER_IS_NOT_TOKEN_OWNER_OR_APPROVED","type":"error"},{"inputs":[],"name":"ERC1155_ERC1155RECEIVER_REJECTED_TOKENS","type":"error"},{"inputs":[],"name":"ERC1155_IDS_AND_AMOUNTS_LENGTH_MISMATCH","type":"error"},{"inputs":[],"name":"ERC1155_INSUFFICIENT_BALANCE_FOR_TRANSFER","type":"error"},{"inputs":[],"name":"ERC1155_MINT_TO_ZERO_ADDRESS","type":"error"},{"inputs":[],"name":"ERC1155_MINT_TO_ZERO_ADDRESS","type":"error"},{"inputs":[],"name":"ERC1155_SETTING_APPROVAL_FOR_SELF","type":"error"},{"inputs":[],"name":"ERC1155_TRANSFER_TO_NON_ERC1155RECEIVER_IMPLEMENTER","type":"error"},{"inputs":[],"name":"ERC1155_TRANSFER_TO_ZERO_ADDRESS","type":"error"},{"inputs":[],"name":"ERC1967_NEW_IMPL_NOT_CONTRACT","type":"error"},{"inputs":[],"name":"ERC1967_NEW_IMPL_NOT_UUPS","type":"error"},{"inputs":[],"name":"ERC1967_UNSUPPORTED_PROXIABLEUUID","type":"error"},{"inputs":[{"internalType":"address","name":"recipient","type":"address"},{"internalType":"uint256","name":"amount","type":"uint256"}],"name":"ETHWithdrawFailed","type":"error"},{"inputs":[],"name":"FUNCTION_MUST_BE_CALLED_THROUGH_ACTIVE_PROXY","type":"error"},{"inputs":[],"name":"FUNCTION_MUST_BE_CALLED_THROUGH_DELEGATECALL","type":"error"},{"inputs":[{"internalType":"uint256","name":"amount","type":"uint256"},{"internalType":"uint256","name":"contractValue","type":"uint256"}],"name":"FundsWithdrawInsolvent","type":"error"},{"inputs":[],"name":"INITIALIZABLE_CONTRACT_ALREADY_INITIALIZED","type":"error"},{"inputs":[],"name":"INITIALIZABLE_CONTRACT_IS_NOT_INITIALIZING","type":"error"},{"inputs":[],"name":"INVALID_ADDRESS_ZERO","type":"error"},{"inputs":[],"name":"INVALID_ETH_AMOUNT","type":"error"},{"inputs":[{"internalType":"address","name":"mintTo","type":"address"},{"internalType":"bytes32[]","name":"merkleProof","type":"bytes32[]"},{"internalType":"bytes32","name":"merkleRoot","type":"bytes32"}],"name":"InvalidMerkleProof","type":"error"},{"inputs":[],"name":"InvalidMintSchedule","type":"error"},{"inputs":[],"name":"InvalidSignatureVersion","type":"error"},{"inputs":[],"name":"MintNotYetStarted","type":"error"},{"inputs":[],"name":"Mint_InsolventSaleTransfer","type":"error"},{"inputs":[],"name":"Mint_TokenIDMintNotAllowed","type":"error"},{"inputs":[],"name":"Mint_UnknownCommand","type":"error"},{"inputs":[],"name":"Mint_ValueTransferFail","type":"error"},{"inputs":[],"name":"MinterContractAlreadyExists","type":"error"},{"inputs":[],"name":"MinterContractDoesNotExist","type":"error"},{"inputs":[],"name":"NewOwnerNeedsToBeAdmin","type":"error"},{"inputs":[{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"NoRendererForToken","type":"error"},{"inputs":[],"name":"ONLY_CREATE_REFERRAL","type":"error"},{"inputs":[],"name":"PremintDeleted","type":"error"},{"inputs":[{"internalType":"address","name":"caller","type":"address"},{"internalType":"address","name":"recipient","type":"address"},{"internalType":"uint256","name":"amount","type":"uint256"}],"name":"ProtocolRewardsWithdrawFailed","type":"error"},{"inputs":[{"internalType":"address","name":"renderer","type":"address"}],"name":"RendererNotValid","type":"error"},{"inputs":[],"name":"Renderer_NotValidRendererContract","type":"error"},{"inputs":[],"name":"SaleEnded","type":"error"},{"inputs":[],"name":"SaleHasNotStarted","type":"error"},{"inputs":[{"internalType":"address","name":"targetContract","type":"address"}],"name":"Sale_CannotCallNonSalesContract","type":"error"},{"inputs":[{"internalType":"uint256","name":"expected","type":"uint256"},{"internalType":"uint256","name":"actual","type":"uint256"}],"name":"TokenIdMismatch","type":"error"},{"inputs":[],"name":"UUPS_UPGRADEABLE_MUST_NOT_BE_CALLED_THROUGH_DELEGATECALL","type":"error"},{"inputs":[{"internalType":"address","name":"user","type":"address"},{"internalType":"uint256","name":"limit","type":"uint256"},{"internalType":"uint256","name":"requestedAmount","type":"uint256"}],"name":"UserExceedsMintLimit","type":"error"},{"inputs":[{"internalType":"address","name":"user","type":"address"},{"internalType":"uint256","name":"tokenId","type":"uint256"},{"internalType":"uint256","name":"role","type":"uint256"}],"name":"UserMissingRoleForToken","type":"error"},{"inputs":[],"name":"WrongValueSent","type":"error"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"previousAdmin","type":"address"},{"indexed":false,"internalType":"address","name":"newAdmin","type":"address"}],"name":"AdminChanged","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"account","type":"address"},{"indexed":true,"internalType":"address","name":"operator","type":"address"},{"indexed":false,"internalType":"bool","name":"approved","type":"bool"}],"name":"ApprovalForAll","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"beacon","type":"address"}],"name":"BeaconUpgraded","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"updater","type":"address"},{"indexed":true,"internalType":"enum IZoraCreator1155.ConfigUpdate","name":"updateType","type":"uint8"},{"components":[{"internalType":"address","name":"owner","type":"address"},{"internalType":"uint96","name":"__gap1","type":"uint96"},{"internalType":"address payable","name":"fundsRecipient","type":"address"},{"internalType":"uint96","name":"__gap2","type":"uint96"},{"internalType":"contract ITransferHookReceiver","name":"transferHook","type":"address"},{"internalType":"uint96","name":"__gap3","type":"uint96"}],"indexed":false,"internalType":"struct IZoraCreator1155TypesV1.ContractConfig","name":"newConfig","type":"tuple"}],"name":"ConfigUpdated","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"updater","type":"address"},{"indexed":false,"internalType":"string","name":"uri","type":"string"},{"indexed":false,"internalType":"string","name":"name","type":"string"}],"name":"ContractMetadataUpdated","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"contract IRenderer1155","name":"renderer","type":"address"}],"name":"ContractRendererUpdated","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"bytes32","name":"structHash","type":"bytes32"},{"indexed":false,"internalType":"string","name":"domainName","type":"string"},{"indexed":false,"internalType":"string","name":"version","type":"string"},{"indexed":false,"internalType":"address","name":"creator","type":"address"},{"indexed":false,"internalType":"bytes","name":"signature","type":"bytes"}],"name":"CreatorAttribution","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"uint8","name":"version","type":"uint8"}],"name":"Initialized","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"lastOwner","type":"address"},{"indexed":false,"internalType":"address","name":"newOwner","type":"address"}],"name":"OwnershipTransferred","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"sender","type":"address"},{"indexed":true,"internalType":"address","name":"minter","type":"address"},{"indexed":true,"internalType":"uint256","name":"tokenId","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"quantity","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"value","type":"uint256"}],"name":"Purchased","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"uint256","name":"tokenId","type":"uint256"},{"indexed":true,"internalType":"address","name":"renderer","type":"address"},{"indexed":true,"internalType":"address","name":"user","type":"address"}],"name":"RendererUpdated","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"uint256","name":"tokenId","type":"uint256"},{"indexed":true,"internalType":"address","name":"sender","type":"address"},{"indexed":false,"internalType":"string","name":"newURI","type":"string"},{"indexed":false,"internalType":"uint256","name":"maxSupply","type":"uint256"}],"name":"SetupNewToken","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"operator","type":"address"},{"indexed":true,"internalType":"address","name":"from","type":"address"},{"indexed":true,"internalType":"address","name":"to","type":"address"},{"indexed":false,"internalType":"uint256[]","name":"ids","type":"uint256[]"},{"indexed":false,"internalType":"uint256[]","name":"values","type":"uint256[]"}],"name":"TransferBatch","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"operator","type":"address"},{"indexed":true,"internalType":"address","name":"from","type":"address"},{"indexed":true,"internalType":"address","name":"to","type":"address"},{"indexed":false,"internalType":"uint256","name":"id","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"value","type":"uint256"}],"name":"TransferSingle","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"string","name":"value","type":"string"},{"indexed":true,"internalType":"uint256","name":"id","type":"uint256"}],"name":"URI","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"uint256","name":"tokenId","type":"uint256"},{"indexed":true,"internalType":"address","name":"user","type":"address"},{"indexed":true,"internalType":"uint256","name":"permissions","type":"uint256"}],"name":"UpdatedPermissions","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"uint256","name":"tokenId","type":"uint256"},{"indexed":true,"internalType":"address","name":"user","type":"address"},{"components":[{"internalType":"uint32","name":"royaltyMintSchedule","type":"uint32"},{"internalType":"uint32","name":"royaltyBPS","type":"uint32"},{"internalType":"address","name":"royaltyRecipient","type":"address"}],"indexed":false,"internalType":"struct ICreatorRoyaltiesControl.RoyaltyConfiguration","name":"configuration","type":"tuple"}],"name":"UpdatedRoyalties","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"from","type":"address"},{"indexed":true,"internalType":"uint256","name":"tokenId","type":"uint256"},{"components":[{"internalType":"string","name":"uri","type":"string"},{"internalType":"uint256","name":"maxSupply","type":"uint256"},{"internalType":"uint256","name":"totalMinted","type":"uint256"}],"indexed":false,"internalType":"struct IZoraCreator1155TypesV1.TokenData","name":"tokenData","type":"tuple"}],"name":"UpdatedToken","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"implementation","type":"address"}],"name":"Upgraded","type":"event"},{"inputs":[],"name":"CONTRACT_BASE_ID","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"PERMISSION_BIT_ADMIN","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"PERMISSION_BIT_FUNDS_MANAGER","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"PERMISSION_BIT_METADATA","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"PERMISSION_BIT_MINTER","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"PERMISSION_BIT_SALES","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"tokenId","type":"uint256"},{"internalType":"address","name":"user","type":"address"},{"internalType":"uint256","name":"permissionBits","type":"uint256"}],"name":"addPermission","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"recipient","type":"address"},{"internalType":"uint256","name":"tokenId","type":"uint256"},{"internalType":"uint256","name":"quantity","type":"uint256"},{"internalType":"bytes","name":"data","type":"bytes"}],"name":"adminMint","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"recipient","type":"address"},{"internalType":"uint256[]","name":"tokenIds","type":"uint256[]"},{"internalType":"uint256[]","name":"quantities","type":"uint256[]"},{"internalType":"bytes","name":"data","type":"bytes"}],"name":"adminMintBatch","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"lastTokenId","type":"uint256"}],"name":"assumeLastTokenIdMatches","outputs":[],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"account","type":"address"},{"internalType":"uint256","name":"id","type":"uint256"}],"name":"balanceOf","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address[]","name":"accounts","type":"address[]"},{"internalType":"uint256[]","name":"ids","type":"uint256[]"}],"name":"balanceOfBatch","outputs":[{"internalType":"uint256[]","name":"batchBalances","type":"uint256[]"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"from","type":"address"},{"internalType":"uint256[]","name":"tokenIds","type":"uint256[]"},{"internalType":"uint256[]","name":"amounts","type":"uint256[]"}],"name":"burnBatch","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"tokenId","type":"uint256"},{"internalType":"bytes","name":"data","type":"bytes"}],"name":"callRenderer","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"tokenId","type":"uint256"},{"internalType":"contract IMinter1155","name":"salesConfig","type":"address"},{"internalType":"bytes","name":"data","type":"bytes"}],"name":"callSale","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"numTokens","type":"uint256"}],"name":"computeFreeMintRewards","outputs":[{"components":[{"internalType":"uint256","name":"creatorReward","type":"uint256"},{"internalType":"uint256","name":"createReferralReward","type":"uint256"},{"internalType":"uint256","name":"mintReferralReward","type":"uint256"},{"internalType":"uint256","name":"firstMinterReward","type":"uint256"},{"internalType":"uint256","name":"zoraReward","type":"uint256"}],"internalType":"struct RewardsSettings","name":"","type":"tuple"}],"stateMutability":"pure","type":"function"},{"inputs":[{"internalType":"uint256","name":"numTokens","type":"uint256"}],"name":"computePaidMintRewards","outputs":[{"components":[{"internalType":"uint256","name":"creatorReward","type":"uint256"},{"internalType":"uint256","name":"createReferralReward","type":"uint256"},{"internalType":"uint256","name":"mintReferralReward","type":"uint256"},{"internalType":"uint256","name":"firstMinterReward","type":"uint256"},{"internalType":"uint256","name":"zoraReward","type":"uint256"}],"internalType":"struct RewardsSettings","name":"","type":"tuple"}],"stateMutability":"pure","type":"function"},{"inputs":[{"internalType":"uint256","name":"numTokens","type":"uint256"}],"name":"computeTotalReward","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"pure","type":"function"},{"inputs":[],"name":"config","outputs":[{"internalType":"address","name":"owner","type":"address"},{"internalType":"uint96","name":"__gap1","type":"uint96"},{"internalType":"address payable","name":"fundsRecipient","type":"address"},{"internalType":"uint96","name":"__gap2","type":"uint96"},{"internalType":"contract ITransferHookReceiver","name":"transferHook","type":"address"},{"internalType":"uint96","name":"__gap3","type":"uint96"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"contractURI","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"contractVersion","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"pure","type":"function"},{"inputs":[{"internalType":"uint256","name":"","type":"uint256"}],"name":"createReferrals","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"","type":"uint256"}],"name":"customRenderers","outputs":[{"internalType":"contract IRenderer1155","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"bytes","name":"premintConfig","type":"bytes"},{"internalType":"bytes32","name":"premintVersion","type":"bytes32"},{"internalType":"bytes","name":"signature","type":"bytes"},{"internalType":"address","name":"sender","type":"address"}],"name":"delegateSetupNewToken","outputs":[{"internalType":"uint256","name":"newTokenId","type":"uint256"}],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint32","name":"","type":"uint32"}],"name":"delegatedTokenId","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"","type":"uint256"}],"name":"firstMinters","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"getCreatorRewardRecipient","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"getCustomRenderer","outputs":[{"internalType":"contract IRenderer1155","name":"customRenderer","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"getRoyalties","outputs":[{"components":[{"internalType":"uint32","name":"royaltyMintSchedule","type":"uint32"},{"internalType":"uint32","name":"royaltyBPS","type":"uint32"},{"internalType":"address","name":"royaltyRecipient","type":"address"}],"internalType":"struct ICreatorRoyaltiesControl.RoyaltyConfiguration","name":"","type":"tuple"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"getTokenInfo","outputs":[{"components":[{"internalType":"string","name":"uri","type":"string"},{"internalType":"uint256","name":"maxSupply","type":"uint256"},{"internalType":"uint256","name":"totalMinted","type":"uint256"}],"internalType":"struct IZoraCreator1155TypesV1.TokenData","name":"","type":"tuple"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"implementation","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"string","name":"contractName","type":"string"},{"internalType":"string","name":"newContractURI","type":"string"},{"components":[{"internalType":"uint32","name":"royaltyMintSchedule","type":"uint32"},{"internalType":"uint32","name":"royaltyBPS","type":"uint32"},{"internalType":"address","name":"royaltyRecipient","type":"address"}],"internalType":"struct ICreatorRoyaltiesControl.RoyaltyConfiguration","name":"defaultRoyaltyConfiguration","type":"tuple"},{"internalType":"address payable","name":"defaultAdmin","type":"address"},{"internalType":"bytes[]","name":"setupActions","type":"bytes[]"}],"name":"initialize","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"user","type":"address"},{"internalType":"uint256","name":"tokenId","type":"uint256"},{"internalType":"uint256","name":"role","type":"uint256"}],"name":"isAdminOrRole","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"account","type":"address"},{"internalType":"address","name":"operator","type":"address"}],"name":"isApprovedForAll","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"","type":"uint256"}],"name":"metadataRendererContract","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"contract IMinter1155","name":"minter","type":"address"},{"internalType":"uint256","name":"tokenId","type":"uint256"},{"internalType":"uint256","name":"quantity","type":"uint256"},{"internalType":"address[]","name":"rewardsRecipients","type":"address[]"},{"internalType":"bytes","name":"minterArguments","type":"bytes"}],"name":"mint","outputs":[],"stateMutability":"payable","type":"function"},{"inputs":[],"name":"mintFee","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"pure","type":"function"},{"inputs":[{"internalType":"contract IMinter1155","name":"minter","type":"address"},{"internalType":"uint256","name":"tokenId","type":"uint256"},{"internalType":"uint256","name":"quantity","type":"uint256"},{"internalType":"bytes","name":"minterArguments","type":"bytes"},{"internalType":"address","name":"mintReferral","type":"address"}],"name":"mintWithRewards","outputs":[],"stateMutability":"payable","type":"function"},{"inputs":[{"internalType":"bytes[]","name":"data","type":"bytes[]"}],"name":"multicall","outputs":[{"internalType":"bytes[]","name":"results","type":"bytes[]"}],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"name","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"nextTokenId","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"owner","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"","type":"uint256"},{"internalType":"address","name":"","type":"address"}],"name":"permissions","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"proxiableUUID","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"tokenId","type":"uint256"},{"internalType":"address","name":"user","type":"address"},{"internalType":"uint256","name":"permissionBits","type":"uint256"}],"name":"removePermission","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"","type":"uint256"}],"name":"royalties","outputs":[{"internalType":"uint32","name":"royaltyMintSchedule","type":"uint32"},{"internalType":"uint32","name":"royaltyBPS","type":"uint32"},{"internalType":"address","name":"royaltyRecipient","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"tokenId","type":"uint256"},{"internalType":"uint256","name":"salePrice","type":"uint256"}],"name":"royaltyInfo","outputs":[{"internalType":"address","name":"receiver","type":"address"},{"internalType":"uint256","name":"royaltyAmount","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"from","type":"address"},{"internalType":"address","name":"to","type":"address"},{"internalType":"uint256[]","name":"ids","type":"uint256[]"},{"internalType":"uint256[]","name":"amounts","type":"uint256[]"},{"internalType":"bytes","name":"data","type":"bytes"}],"name":"safeBatchTransferFrom","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"from","type":"address"},{"internalType":"address","name":"to","type":"address"},{"internalType":"uint256","name":"id","type":"uint256"},{"internalType":"uint256","name":"amount","type":"uint256"},{"internalType":"bytes","name":"data","type":"bytes"}],"name":"safeTransferFrom","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"operator","type":"address"},{"internalType":"bool","name":"approved","type":"bool"}],"name":"setApprovalForAll","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address payable","name":"fundsRecipient","type":"address"}],"name":"setFundsRecipient","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"newOwner","type":"address"}],"name":"setOwner","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"tokenId","type":"uint256"},{"internalType":"contract IRenderer1155","name":"renderer","type":"address"}],"name":"setTokenMetadataRenderer","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"contract ITransferHookReceiver","name":"transferHook","type":"address"}],"name":"setTransferHook","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"string","name":"newURI","type":"string"},{"internalType":"uint256","name":"maxSupply","type":"uint256"}],"name":"setupNewToken","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"string","name":"newURI","type":"string"},{"internalType":"uint256","name":"maxSupply","type":"uint256"},{"internalType":"address","name":"createReferral","type":"address"}],"name":"setupNewTokenWithCreateReferral","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"supportedPremintSignatureVersions","outputs":[{"internalType":"string[]","name":"","type":"string[]"}],"stateMutability":"pure","type":"function"},{"inputs":[{"internalType":"bytes4","name":"interfaceId","type":"bytes4"}],"name":"supportsInterface","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"symbol","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"pure","type":"function"},{"inputs":[{"internalType":"string","name":"_newURI","type":"string"},{"internalType":"string","name":"_newName","type":"string"}],"name":"updateContractMetadata","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"tokenId","type":"uint256"},{"internalType":"address","name":"recipient","type":"address"}],"name":"updateCreateReferral","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"tokenId","type":"uint256"},{"components":[{"internalType":"uint32","name":"royaltyMintSchedule","type":"uint32"},{"internalType":"uint32","name":"royaltyBPS","type":"uint32"},{"internalType":"address","name":"royaltyRecipient","type":"address"}],"internalType":"struct ICreatorRoyaltiesControl.RoyaltyConfiguration","name":"newConfiguration","type":"tuple"}],"name":"updateRoyaltiesForToken","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"tokenId","type":"uint256"},{"internalType":"string","name":"_newURI","type":"string"}],"name":"updateTokenURI","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"newImplementation","type":"address"}],"name":"upgradeTo","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"newImplementation","type":"address"},{"internalType":"bytes","name":"data","type":"bytes"}],"name":"upgradeToAndCall","outputs":[],"stateMutability":"payable","type":"function"},{"inputs":[{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"uri","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"withdraw","outputs":[],"stateMutability":"nonpayable","type":"function"},{"stateMutability":"payable","type":"receive"}]',
        byteCode:
            '0x608060405236156054577f360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc54600090819081906001600160a01b0316368280378136915af43d82803e156050573d90f35b3d90fd5b7f360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc54600090819081906001600160a01b0316368280378136915af43d82803e156050573d90f3fea264697066735822122027660565f0680616f26e00bfb31d23ddde0342242b573171ba22b74b020c766764736f6c63430008110033 ',
        contractAddress: '0x464c77eea43f403b9548b61a2ac749cae954c21b',
      );
}
