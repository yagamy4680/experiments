#!/usr/bin/env lsc
#
require! <[fs serialize-error]>
{INFO} = require \./logger

INFO "guest-vm-process is initiated..."


RPC_FS_READFILE = (m) ->
  {args, evt, func} = m
  [filepath] = args
  (err, results) <- fs.readFile filepath
  INFO "err: #{err}"
  INFO "results: #{results}"
  err = serialize-error err if err?
  xs = {evt, func, err, results}
  INFO "xs => #{JSON.stringify xs}"
  return process.send xs


process.on \message, (m) ->
  INFO "on-message: m => #{JSON.stringify m}"
  {evt, func} = m
  return RPC_FS_READFILE m if evt is \rpc and func is \fs_readFile

process.send {evt: \started}