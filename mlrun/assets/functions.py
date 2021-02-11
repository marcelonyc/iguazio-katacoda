import time
from mlrun.execution import MLClientCtx
from mlrun.datastore import DataItem



def training(
    context: MLClientCtx,
    p1: int = 1,
    p2: int = 2
) -> None:
    """Train a model.

    :param context: The runtime context object.
    :param p1: A model parameter.
    :param p2: Another model parameter.
    """
    # access input metadata, values, and inputs
    print(f'Run: {context.name} (uid={context.uid})')
    print(f'Params: p1={p1}, p2={p2}')
    context.logger.info('started training')
    
    # <insert training code here>
    
    # log the run results (scalar values)
    context.log_result('accuracy', p1 * 2)
    context.log_result('loss', p1 * 3)
    
    # add a lable/tag to this run 
    context.set_label('category', 'tests')
    
    # log a simple artifact + label the artifact 
    # If you want to upload a local file to the artifact repo add src_path=<local-path>
    context.log_artifact('model', 
                          body=b'abc is 123', 
                          local_path='model.txt', 
                          labels={'framework': 'tfkeras'})


def validation(
    context: MLClientCtx,
    model: DataItem
) -> None:
    """Model validation.
    
    Dummy validation function.
    
    :param context: The runtime context object.
    :param model: The extimated model object.
    """
    # access input metadata, values, files, and secrets (passwords)
    print(f'Run: {context.name} (uid={context.uid})')
    print(f'file - {model.url}:\n{model.get()}\n')
    context.logger.info('started validation')    
    context.log_artifact('validation', 
                         body=b'<b> validated </b>', 
                         format='html')

