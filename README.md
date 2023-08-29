# **Problem Statement: Single Bit Error Correction and Detection using Hamming Code** 

<br/> 
Hamming Code: Hamming code is an error-detection method that
can detect some errors, but it is only capable of
single error correction . This error detection
method is suitable for use in situations where there
is few randomized mistake. Method Hamming
Code inserts (n + 1) check bits into 2n data bits.
This method uses XOR (Exclusive - OR) in the
error detection process

## Architecture
![architecture](https://github.com/Pavanpm199/ADLD_01fe20bec199/assets/84024750/4a53bb7c-d7be-47f5-a41d-eb820692399b)

## Encoder
The encoder takes a 128-bit input data and generates a 136-bit output data with 8 parity bits.
The encoder works as follows:
* The input data is first checked for parity.If any of the 8 parity bits is incorrect,the encoder will add the necessary parity bits to make the data correct.
* After the input data has been verified to have correct parity,the encoder will add 8 parity bits to the data to generate the output data.

## Decoder:

* The decoder receives  a serial input of data and calculates parity bits .

* After calculating parity bits,it tries to match bits to value zero.If the equals to zero, it means that there is no error in received data and transmit the same data.

* If not equal  to zero then ,it flips that bit to either from 0 to 1 or from 1 to 0 depending on the value of parity in that location.

* After flipping the bit,in the  data extraction stage original data and parity bits are separated and original data is transmitted to output port.

## Finite State Machine:

### Encoder FSM:
![encoderfsm](https://github.com/Pavanpm199/ADLD_01fe20bec199/assets/84024750/6cdf0a85-0886-493b-8a6f-337779c9964a)
* Idle:The initial state, where the encoder waits for the start signal.
* Check bits: The state where the encoder checks the input data for parity errors.
* Add check bits: The state where the encoder adds the necessary parity bits to the input data.
* Serial out: The state where the encoder generates the output data and outputs it.

### Decoder FSM:
![decoderfsm](https://github.com/Pavanpm199/ADLD_01fe20bec199/assets/84024750/5ef3a8df-2c77-494b-8019-d0c6b194e2bb)
* Idle :the decoder is waiting for the start signal to be asserted. When start is asserted, the decoder transitions to the receive state.

* Receive state : the decoder receives the input data one bit at a time and stores it in the shift register. The decoder counter register is used to keep track of the number of bits received. When all 136 bits have been received, the decoder transitions to the xor_opn state.

* Xor_operattion : the decoder calculates the parity bits using a series of XOR operations on the bits stored in the shift register. The calculated parity bits are stored in the parity register, and the decoder transitions to the error_flip state.

 * Error_flip : the decoder compares the calculated parity bits with the parity bits stored in the shift register. If there is a mismatch, the error signal is set and the decoder transitions to the extract state. Otherwise, the decoder transitions directly to the extract state.

* Extract state : the decoder extracts the 128 bits of data from the shift register and stores them in the dout register. The sig_out signal is set to indicate that the output data is valid, and the decoder transitions back to the idle state.

### Position of parity bits:
![Screenshot (421)](https://github.com/Pavanpm199/ADLD_01fe20bec199/assets/84024750/f804937a-f6a6-4975-9069-71b9304b6e41)

## Results : 
![Screenshot (397)](https://github.com/Pavanpm199/ADLD_01fe20bec199/assets/84024750/c6d1af66-311f-4528-9d00-f31f2be1130d)

