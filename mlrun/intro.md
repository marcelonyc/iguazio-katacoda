# AI/ML Experiment tracking with MLRun

## Intro to MLRun for Experiment tracking. 

MLRun is a generic and convenient mechanism for data scientists and software developers to describe and run tasks related to machine learning (ML) in various, scalable runtime environments and ML pipelines while automatically tracking executed code, metadata, inputs, and outputs. MLRun integrates with the Nuclio serverless project and with Kubeflow Pipelines.

To fully take advantage of MLRun, you need to deploy the mlrun-api to a Kubernetes cluster. For the purpose of this course, we deployed all the components as described in this architecture.

You will interact with MLRun through Jupyter Notebooks to execute and track experiements. 

<a href="https://www.iguazio.com">Iguazio</a> offers MLRun as a managed service as part of our Data Science Platform.

![MLRun Architecture](https://github.com/marcelonyc/iguazio-katacoda/blob/master/mlrun/assets/MLRunArchitecture.png?raw=true)
