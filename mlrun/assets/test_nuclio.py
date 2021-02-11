from mlrun import code_to_function


fn = code_to_function('return-text', kind='nuclio', filename="nuclio_example.py")

fn.deploy(project="remote-test",dashboard='http://localhost:8070')