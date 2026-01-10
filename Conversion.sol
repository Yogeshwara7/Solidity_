// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//bytes and uint conversion
contract uintbyte{
//in uint the conversion of hiher order to lower order can only get the higher order numbers in the vlaue section 
uint32 public a= 0x1234;
uint16 public b= uint16(a); // o/p= 0x34


//in uint the conversion when done from lower order to higher order then there will be padding added before the numbers start
uint16 public c=0x1234;
uint32 public d=uint32(c); //o/p be 0x00001234


//as similar like uint the bytes also perform the same

bytes2 e= 0x1234;
bytes1 f= bytes1(e); // o/p= 0x12

bytes1 j= 0x12;
bytes2 k= bytes2(j); //o/p= 0x1200

    
}
