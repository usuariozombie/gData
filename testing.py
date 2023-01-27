import requests
import json

request = requests.get('https://api.usuariozombie.com/gmod/ver')
data = json.loads(request.text)
playerCount = data[0]['playerCount']

# Now we save the data in a json file.

localdata = []

with open("playerData.json") as fp:
    localdata = json.load(fp)

charData = data[1]['charData']

# read json file to check if the data is already saved

jsondata = json.loads(open("playerData.json").read())

for character in charData:
    # save data in json file and dont delete the old data
    # check all jsondata index to see if the data is already saved and if it isn't in any index then save it
    i = 0
    for index in range(len(jsondata)):
        if character in jsondata[index]:
            i = 1
            break
        
    if i == 0:
            localdata.append({character: charData[character]})
            with open("playerData.json", 'w') as json_file:
                json.dump(localdata, json_file,
                          indent=4,
                          separators=(',', ': '))
                json_file.close()


# Now we print the data for each user.

for character in jsondata:
	for user in character:
		print(user, character[user]['faction'], character[user]['steamid'], character[user]['position'])
