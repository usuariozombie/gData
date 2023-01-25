# <img src="https://upload.wikimedia.org/wikipedia/commons/3/34/Gmod_logo.png" height=50></img><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Python-logo-notext.svg/1869px-Python-logo-notext.svg.png" height=50></img>PyMod
A way to post and get data from your Garry's Mod server, sending content as json to your API endpoint, and then collecting it with a python request, it has to be used in an helix server, making it really easy to get data from players.

## Installation

You will need [Python3](https://www.python.org) and having installed requests module in order to get the data. Is also important to remember that you will need to have configured your endpoint. Once you have all this requirements satisfied, you will just need to move the sh_gdata to the gamemode/schemaname/plugins folder.

If you want to build a discord bot, you will need discord.py or nextcord module too.

```bash
pip install requests
```
```bash
pip install discord
```
```bash
pip install nextcord
```

## Usage

```python
import discord
import json
import requests

```

You will be able to extract data though a python app, discord bot or in the web API, being able to use all of it even to interact with the server.

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.
