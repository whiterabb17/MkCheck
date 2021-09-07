<img align="left" src="https://img.shields.io/badge/Author-s1l3nt78-blueviolet"><a href="https://www.codefactor.io/repository/github/s1l3nt78/mkcheck"><img align="right" src="https://www.codefactor.io/repository/github/s1l3nt78/mkcheck/badge" alt="CodeFactor" /></a><br/>
<p align="center"><img align="center" src="https://img.shields.io/badge/-The_Dead_Bunny_Collective-green"></p>
<br />
<p align="center">
 <img align="center" src="https://raw.githubusercontent.com/s1l3nt78/MkCheck/master/docs/logo.png" />
<br />
 <img align="center" src="https://img.shields.io/github/issues/s1l3nt78/MkCheck" />
 <img align="center" src="https://img.shields.io/github/forks/s1l3nt78/MkCheck" />
 <img align="center" src="https://img.shields.io/github/stars/s1l3nt78/MkCheck" />
 <br />
 <img align="center" src="https://img.shields.io/badge/Codename-BlueChimney-orange" />
 <img align="center" src="https://img.shields.io/badge/Version-4-red" />
</p>
<br />
<br />

# *MkCheck*
<strong><em>s1l3nt78</em></strong>
<br>
<strong><em>~The Dead Bunny Collective~</em></strong>
<br />
*Because exploitation is fun*
<br>
<br>

# Additions
- ChimneyBlue SMB BufferOverflow Exploit (x86/mips)
- RouterOS Jailbreak support for Mikrotik versions 2 - 6.44.3

# *IMPORTANT*

 This software should not be used within any system or
 network for which you do not have permission, nor should
 it be used for any illegal or illicit purposes. The author
 takes no responsibility for any damages that may be caused
 by the software in this repository.

# Installation

	# Oneliner Deb package install:
	$ wget https://github.com/s1l3nt78/MkCheck/releases/download/v4/MkCheck_4.deb; sudo dpkg -i MkCheck_4.deb; mthread

	# Git install:
	$ git clone https://github.com/s1l3nt78/MkCheck
	$ cd MkCheck
	$ sudo bash setup.sh

# Termux

 MkCheck works well in Termux, <strong>provided you are able to run <em>root</em></strong>.
 <br>
 Otherwise Nethunter (<strong><em>with chroot</em> on a non-rooted device</strong>) works as well, without any extra config.
 <br>
To setup up Root Nethunter on a non-rooted android, just follow
<br>
instructions from <a href="https://github.com/s1l3nt78/MkCheck/wiki/Installing-Nethunter-to-run-root-(without-rooted-device)">here</a>.

# Demo

<summary>Click to goto Demo Video</summary>
	
