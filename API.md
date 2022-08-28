# API

## IMPORT

```lua
local Phantum = exports['phantum']:getSharedObject();
```

## USE THREAD

```lua
-- SYNTAX: 
Phantum.Thread(function callback);
-- EXAMPLE:
Phantum.Thread(function()
    print('Thread created');
end)
```

## USE TICK

```lua
-- SYNTAX: 
Phantum.Tick(function callback, int wait);
-- EXAMPLE:
Phantum.Tick(function()
    print('Tick Created');
end, 15 * 60 * 1000)
```