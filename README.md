# devops-kit

[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![GitHub last commit (branch)](https://img.shields.io/github/last-commit/wolffaxn/devops-toolkit/main.svg)](https://github.com/wolffaxn/devops-toolkit)

> A Docker image with Azure-CLI, Helm, Kubectl and Terraform installed.

## Build

Run this command to build an image.

```
make
```

## Run

### Run azure-cli

```
❯ docker run --rm -it wolffaxn/devops-toolkit:0.1.0 az version
{
  "azure-cli": "2.36.0",
  "azure-cli-core": "2.36.0",
  "azure-cli-telemetry": "1.0.6",
  "extensions": {}
}

```

### Run helm

```
❯ docker run --rm -it wolffaxn/devops-toolkit:0.1.0 helm version --short
v3.8.2+g6e3701e

```

### Run kubectl

```
❯ docker run --rm -it wolffaxn/devops-toolkit:0.1.0 kubectl version --client -o json
{
  "clientVersion": {
    "major": "1",
    "minor": "23",
    "gitVersion": "v1.23.6",
    "gitCommit": "ad3338546da947756e8a88aa6822e9c11e7eac22",
    "gitTreeState": "clean",
    "buildDate": "2022-04-14T08:49:13Z",
    "goVersion": "go1.17.9",
    "compiler": "gc",
    "platform": "linux/amd64"
  }
}

```

### Run terraform

```
❯ docker run --rm -it wolffaxn/devops-toolkit:0.1.0 terraform version
Terraform v1.1.9
on linux_amd64

```

## License

Released under the MIT License. See [license](LICENSE.md) for details.

