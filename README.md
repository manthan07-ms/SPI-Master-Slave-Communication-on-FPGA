# SPI-Master-Slave-Communication-on-FPGA

📌 Project Overview

This project implements a Serial Peripheral Interface (SPI) communication system using Verilog HDL on FPGA. The design includes custom SPI Master and SPI Slave modules, enabling synchronous full-duplex serial data transfer.

User inputs are provided through onboard switches, while received data and status signals are displayed using LEDs.

⚙️ Features

✅ SPI Master and Slave implementation

✅ Full-duplex serial communication

✅ Clock (SCLK) and Chip Select (CS) generation

✅ Switch-based data input

✅ LED-based data and status indication

✅ FPGA hardware verification

🧠 Working Principle

User sets an 8-bit data value using switches.

Pressing the Start key initiates SPI communication.

The SPI Master generates the serial clock (SCLK) and chip select (CS).

Data is transmitted via MOSI and received via MISO.

The SPI Slave captures incoming data and responds simultaneously.

Received data is displayed on green LEDs.

Status LED indicates completion of SPI transfer.

🧩 Module Description
1️⃣ Top Module

SPI

Integrates SPI master and slave

Handles user inputs and outputs

2️⃣ SPI Master Module

SPI_prot

Generates SCLK and CS

Handles MOSI data transmission

Receives MISO data

Provides transfer completion signal

3️⃣ SPI Slave Module

SPI_slave

Receives SCLK, CS, and MOSI

Transmits MISO data

Outputs received data

🔌 SPI Signals Used
Signal	Description
MOSI	Master Out Slave In
MISO	Master In Slave Out
SCLK	Serial Clock
CS	Chip Select
🧪 Testing & Verification

Implemented on FPGA hardware

Verified correct SPI data transfer

Observed received data on LEDs

Confirmed control and timing signals

🛠️ Tools & Technologies

Verilog HDL

Quartus Prime

ModelSim

FPGA Development Board (DE2 / Cyclone)

📂 File Structure
├── SPI.v          // Top module
├── SPI_prot.v     // SPI Master
├── SPI_slave.v    // SPI Slave
├── README.md

🚀 Applications

SPI protocol learning

FPGA serial communication design

RTL and digital design practice

Embedded system interfacing

🎥 Demo Video

A short demonstration video showing SPI master–slave communication, data transfer using switches, and LED-based verification is available here: https://drive.google.com/file/d/1t5pLAa6_FtoTeqKkRi3c3aIJ1Nj9S31W/view?usp=sharing

✍️ Author

Manthan Sabalpara
Electronics & Communication Engineering
FPGA | Verilog | Digital Design

📜 License

This project is open-source and intended for educational use.
