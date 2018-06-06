#!/usr/bin/env lsc
#
require! <[vm2 fs child_process deserialize-error]>
{NodeVM} = vm2
{spawn} = child_process
{INFO} = require \./lib/logger

READ_FILE_SYNC = (filepath) -> return "world!!"


READ_FILE_ASYNC = (filepath, cb) ->
  {child} = module
  module.cb = cb
  return child.send evt: \rpc, func: \fs_readFile, args: [filepath]
  # return cb null, "yes!!"

INFO JSON.stringify process.argv

READY = ->
  script = fs.readFileSync process.argv[2]
  vm = new NodeVM do
    console: \inherit
    sandbox: {}
    require:
      external: yes
      builtin: <[fs path]>
      root: \./
      mock:
        fs:
          readFileSync: READ_FILE_SYNC
          readFile: READ_FILE_ASYNC
  vm.run script


PROCESS_RPC_RESPONSE = (m) ->
  {cb} = module
  {func, err, results} = m
  return INFO "missing callback function at module" unless cb?
  return INFO "missing function name" unless func?
  return INFO "only support fs_readFile(), but #{func}" unless func is \fs_readFile
  INFO "invoke callback with (#{err}, #{results})"
  err = deserialize-error err if err?
  return cb err, results


child = module.child = spawn "#{__dirname}/lib/guest-vm-process.ls", [], env: process.env, stdio: [0, 1, 2, 'ipc']
INFO "child process: #{child.pid}"

child.on \message, (m) ->
  INFO "on-message: m => #{JSON.stringify m}"
  {evt, func} = m
  return INFO "ERR: no evt!!" unless evt?
  return READY! if evt is \started
  return PROCESS_RPC_RESPONSE m if evt is \rpc and func is \fs_readFile
  INFO "child event: #{JSON.stringify m}"

# HELLO = -> return console.log "hello"
# setInterval HELLO, 2500ms
