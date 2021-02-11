from mlrun import get_or_create_ctx
mlrun_ctx = get_or_create_ctx('ctx')

mlrun_ctx.logger.info("I am running")

mlrun_ctx.log_result('result1',12)