import invoke
import subprocess
from sys import stdout

def Execute(command_list, is_background=False):
  
  print('Execute command:\n' + ' '.join(command_list))

  process = subprocess.Popen(command_list, stdout=subprocess.PIPE,
                             stderr=subprocess.STDOUT, universal_newlines=True)
  if not is_background:
    out_line = ''
    while True:
      try:
        out_line = process.stdout.readline()
      except:
        out_line = '\n'
      if out_line == '' and process.poll() is not None:
        break
      stdout.write(out_line)
      stdout.flush()
  return process


@invoke.task()
def single_test(c):
    #Execute("python -m robot -d ./output -v wait_speed:1 single_test.robot")
    Execute("robot -d ./output -v wait_speed:1 single_test.robot")

@invoke.task()
def batch_test(c):
    print("This Test is not ready yet")

@invoke.task()
def cleanup(c):
    Execute("robot -d ./output cleanup.robot")