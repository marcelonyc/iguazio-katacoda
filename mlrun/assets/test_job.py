import env

artifact_path = "/User/artifacts"

from mlrun import code_to_function

fn = code_to_function('a-func-remote', kind='job', filename="print_some.py")
#fn.spec.command = "/bin/ls"

#fn.spec.base_image = 'python:3.6-jessie'
#fn.deploy()

fn.run(project="remote-test", artifact_path=artifact_path, local=True)
