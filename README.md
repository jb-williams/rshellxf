# rshellxf
## Proof of Concept Go Reverse Shell
**ONLY RUN ON SYSTEMS WHERE YOU HAVE EXPRESS PERMISSION TO DO SO** \
**RUN AT OWN RIST**

*UN-TESTED AT THE MOMENT*
* *Makefile only tested on Debian Linux*
* *In `main.go` you can change windows interaction from `cmd` to `powershell` by switching the commented code at lines `33-34`*

* **REQUIREMENTS**:
    * `golang` >= 1.20 , >= 1.19 may work but not tested
    * `x86_64-w64-mingw32-gcc` (To compile to Windows from Linux)

*note* \
*I tried to make options for Linux, MAC, and Windows(.exe and .dll) and remove debugging tags, and hiding Windows' GUI window.*

## Build
* linux - To build for Linux:
    * `cd` to the `rshellxf` directory
    * `make linux`
    * Resets `main.go` for new input
    * enter `LHOST` ex: `10.10.10.10`
    * enter `LPORT` ex: `1234`

* darwin - To build for Linux:
    * `cd` to the `rshellxf` directory
    * `make linux`
    * Resets `main.go` for new input
    * enter `LHOST` ex: `10.10.10.10`
    * enter `LPORT` ex: `1234`

* windows - To build for Windows:
    * `cd` to the `rshellxf` directory
    * `make windows`
    * Resets `main.go` for new input
    * enter `LHOST` ex: `10.10.10.10`
    * enter `LPORT` ex: `1234`

* all - To build for All:
    * `cd` to the `rshellxf` directory
    * `make all`
    * Resets `main.go` for new input
    * enter `LHOST` ex: `10.10.10.10`
    * enter `LPORT` ex: `1234`

* clean - To Clean:
    * `cd` to the `rshellxf` directory
    * `make clean`
    * Removes **ALL** executables and resets `main.go` for new input
