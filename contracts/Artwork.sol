//SPDX-License-Identifier: Unlicense
pragma solidity 0.8.4;


import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract Artwork is ERC721 {
   
   uint253 public tokenCounter;
   
   constructor(string memory name, string memory symbol) ERC721(name, symbol) {
      tokenCounter = 0;
   }
}