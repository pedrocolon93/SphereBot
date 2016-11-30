from flask import Flask
import sys,time,serial

app = Flask(__name__)

@app.route("/toggle",methods = ['POST', 'GET'])
def hello():
    global ser
    ser.write('o')
    return "Toggling button"

ser = None
if __name__ == "__main__":
    global ser
    port = "/dev/ttyUSB0"
    speed = "115200"
    #
    # open serial port
    #
    ser = serial.Serial(port, speed)
    ser.setDTR()
    #
    # flush buffers
    #
    ser.flushInput()
    ser.flushOutput()
    app.run()