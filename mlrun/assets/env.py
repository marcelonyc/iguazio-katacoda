import os

os.environ['MLRUN_DBPATH'] = f'http://localhost:8080'
os.environ['MLRUN_NUCLIO_DASHBOARD_URL'] = "nuclio-data"
