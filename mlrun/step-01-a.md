You should be able to connect in a few minutes to: 

## Open your first Notebook
* Go to the <a href="https://[[HOST_SUBDOMAIN]]-30040-[[KATACODA_HOST]].environments.katacoda.com/lab/tree/mlrun/mlrun_course/01-the-basics.ipynb#sec1">Jupyter Notebooks tab</a>

### Lets review some of the code
* We first import the required mlrun modules
* The configuration setting mlconf.dbpath, indicates the location of the mlrun-api service. Since we are runnign in a kubernetes cluster, this address is internal to the cluster. This endpoint is also available externally. We will review that later.
* Take note of the cell with the comment ***# nuclio: start-code*** 
    - The cell with ***# nuclio: start-code*** ends your execution code block.
    - As you see, in this case, our code is in the same Notebook we are working with, but it can be stored in anothe notebook or python file

Hit Continue
