# Example from Camunda Summit
This demo has been presented at the [Camunda Community Summit 2021](https://summit.camunda.com/).

# How to run the demo

## Prepare machine
1. Install [python](https://www.python.org/downloads/)
1. Clone this repository.
1. Open command line in your local repository
1. Install dependencies by running  `pip install -r requirements.txt -U`

You're ready to go.

## Run demo
1. Upload the model from `bpmn` folder to your Camunda platform
1. Start a process instance by running `robot -d logs -b console.log tasks/00_start_challenge.robot`
1. Start downloading excel file by running `robot -d logs -b console.log tasks/10_download_excel.robot`
1. Start RPAChallenge in Webbrowser by running `robot -d logs -b console.log tasks/20_run_challenge.robot`

## Troubleshooting
### Task does not find Camunda Host
The tasks assume that Camunda Platform is running on `http://localhost:8080`. If it does not run on localhost, you need to provide the url
on command line by adding the `-v CAMUNDA_HOST:your_camunda_url`, for example:

```shell
robot -d logs -b console.log -v CAMUNDA_HOST:https://my.camunda.testinstance.io tasks/00_start_challenge.robot
```

### Where do I find logs and reports?
You can define the output folder with the `-d` flag on command line, for instance: `-d logs`

### Are there logs for debugging?
Yes. You can activate a debug logfile with `-b` flag on command line, for instance: `-b console.log`