# Entity: PC 

- **File**: Program_Counter.v
## Diagram

![Diagram](Program_Counter.svg "Diagram")
## Ports

| Port name | Direction | Type   | Description |
| --------- | --------- | ------ | ----------- |
| PC_NEXT   | input     | [15:0] |             |
| clk       | input     |        |             |
| rst       | input     |        |             |
| pc        | output    | [15:0] |             |
## Processes
- unnamed: ( @(posedge clk) )
  - **Type:** always
