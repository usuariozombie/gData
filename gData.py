# -*- coding: utf-8 -*-

import json, math, requests, time

class JSON():
	def Read(FilePath):
		with open(FilePath, "r", encoding = "utf-8") as JSONFile: Data = json.load(JSONFile)
		JSONFile.close()
		return Data
	def Write(FilePath, Data):
		with open(FilePath, "w") as JSONFile: json.dump(Data, JSONFile, indent = "\t")

APIData = requests.get("https://yourapi.com").json()
CharData = APIData["charData"]
PlayerCount = APIData["playerCount"]

LocalDB = JSON.Read("playerData.json")

for Character in CharData:
	if Character["id"] in LocalDB:
		if Character["charname"] in LocalDB[Character["id"]]:
			if LocalDB[Character["id"]][Character["charname"]]["faction"] != Character["faction"]:
				LocalDB[Character["id"]][Character["charname"]]["faction"] = Character["faction"]

			if LocalDB[Character["id"]][Character["charname"]]["flags"] != Character["flags"]:
				LocalDB[Character["id"]][Character["charname"]]["flags"] = Character["flags"]

			if LocalDB[Character["id"]][Character["charname"]]["health"] != Character["health"]:
				LocalDB[Character["id"]][Character["charname"]]["health"] = Character["health"]

			if LocalDB[Character["id"]][Character["charname"]]["model"] != Character["model"]:
				LocalDB[Character["id"]][Character["charname"]]["model"] = Character["model"]

		else: LocalDB[Character["id"]][Character["charname"]] = Character
			
	else:
		LocalDB[Character["id"]] = {}
		LocalDB[Character["id"]][Character["charname"]] = Character

JSON.Write("playerData.json", LocalDB)