
# 🖧 Computer Networking Notes

_A system that connects numerous independent computers in order to share information & resources._

---

## 📍 IP Address

**IP → Internet Protocol** (Rules)

- **Public IP** → Helps to connect with the Internet
- **Private IP** → Used in an internal network
- **IPv4** → 2³² = 4.3 billion addresses
- **IPv6** → 2¹²⁸ = Huge number
- **Static IP** → Never changes
- **Dynamic IP** → Periodically changes

---

## 📍 MAC Address

**MAC → Media Access Control**

- Physical address provided by manufacturer
- You **cannot change** it
- **48 bits**
- Router recognizes devices via MAC

📌 **Note:** Nowadays MAC can be spoofed using apps or terminal commands (MAC Spoofing).

---

## 🧭 Types of Networks

- LAN
- PAN
- MAN
- WAN

---

## 📊 OSI Model vs TCP/IP Model

### OSI Model

| Layer | Name         | Examples                                      |
|-------|--------------|-----------------------------------------------|
| 7     | Application  | HTTP, FTP, SMTP, NFS, Telnet                  |
| 6     | Presentation | JPG, PNG, GIF, ASCII, CSS, HTML              |
| 5     | Session      | RPS, TLS, SCP                                 |
| 4     | Transport    | TCP (connection-oriented), UDP (connection-less) |
| 3     | Network      | IPv4, IPv6, ICMP, ARP                         |
| 2     | Data Link    | MAC, ATM, HDLC, Frame Relay                   |
| 1     | Physical     | Ethernet, USB, DSL, ISDN                     |

### TCP/IP Model

| Layer | Name                | Examples                       |
|-------|---------------------|--------------------------------|
| 4     | Application         | HTTP, FTP, SMTP, Telnet, DNS   |
| 3     | Transport           | UDP, TCP                       |
| 2     | Network/Internet    | IP, ICMP, ARP                  |
| 1     | Network Interface   | Ethernet, Frame Relay          |

---

## 🔗 Networking Concepts

- **DNS** – Converts domain names into IP addresses.
- **DHCP** – Dynamic assignment of temporary IPs to devices.
- **ARP** – Address Resolution Protocol (IP → MAC)
- **NAT** – Network Address Translation (Private ↔ Public IP)

---

## 🛡️ Security & Devices

- **VPN** – Encrypted tunnel to hide IP address
- **Firewall** – Network security system
- **Router** – Connects different form networks
- **Switch** – Connects devices on same/different networks
- **Hub** – Similar to switch but sends data to all ports (Broadcast)

---

✍️ _Inspired from Certified Ethical Hacker materials & Sagar Ajay Rahalkar’s guide._