[![Demo Video](https://img.youtube.com/vi/w4szP0lCIPo/0.jpg)](https://www.youtube.com/watch?v=w4szP0lCIPo)

# Functions

  MCheck is used to check MikroTik Routers for:
  <br />
     <em>+<strong>winbox_auth_bypass_creds_disclosure</strong>&ensp; -&ensp;Affected Versions: <strong>6.29</strong> to <strong>6.42</strong>
  <br />
     +<strong>routeros_jailbreak</strong>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; -&ensp;Affected Versions: <strong>2.9.8</strong> to <strong>6.44.3</strong>
 <br />
	 +<strong>Chimney-Blue</strong>&emsp; &emsp; &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; -&ensp;Affected Versions: Up to <strong>6.41.2</strong>
	<br />
 +<strong>ByTheWay</strong> (<em>CVE-2018-14847</em>)&emsp;&emsp;&emsp;&ensp; -&ensp;Affected Versions: <strong>* Longterm: 6.30.1</strong> to <strong>6.40.7</strong></em><br />
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;<strong>* Stable: 6.29</strong> to <strong>6.42.0</strong><br />
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;<strong>* Beta: 6.29rc1</strong> to <strong>6.43rc3</strong><br />
</em>
 <br />
  MkCheck matches IP address to WiFi Access Point Names
  <br />
  If routersploit module confirms if the Mikrotik device is vulnerable and if found - displays login credentials
  <br />
  Which must be entered into <strong><em>scripts/miko.py</em></strong> for MkCheck's auto search module to correctly work.
  <br />
  ByTheWay Root Shell Check The exploit leverages the path traversal vulnerability CVE-2018-14847 to extract the admin password and create  an "option" package
  <br />
  to enable the developer backdoor. Post exploitation the attacker can connect to Telnet or SSH using the root user "devel" with the admin's password.
  <br />
  <br />
    <strong>Change These:</strong>
    <br />
    <strong>****************</strong>
    <br />
    <em> username = "<strong>admin</strong>"
 <br />
         password = "<strong>admin</strong>"</em>
  <br />
  <br />
  The main function auto spawns ssh sessions on the compromised targets to enumerate the Network Access Point name from IP
  <br>
    This is done through <strong><em>command = "/system identity print"</em></strong>
    <br />
    The logs are then automatically cleaned via "<strong><em>/console clear-history</em></strong>" command.
    <br />
    <br />
    You can change the <strong>command</strong> value in order to enumerate different data.
    <br />
    Chaning the command to "<em>/system default-configuration print</em>" will print out the default configuration
    <br />
    <br />
    Once the Network AP Name has been found the attacker can use the IP and login credentials to work with
     Mikrotik Routers config from a web-session.
    <br>
    <br>
  Results are automatically saved in organised in their respective folders
  <br />
  <em>
 - Vulns (MikroTik AP Name Search)
 - RSF (Routersploit Scan Info)
 - btw (ByTheWay Exploit Check)
  </em>
 <br />
 <br />

# Threaded Scans

<strong><em>mthread</em></strong> script added to speed up scans.
 <br />
 Automatic Clean-Up of SSH command history done in order to remain hidden.
 <br />
<br />
 <strong><em>mkcheck</em></strong> will work correctly in termux, but
<br />
 <strong><em>mthread</em></strong> will not as it relies on external xterm windows.
 <br />
 <strong><em>mthread</em></strong> works on windows, if you install VcXsrv (xserver application for windows), this allows xterm windows to launch
 <br />
 Download VcXsrv from <a href="https://ufpr.dl.sourceforge.net/project/vcxsrv/vcxsrv/1.20.8.1/vcxsrv-64.1.20.8.1.installer.exe">here.</a>
 <br />
 Once installed run the following commands from windows terminal:

 	echo "export DISPLAY=<your local ip>:0.0" >> ~/.bashrc
	source ~/.bashrc

<strong>Disable Access Control</strong><em> must be checked</em>
 <br />
 <br />

<h2>Images:</h2>
<p>
	<a><strong>Main Menu</strong></a><br />
<img align="center" src="https://raw.githubusercontent.com/s1l3nt78/MkCheck/master/docs/main.png">
 <br />
 <br />
	<a><strong>MikroTik Auto-Exploiter</strong></a><br />
<img align="center" src="https://raw.githubusercontent.com/s1l3nt78/MkCheck/master/docs/mcheck.png">
<br />
 <br />
	<a><strong>WinBox Authentication Bypass</strong></a><br />
<img align="center" src="https://raw.githubusercontent.com/s1l3nt78/MkCheck/master/docs/rsf.png">
<br />
<br />
	<a><strong>Mthread Using Windows (MikroTik Auto-Exploitation)</strong></a><br />
<img align="center" src="https://raw.githubusercontent.com/s1l3nt78/MkCheck/master/docs/winX.png">
</p>


# USAGE

- The user must create the <strong><em>'scripts/tiks.txt'</em></strong> list with MikroTik Router IP's.
- Easiest way to do this is using Shodan for Vuln searching. WinBox Auth Bypass looks for port <strong>8291</strong>
- nMap can be used as well, using the following command:

<strong><em># sudo nmap -vv -O -A -Pn -p 80,8291 111.11.11.1/24</em></strong>
This will scan the given IP block for all online devices and check if the appropriate services are running and vulnerable

Once the attacker has a specific netblock (eg. 111.69.145.1/24), the best way to create the list is using Microsoft Excel
As you need to fill in the first block (111.69.145.0), then you can drag the coloum to quickly fill the IP's in the colom.
Then copy the entire block into the <strong><em>'scripts/tiks.txt'</em></strong> file.



# USER LICENCE
<br />
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
THIS TOOL WAS MADE FOR EDUCATIONAL PURPOSES. ALL DAMAGE CAUSED BY ANY ACTIVITIES
ILLEGAL OR OTHERWISE, FALLS SOLELY ON THE RESPONSIBILY OF THE USER.
<br />
<br/>

# Other Projects

All information on projects in development can be found <a href="https://s1l3nt78.github.io">here</a>.
For any requests or ideas on current projects please submit an issue request to the corresponding tool.
For ideas or collaboration requests on future projects., contact details can be found on the page.

<em>GitHub Pages can be found here.

- <a href="https://s1l3nt78.github.io/sifter">Sifter</a> = Osint, Recon and Vuln Scanner
- <a href="https://s1l3nt78.github.io/TigerShark">TigerShark</a> = Multi-Tooled Phishing Framework</em>

<br />

	<!--###########_________ VGhlIERlYWQgQnVubnkgQ2x1Yg== _________###########--!>
