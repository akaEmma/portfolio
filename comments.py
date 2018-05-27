#You are to look through all the <comment> tags and find the <count> values sum the numbers. The closest sample code that shows how to parse XML is geoxml.py. But since the nesting of the elements in our data is different than the data we are parsing in that sample code you will have to make real changes to the code.

# set up the working environment

import urllib.request, urllib.parse, urllib.error
import xml.etree.ElementTree as ET
import requests

# store pathnames to be used in the assignment
test = 'http://py4e-data.dr-chuck.net/comments_42.xml'
actual = 'http://py4e-data.dr-chuck.net/comments_100676.xml'

xpath = input('Enter location: ')    #get the pathname from user
if len(xpath) < 1: xpath = actual    # for testing don't enter name
print('Retrieving', xpath)           #let the user know

response = urllib.request.urlopen(xpath)  # download the file
data = response.read()
print('Retrieved', len(data), 'characters') #for assignment
tree = ET.fromstring(data)                  #put it in a tree
counts = tree.findall('.//count')           # find what looking for
print('Count:', len(counts))                # how many we have

tot = 0 # assignment var
for count in counts :
    tot += int(count.text) #get the contents of 'count', use as int
print("Sum:" + str(tot))  # print total outside loop and done.
