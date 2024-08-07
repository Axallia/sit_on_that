import zipfile
from zipfile import ZipFile
import os
from os.path import basename
import json

PathDP = os.getcwd()

def stripComments(rawString):
    endString = ""
    isComment = False
    for character in rawString:
        try:
            match character:
                case "#":
                    isComment = True
                case "\n":
                    isComment = False
                    endString += "\n"
                case _:
                    if not isComment:
                        endString += character
        except:
            pass
    return endString
    

try:
    packPropertiesFile = open("packProperties.json", 'r', encoding='utf-8').read()
    #print(stripComments(packPropertiesFile))
    packProperties = json.loads(stripComments(packPropertiesFile))
    #print(packProperties['type'])
    #packPropertiesFile.close()

    try:
        match packProperties['type']:
            case "DEFAULT":
                archive = basename(PathDP) + ".zip"
                
            case "ADD_SUFFIX":
                try:
                    archive = basename(PathDP) + packProperties['name_value'] + ".zip"
                except:
                    print(".json config value \"name_value\" is unset/empty/incorrect. Please change it.")
                    archive = basename(PathDP) + ".zip"

            case "ADD_PREFFIX":
                try:
                    archive = packProperties['name_value'] + basename(PathDP) + ".zip"
                except:
                    print(".json config value \"name_value\" is unset/empty/incorrect. Please change it.")
                    archive = basename(PathDP) + ".zip"
                    
            case "SET_NAME":
                try:
                    archive = packProperties['name_value'] + ".zip"
                except:
                    print(".json config value \"name_value\" is unset/empty/incorrect. Please change it.")
                    archive = "empty.zip"
                    
            case _:
                print("Unknown type in \"packProperties\" file. Sets to default value.")
                archive = basename(PathDP) + ".zip"
                
    except:
        print(".json config value \"type\" is unset/empty/incorrect. Please change it.")
        archive = basename(PathDP) + ".zip"
    
    print(".json config file has been sucessfully found and loaded!")

except:
    print(".json config file has been not found, or currupted/incorrect!\nIf you do not want to change name of your pack manualy every single time, please create/fix it.")
    archive = basename(PathDP) + ".zip"
    

defaultDPfiles = ["pack.mcmeta", "pack.png"]

#archive = basename(PathRP) + ".zip"

with ZipFile(archive, 'w', zipfile.ZIP_DEFLATED) as zipObj:
    #write default files
    for file in defaultDPfiles:
        try:
            zipObj.write(file)
        except:
            if file == "pack.mcmeta":
                print("One necessary datapack file are missing! It can cause problems!")
    
    #write everything in assets folder
    for folderName, subfolders, filenames in os.walk(PathDP + "\\data"):
        for filename in filenames:
            exitloop = False
            for extention in packProperties['banned_extentions']:
                #print(extention)
                #print(filename, filename.endswith(extention), extention)
                if extention == '' and not ('.' in filename):
                    continue
                if filename.endswith('.'+extention):
                    exitloop = True
            
            for keyword in packProperties['banned_keywords']:
                #print(filename, (keyword in filename), keyword)
                #print(keyword)
                if keyword in filename:
                    exitloop = True
                    
            if exitloop:
                continue
            filePath = os.path.join(folderName, filename)
            zipObj.write(filePath, filePath.replace(PathDP, ""))
