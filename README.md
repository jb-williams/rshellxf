# rshellxf
## Proof of Concept Go Reverse Shell
**!!! ONLY RUN ON SYSTEMS WHERE YOU HAVE EXPRESS PERMISSION TO DO SO !!!**

**!!! RUN AT OWN RIST !!!**

* *Makefile only tested on Debian Linux*
* *In `main.go` you can change windows interaction from `cmd` to `powershell` by switching the commented code at lines `33-34`*

* Linux     - Tested    - Interactive Shell Works
* MAC       - Untested  - Untested
* Windows   - Tested    - Can run Commands for cmd & powershell versions but not very interactive:
    * `.dll` is un-tested

* **REQUIREMENTS**:
    * `golang` >= 1.20 , >= 1.19 may work but not tested
    * `x86_64-w64-mingw32-gcc` (To compile to Windows from Linux):
        * Not on Debian, packagename `gcc-mingw-w64-x86-64-win32`, Only on Kali can you make the `.dll`(as far as I know atm) 
    * from go `go-xcode` to compile to MAC

*note* \
*I tried to make options for Linux, MAC, and Windows(.exe and .dll) and remove debugging tags, and hiding Windows' GUI window.*

## Build
**!!! Always run `make clean` before rebuilding any of the executables !!!**
* `make linux` - To build for Linux:
    * `cd` to the `rshellxf` directory
    * `make linux`
    * Resets `main.go` for new input
    * enter `LHOST` ex: `10.10.10.10`
    * enter `LPORT` ex: `1234`

* `make darwin` - To build for Linux:
    * `cd` to the `rshellxf` directory
    * `make linux`
    * Resets `main.go` for new input
    * enter `LHOST` ex: `10.10.10.10`
    * enter `LPORT` ex: `1234`

* `make windows` - To build for Windows:
    * `cd` to the `rshellxf` directory
    * `make windows`
    * Resets `main.go` for new input
    * enter `LHOST` ex: `10.10.10.10`
    * enter `LPORT` ex: `1234`

* `make all` - To build for All:
    * `cd` to the `rshellxf` directory
    * `make all`
    * Resets `main.go` for new input
    * enter `LHOST` ex: `10.10.10.10`
    * enter `LPORT` ex: `1234`

* `make clean` - To Clean:
    * `cd` to the `rshellxf` directory
    * `make clean`
    * Removes **ALL** executables and resets `main.go` for new input
        
* `make install-go` - To Install Go:
    * `cd` to the `rshellxf` directory
    * `make install-go`
    * Installs Golang to `/usr/local/go`
