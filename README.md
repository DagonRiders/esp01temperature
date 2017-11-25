# esp01temperature
ESP-01S based temperature sensor

## Dependencies

This has been tested with the following modules enabled in the NodeMCU build using the [cloud NodeMCU build service](https://nodemcu-build.com):

```
bit dht file gpio http i2c net node ow rc sjson spi tmr uart wifi
```

This reposity includes the *lua* version (not the C version provided by the cloud build service) of [ds18b20](https://github.com/nodemcu/nodemcu-firmware/tree/master/lua_modules/ds18b20). You must *not* enable ds18b20 when building the NodeMCU firmware.
