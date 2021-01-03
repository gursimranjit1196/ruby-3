# ruby-3

## Ractor
[benchmarking.rb](Ractor/benchmarking.rb) <br />
In this file, I do Benchmarking by executing Fibbinaci operation on numbers, Sequencially and using Ractor

[pipelining.rb](Ractor/pipelining.rb) <br />
In this file, I do piplining i.e.
- One Ractor that acts as a input which send data to the pipeline's Ractor
- Multiple Ractors are there to take data from pipeline's Ractor. 
- One pipeline Ractor(receive data from input Ractor and yeild to the destination Ractors)