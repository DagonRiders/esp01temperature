t = require("ds18b20")

local function readout(temp)
  if t.sens then
      print("Total number of DS18B20 sensors: ".. #t.sens)
      for addr, temp in pairs(temp) do
        print(temp)
        postTemperature(temp)
      end
  else
    print ("No sensor detected.")
  end
end

function getTemperature()
    -- ESP-01 GPIO Mapping
    gpio0 = 3
    gpio2 = 4
    pin = gpio0
    t:read_temp(readout, pin, t.C)    
end

function postTemperature(temp)
    http.get(WEBDIS_SERVER.."/set/sensor."..SENSOR_ID.."/"..temp, nil, function(code, data)
    if (code < 0) then
      print("SET request failed")
    else
      print(code, data)
    end
  end)
  http.get(WEBDIS_SERVER.."/publish/sensor."..SENSOR_ID.."/"..temp, nil, function(code, data)
    if (code < 0) then
      print("PUBLISH request failed")
    else
      print(code, data)
    end
  end)
end
