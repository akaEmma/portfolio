# set up the working environment

import urllib.request, urllib.parse, urllib.error
import requests
import json

# store pathnames to be used in the assignment
test = 'http://py4e-data.dr-chuck.net/comments_42.json'
actual = 'http://py4e-data.dr-chuck.net/comments_100677.json'

xpath = input('Enter location: ')    #get the pathname from user
if len(xpath) < 1: xpath = actual    # for testing don't enter name
print('Retrieving', xpath)           #let the user know

response = urllib.request.urlopen(xpath)  # download the file
data = response.read()

print('Retrieved', len(data), 'characters') #for assignment

info = json.loads(data)  #read it

print('Count: ', len(info)) # keep user informed
count = 0
for comment in info["comments"]: #get and track the total
    count += comment["count"]
print('Total count:', count)
