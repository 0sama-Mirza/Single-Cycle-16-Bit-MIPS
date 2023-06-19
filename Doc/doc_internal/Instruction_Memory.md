# Entity: Instr_Mem 

- **File**: Instruction_Memory.v
## Diagram

![Diagram](Instruction_Memory.svg "Diagram")
## Ports

| Port name | Direction | Type   | Description |
| --------- | --------- | ------ | ----------- |
| rst       | input     |        |             |
| A         | input     | [15:0] |             |
| RD        | output    | [15:0] |             |
## Signals

| Name | Type       | Description |
| ---- | ---------- | ----------- |
| mem  | reg [15:0] |             |
