# EC463_Hardware_Miniproject
Repo for Hardware Miniproject for EC463 for Devin Bidstrup and Aidan McCall.

## Part 1:
We setup the hardware and installed the OS so that the raspberry pi is able to boot in the Senior Design Laboratory.
![Hardware Setup](/pics/part1_setup.jpg)
![Booted the OS](/pics/part1_setup_2.jpg)

## Part 2:
After installing bluez library, we tested the example scripts for scanning bluetooth and wifi. The pi successfully read a number of bluetooth devices and can detect networks and devices via WiFi.

![Bluetooth Scan](/pics/screen.png)

We ran into an issue where increasing N on a wifi scan resulted in a reoccuring error, "device or resource busy." Initially, we tried increasing the pause time between network scans within the script, which helped but didn't completely solve the issue: the error still occurs, but the program can run much longer. With this fix, we were able to let it run for at least the required 15 minutes.

## Part 3:
We ran the wifi scan python file for [a single data point](/data/single_data.json), [many data points](/data/many_data.json), and a [fifteen minute period](/data/data_set_3.json). The exported JSON files can be found in our repo. We then converted these JSONs to csv online using a [free tool](https://www.convertcsv.com/json-to-csv.htm) and imported them into matlab as a .mat data file. Then we were able to graph the data in matlab and get some intersting results!

In Matlab we wrote [a script](/matlab/wifi_dat_proc.m) in order to parse the .mat file into seperate arrays. Then we decided to iterate over those arrays and find all the times that a given essid occured and count them within the script.  Our script is far from efficient with an n^2 asymptotic complexity, but it still worked for the data from our 15 minute run. In theory, using this information we could place the raspberry pi close to a highway and reduce the delay time in the wifi_scan.py script. Then by counting the number of times that a given car registered, you could estimate the speed of the car, and the amount of traffic given the relative congestion. In addition. with the way we imported the data into matlab, you could make many further graphs which demonstrate different network features exported into the JSON file depending on the use case.

A sample output of our graph is shown here:

![Matlab Occurance Graph1](/pics/long_network_names.jpg)

![Matlab Occurance Graph2](/pics/many_network_names.jpg)

In our sample a lot of BU networks show up, but these could be manually eliminated while parsing the data.  In fact, any in-place outliers which were not the moving cars would be easily detectable on this graph, and therefore would be easier to remove.

However, now that the data has been parsed, we can look at some interesting aspects of the networks, but rather than just generic, time-ordered information of the whole dataset, we can look at the time-ordered information of each network individually. This gives us an objective view of the data as well as direct comparisons between the networks. One example (which I find the most interesting because it's a physical measurement) is viewing the signal strength of each network over that 15 minute polling period.

![Matlab Signal Level Graph](/pics/long_signal_levels.jpg)

Notably, the smaller networks detected have much less oscillation compared to the large BU networks that have much heavier traffic. Additionally some interesting things we can look at from this data is the channel that the network was read through at each poll, and the frequency the network operates at. We found it odd that the frequency of the BU networks is constantly changing throughout the scan period. We hypothesized that the pi could be accessing different network grid points, and maybe the operation of each node varies slightly.

![Matlab Frequency Graph](/pics/long_freq.jpg)

![Matlab Channels Graph](/pics/long_channel.jpg)
