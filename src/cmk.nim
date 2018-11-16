import system
import strutils
import osproc
import ospaths
import yaml.serialization, streams, tables

type Category* = object
  id* : float
  cmd* : string
  des*  : string
    
var file_path: string = getConfigDir() & "comcek/cmd.yaml"

# echo file_path
# $XDG_CONFIG_HOME/.comcek/cmd.yaml

var cmd_file = newFileStream(file_path, fmRead)


proc display_all(run: seq[string]) =

  ## displays all the IDs, commands & descriptions

  var display_data = initTable[string, seq[Category]]()
  load(cmd_file, display_data)
  
  for key, value in display_data:
    
    echo "====="
    echo key
    echo "====="
    
    # echo value
    # # @[(name: "Apple", color: "Red"), (name: "Banana", color: "Yellow")]
    
        
    for val in value:

      # echo " -id: " & val.id.formatFloat(ffdecimal, 1) <-- works but not needed
      echo val.id
      echo " -command: " & val.cmd
      echo " -description: " & val.des
      echo ""
    


proc display(category: string = "", id: float = 0) =

  ## displays each category or each cmd description

  var display_data = initTable[string, seq[Category]]()
  load(cmd_file, display_data)
  
  for key, value in display_data:
    
    if key == category:
        
      for val in value:
        
        # echo " -id: " & val.id.formatFloat(ffdecimal, 1) <-- works but not needed
        echo val.id
        echo " -command: " & val.cmd
        echo " -description: " & val.des
        echo ""
        
        
    for val in value:
        
      if val.id == id:
        
        echo val.id
        echo " -command: " & val.cmd
        echo " -description: " & val.des
        echo ""
      

proc execute(id: float) =

  ## executes the specified cmd
    
  var display_data = initTable[string, seq[Category]]()
  load(cmd_file, display_data)
    
  for key, value in display_data:
    
    for val in value:
        
      if val.id == id:
        
        discard execCmd(val.cmd)
  
  # discard execCmd("ls -la")


when isMainModule:
  import cligen 
  dispatchMulti([ display_all, cmdName="all"],
                [ display, short = { "category": 'c', "id": 'i' } ],
                [ execute, cmdName="exec", short = { "id": 'i' } ] )

cmd_file.close()