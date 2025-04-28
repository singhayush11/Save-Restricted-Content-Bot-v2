# devgaganin
# Note if you are trying to deploy on vps then directly fill values in ("")

from os import getenv

API_ID = int(getenv("API_ID", "27713051"))
API_HASH = getenv("API_HASH", "952347c8eeaba7a7f20d7f92817fc4f1")
BOT_TOKEN = getenv("BOT_TOKEN", "")
OWNER_ID = int(getenv("OWNER_ID", "7507502628"))
MONGODB_CONNECTION_STRING = getenv("MONGO_DB", "mongodb+srv://Yashwork1999:rvl8goTbWtCfrIu6@cluster0.godehne.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0")
LOG_GROUP = int(getenv("LOG_GROUP", ""))
FORCESUB = getenv("FORCESUB", "")
DEFAULT_SESSION = getenv("DEFAULT_SESSION", "") # this is jkust to help if you dont want to force your bot user to login or if they not interested
