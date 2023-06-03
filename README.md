# aqueo

## Description
This project provides a convenient way to set up and start an `RTSP` (Real-Time Streaming Protocol) server for streaming webcam video. It includes two bash scripts: `aqueo_temp.sh` for manually starting the server and `aqueo_auto.sh` for creating an autostarting server.

---

## Use Cases
- Stream webcam video over RTSP for surveillance purposes.
- Integrate the RTSP server with other applications or services that require video streaming.

---

## Usage
### aqueo_temp.sh (Temporary Server)
1. Run the script: `./aqueo_temp.sh`
2. Follow the prompts to enter the required information:
   - Device (webcam) name or path
   - Port number
   - Username
   - Password
3. The RTSP server will start running in the background.
4. To stop the server, press Enter when prompted.

### aqueo_auto.sh (Autostarting Server)
1. Make sure you have previously run `aqueo_auto.sh` to create the configuration file.
2. Add `aqueo_auto.sh` to your system's startup process (e.g., using init.d, systemd, or startup applications). Refer to the documentation for your specific operating system.
3. The RTSP server will start automatically during system startup using the previously configured parameters.

---

## Prerequisites
- The `v4l2rtspserver` command-line tool needs to be installed on your system. You can find installation instructions in the project documentation or [the v4l2rtspserver official repository](https://github.com/mpromonet/v4l2rtspserver).

---

## Flowchart
#### `aqueo_temp.sh`
```
┌─ Start Program
│
├─ [Enter Device Information]
│   ├─ [Enter device (webcam) name or path]
│   ├─ [Enter port number]
│   ├─ [Enter username]
│   └─ [Enter password]
│
├─ [Start RTSP Server]
│   ├─ [Starting RTSP server...]
│   ├─ [nohup v4l2rtspserver...]
│   └─ [RTSP server started.]
│
├─ [Write Server Information]
│   ├─ [Device: $device]
│   ├─ [Port: $port]
│   ├─ [Username: $username]
│   └─ [Password: $password]
│
└─ [Stop RTSP Server]
    ├─ [Press Enter to stop the RTSP server.]
    ├─ [Stopping RTSP server...]
    ├─ [killall v4l2rtspserver]
    └─ [RTSP server stopped.]
```

#### `aqueo_auto.sh`
```
┌─ Start Program
│
├─ [Check Configuration File]
│   ├─ [Check if the configuration file exists]
│   ├─ [Read configuration parameters from the file]
│   │   ├─ [device]
│   │   ├─ [port]
│   │   ├─ [username]
│   │   └─ [password]
│   └─ [Start RTSP Server]
│       ├─ [Starting RTSP server...]
│       ├─ [nohup v4l2rtspserver...]
│       └─ [RTSP server started.]
│
└─ End Program
```

---

## Security and Privacy Concerns
The password is stored **PLAINTEXT** in the user's home directory. This is typically considered a risky practice.

### Configuration
- Ensure that you set a secure password to prevent unauthorized access to your webcam stream.
- Make sure to secure the server and restrict access to trusted users or networks to avoid potential privacy risks.

---

## Limitations
- The script assumes that the `v4l2rtspserver` command-line tool is installed and available on the system.
- Compatibility with different webcam devices may vary, and not all devices may be supported.
- The scripts are intended for Linux systems and may require adjustments for other operating systems.

---

## [Disclaimer](DISCLAIMER)
**This software is provided "as is" and without warranty of any kind**, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose and noninfringement. In no event shall the authors or copyright holders be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the software or the use or other dealings in the software.

**The authors do not endorse or support any harmful or malicious activities** that may be carried out with the software. It is the user's responsibility to ensure that their use of the software complies with all applicable laws and regulations.

---

## License

These files released under the [MIT License](LICENSE).
