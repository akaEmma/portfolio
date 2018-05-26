# This is a web treasure hunt assignment.
# start at http://py4e-data.dr-chuck.net/known_by_Fikret.html
# on each subsequent web page, grab the 'pos'th link
# Do that 'count' times, getting the addresses right each time.

# import everything
import urllib.request, urllib.parse, urllib.error
from bs4 import BeautifulSoup
import ssl
# Ignore SSL certificate errors
ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

# get input from user
# default to the start page for this assignment so I don't have to type it in all the time
testurl = 'http://py4e-data.dr-chuck.net/known_by_Fikret.html'
url = input('Enter URL: ')
if len(url) < 1 : url = 'http://py4e-data.dr-chuck.net/known_by_Jonny.html'
count = int(input('Enter count: '))
pos = int(input('Enter position: ')) - 1
i = int()

print(url) #print the starting page

for i in range(1, count + 1) :
    html = urllib.request.urlopen(url, context=ctx).read() #get first/next file
    soup = BeautifulSoup(html, 'html.parser') #make it into soup
    tags = soup('a') # Retrieve the anchor tags
    tag = tags[pos]     # retrieve the 'pos'th anchor tag
    url = tag.get('href')    #extract just the url from it
    print(url)    #print it out and go around again until i = count.
