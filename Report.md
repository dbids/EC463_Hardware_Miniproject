# EC463_Hardware_Miniproject
Repo for Hardware Miniproject for EC463 for Devin Bidstrup and Aidan McCall.

## Part 1:
We setup the hardware and installed the OS so that the raspberry pi is able to boot in the Senior Design Laboratory.
![Hardware Setup](/pics/part1_setup.jpg)
![Booted the OS](/pics/part1_setup_2.jpg)

## Part 2:
After installing bluez library, we tested the example scripts for scanning bluetooth and wifi. The pi successfully read a number of bluetooth devices and can detect networks and devices via WiFi.

![Bluetooth Scan](/pics/screen.png)

We ran into an issue where increasing N on a wifi scan resulted in a reoccuring error, "device or resource busy." Initially, we tried increasing the pause time between network scans within the script, which helped but didn't solve the issue. This allowed the program to run much longer, but the error still eventually occurred.

## Part 3:
We ran the wifi scan python file for [a single data point](/data/single_data.json) and [many data points](/data/many_data.json) (though it crashed prior to a full 15 min run due to device resources being busy).  The exported JSON files can be found in our repo.  We then converted these JSONs to csv online using a free tool and imported them into matlab as a .mat data file.  Then we were able to graph the data in matlab and get some intersting results!
