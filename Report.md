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
We ran the wifi scan python file for [a single data point](/data/single_data.json), [many data points](/data/many_data.json), and a [fifteen minute period](/data/data_set_3.json).  The exported JSON files can be found in our repo.  We then converted these JSONs to csv online using a free tool and imported them into matlab as a .mat data file.  Then we were able to graph the data in matlab and get some intersting results!

In Matlab we wrote [a script](/matlab/wifi_data_proc.m) in order to parse the .mat file into seperate arrays.  Then we decided to iterate over those arrays and find all the times that a given essid occured and count them.  In theory, using this information we could place the rasberry pi close to a highway and reduce the delay time in the wifi_scan.py script.  Then by counting the number of times that a given car registered, you could estimate the speed of the car, and the amount of traffic given the relative congestion.  In addition. with the way we imported the data into matlab, you could make many further graphs which demonstrate different network features exported into the JSON file depending on the use case.

A sample output of our graph is shown here:
![Matlab Occurance Graph](/pics/matlab.jpg)
In our sample a lot of BU networks show up, but these could be manually eliminated while parsing the data.  In fact, any in-place outliers which were not the moving cars would be easily detectable on this graph, and therefore would be easier to remove.

Hopefully this presents on way that we can use the data presented by these scripts, though there are obviously many more!
